using MauiApp1.Models;
using Microsoft.Data.SqlClient;

namespace MauiApp1.Services
{
    public class PatientService
    {
        private readonly string connectionString;

        // Constructor with hard-coded connection string
        public PatientService()
        {
            // Hard-coded connection string
            connectionString = "Server=192.168.1.100\\SQLEXPRESS01;Database=ClinicApp;Trusted_Connection=True;TrustServerCertificate=True;";

        }
        public async Task AddPatientAsync(Patient patient, Visit initialVisit)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("INSERT INTO Patients (Name, Age, Address, MobileNumber, TreatmentStatus, BalanceAmount) " +
                                                           "VALUES (@Name, @Age, @Address, @MobileNumber, @TreatmentStatus, @BalanceAmount); " +
                                                           "SELECT SCOPE_IDENTITY();", connection))
                {
                    command.Parameters.AddWithValue("@Name", patient.Name);
                    command.Parameters.AddWithValue("@Age", patient.Age);
                    command.Parameters.AddWithValue("@Address", patient.Address);
                    command.Parameters.AddWithValue("@MobileNumber", patient.MobileNumber);
                    command.Parameters.AddWithValue("@TreatmentStatus", patient.TreatmentStatus);
                    command.Parameters.AddWithValue("@BalanceAmount", patient.BalanceAmount);

                    // Execute and get the new PatientID
                    int patientID = Convert.ToInt32(await command.ExecuteScalarAsync());

                    // Insert the initial visit
                    await AddVisitAsync(connection, patientID, initialVisit);
                }
            }
        }

        private async Task AddVisitAsync(SqlConnection connection, int patientID, Visit visit)
        {
            using (SqlCommand command = new SqlCommand("INSERT INTO Visits (PatientID, VisitDate, VisitTime, MedicinesPrescribed, NextAppointmentDate, BalanceAmount) " +
                                                       "VALUES (@PatientID, @VisitDate, @VisitTime, @MedicinesPrescribed, @NextAppointmentDate, @BalanceAmount);", connection))
            {
                command.Parameters.AddWithValue("@PatientID", patientID);
                command.Parameters.AddWithValue("@VisitDate", visit.VisitDate);
                command.Parameters.AddWithValue("@VisitTime", visit.VisitTime);
                command.Parameters.AddWithValue("@MedicinesPrescribed", visit.MedicinesPrescribed);
                command.Parameters.AddWithValue("@NextAppointmentDate", visit.NextAppointmentDate.HasValue ? (object)visit.NextAppointmentDate.Value : DBNull.Value);
                command.Parameters.AddWithValue("@BalanceAmount", visit.BalanceAmount);

                await command.ExecuteNonQueryAsync();
            }
        }

        public async Task<List<Patient>> SearchPatientsByNameAsync(string name)
        {
            var patients = new List<Patient>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                using (SqlCommand command = new SqlCommand("SELECT p.PatientID, p.Name, MAX(v.VisitDate) AS LastVisit, SUM(v.BalanceAmount) AS BalanceAmount, " +
                                                           "MIN(v.NextAppointmentDate) AS NextAppointmentDate, p.TreatmentStatus " +
                                                           "FROM Patients p " +
                                                           "LEFT JOIN Visits v ON p.PatientID = v.PatientID " +
                                                           "WHERE p.Name LIKE @Name " +
                                                           "GROUP BY p.PatientID, p.Name, p.TreatmentStatus", connection))
                {
                    command.Parameters.AddWithValue("@Name", "%" + name + "%");

                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new Patient
                            {
                                PatientID = Convert.ToInt32(reader["PatientID"]),
                                Name = reader["Name"].ToString(),
                                LastVisit = reader["LastVisit"] as DateTime?,
                                BalanceAmount = reader["BalanceAmount"] != DBNull.Value ? Convert.ToDecimal(reader["BalanceAmount"]) : 0,
                                NextAppointmentDate = reader["NextAppointmentDate"] as DateTime?,
                                TreatmentStatus = reader["TreatmentStatus"].ToString()
                            };
                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<Patient> GetPatientDetailsAsync(int patientId)
        {
            Patient patient = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                // SQL query to fetch patient details along with the last visit and next appointment date
                string query = @"
            SELECT 
                p.PatientID,
                p.Name,
                p.Age,
                p.Address,
                p.MobileNumber,
                p.TreatmentStatus,
                p.BalanceAmount,
                v.LastVisit,
                v.NextAppointmentDate
            FROM Patients p
            LEFT JOIN (
                SELECT 
                    PatientID,
                    MAX(VisitDate) AS LastVisit,
                    MAX(NextAppointmentDate) AS NextAppointmentDate
                FROM Visits
                GROUP BY PatientID
            ) v ON p.PatientID = v.PatientID
            WHERE p.PatientID = @PatientID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PatientID", patientId);

                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            patient = new Patient
                            {
                                PatientID = Convert.ToInt32(reader["PatientID"]),
                                Name = reader["Name"].ToString(),
                                Age = Convert.ToInt32(reader["Age"]),
                                Address = reader["Address"].ToString(),
                                MobileNumber = reader["MobileNumber"].ToString(),
                                TreatmentStatus = reader["TreatmentStatus"].ToString(),
                                BalanceAmount = reader["BalanceAmount"] != DBNull.Value ? Convert.ToDecimal(reader["BalanceAmount"]) : 0,
                                LastVisit = reader["LastVisit"] != DBNull.Value ? Convert.ToDateTime(reader["LastVisit"]) : (DateTime?)null,
                                NextAppointmentDate = reader["NextAppointmentDate"] != DBNull.Value ? Convert.ToDateTime(reader["NextAppointmentDate"]) : (DateTime?)null
                            };
                        }
                    }
                }
            }

            return patient;
        }


        public async Task<List<PatientViewModel>> GetPatientsWithBalanceAsync()
        {
            var patients = new List<PatientViewModel>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                string query = @"
            SELECT 
                p.PatientID, 
                p.Name, 
                p.BalanceAmount, 
                v.LastVisit, 
                v.NextAppointmentDate, 
                p.TreatmentStatus 
            FROM Patients p
            LEFT JOIN (
                SELECT 
                    PatientID, 
                    MAX(VisitDate) AS LastVisit, 
                    MAX(NextAppointmentDate) AS NextAppointmentDate
                FROM Visits
                GROUP BY PatientID
            ) v ON p.PatientID = v.PatientID
            WHERE p.BalanceAmount > 0";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            patients.Add(new PatientViewModel
                            {
                                PatientID = Convert.ToInt32(reader["PatientID"]),
                                Name = reader["Name"].ToString(),
                                BalanceAmount = reader["BalanceAmount"] != DBNull.Value ? Convert.ToDecimal(reader["BalanceAmount"]) : 0,
                                LastVisit = reader["LastVisit"] != DBNull.Value ? Convert.ToDateTime(reader["LastVisit"]) : (DateTime?)null,
                                NextAppointmentDate = reader["NextAppointmentDate"] != DBNull.Value ? Convert.ToDateTime(reader["NextAppointmentDate"]) : (DateTime?)null,
                                TreatmentStatus = reader["TreatmentStatus"].ToString(),
                                TreatmentStatusColor = reader["TreatmentStatus"].ToString() == "Ongoing" ? Colors.Green : Colors.Orange
                            });
                        }
                    }
                }
            }

            return patients;
        }



        public async Task AddVisitAsync(Visit visit)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                using (SqlCommand command = new SqlCommand(
                    "INSERT INTO Visits (PatientID, VisitDate, VisitTime, MedicinesPrescribed, BalanceAmount) VALUES (@PatientID, @VisitDate, @VisitTime, @MedicinesPrescribed, @BalanceAmount)",
                    connection))
                {
                    command.Parameters.AddWithValue("@PatientID", visit.PatientID);
                    command.Parameters.AddWithValue("@VisitDate", visit.VisitDate);
                    command.Parameters.AddWithValue("@VisitTime", visit.VisitTime);
                    command.Parameters.AddWithValue("@MedicinesPrescribed", visit.MedicinesPrescribed);
                    command.Parameters.AddWithValue("@BalanceAmount", visit.BalanceAmount);

                    await command.ExecuteNonQueryAsync();
                }
            }
        }
        public async Task<List<Visit>> GetAllVisitsByPatientIdAsync(int patientId)
        {
            var visits = new List<Visit>();

            using (var connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();
                string query = "SELECT VisitID, VisitDate, VisitTime, MedicinesPrescribed, BalanceAmount FROM Visits WHERE PatientID = @PatientID";
                using (var command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PatientID", patientId);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            visits.Add(new Visit
                            {
                                VisitID = reader.GetInt32(0),
                                VisitDate = reader.GetDateTime(1),
                                VisitTime = reader.GetTimeSpan(2),
                                MedicinesPrescribed = reader.GetString(3),
                                BalanceAmount = reader.GetDecimal(4)
                            });
                        }
                    }
                }
            }
            return visits;
        }

        public async Task<int> GetOngoingPatientsCountAsync()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();
                var command = new SqlCommand("SELECT COUNT(*) FROM Patients WHERE TreatmentStatus = 'Ongoing'", connection);
                return (int)await command.ExecuteScalarAsync();
            }
        }

        public async Task<int> GetAppointmentsThisWeekCountAsync()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();
                var command = new SqlCommand("SELECT COUNT(*) FROM Visits WHERE VisitDate BETWEEN DATEADD(DAY, 1-DATEPART(WEEKDAY, GETDATE()), CAST(GETDATE() AS DATE)) AND DATEADD(DAY, 7-DATEPART(WEEKDAY, GETDATE()), CAST(GETDATE() AS DATE))", connection);
                return (int)await command.ExecuteScalarAsync();
            }
        }

        public async Task<int> GetAppointmentsTodayCountAsync()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();
                var command = new SqlCommand("SELECT COUNT(*) FROM Visits WHERE VisitDate = CAST(GETDATE() AS DATE)", connection);
                return (int)await command.ExecuteScalarAsync();
            }
        }

        public async Task<List<Patient>> SearchPatientsByDateAsync(DateTime date)
        {
            var patients = new List<Patient>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                string query = @"SELECT p.PatientID, p.Name, MAX(v.VisitDate) AS LastVisit, 
                                SUM(v.BalanceAmount) AS BalanceAmount, 
                                MIN(v.NextAppointmentDate) AS NextAppointmentDate, 
                                p.TreatmentStatus 
                         FROM Patients p 
                         LEFT JOIN Visits v ON p.PatientID = v.PatientID 
                         WHERE v.VisitDate = @Date 
                         GROUP BY p.PatientID, p.Name, p.TreatmentStatus";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Date", date);

                    using (SqlDataReader reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new Patient
                            {
                                PatientID = Convert.ToInt32(reader["PatientID"]),
                                Name = reader["Name"].ToString(),
                                LastVisit = reader["LastVisit"] as DateTime?,
                                BalanceAmount = reader["BalanceAmount"] != DBNull.Value ? Convert.ToDecimal(reader["BalanceAmount"]) : 0,
                                NextAppointmentDate = reader["NextAppointmentDate"] as DateTime?,
                                TreatmentStatus = reader["TreatmentStatus"].ToString()
                            };
                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }


        public async Task<bool> UpdateTreatmentStatusAsync(int patientId, string newStatus)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                string query = "UPDATE Patients SET TreatmentStatus = @NewStatus WHERE PatientID = @PatientID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NewStatus", newStatus);
                    command.Parameters.AddWithValue("@PatientID", patientId);

                    int rowsAffected = await command.ExecuteNonQueryAsync();
                    return rowsAffected > 0;
                }
            }
        }

        public async Task<bool> DeletePatientAsync(int patientId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                // You may want to delete associated visits first if there's a foreign key constraint.
                string deleteVisitsQuery = "DELETE FROM Visits WHERE PatientID = @PatientID";
                using (SqlCommand deleteVisitsCommand = new SqlCommand(deleteVisitsQuery, connection))
                {
                    deleteVisitsCommand.Parameters.AddWithValue("@PatientID", patientId);
                    await deleteVisitsCommand.ExecuteNonQueryAsync();
                }

                // Now delete the patient
                string query = "DELETE FROM Patients WHERE PatientID = @PatientID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@PatientID", patientId);

                    int rowsAffected = await command.ExecuteNonQueryAsync();
                    return rowsAffected > 0;
                }
            }
        }

        public async Task<string> GetAppointmentsTodayDescriptionAsync()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();
                var query = @"
        SELECT p.Name, p.Address, p.MobileNumber 
        FROM Visits v 
        INNER JOIN Patients p ON v.PatientID = p.PatientID 
        WHERE v.VisitDate = CAST(GETDATE() AS DATE)";

                using (var command = new SqlCommand(query, connection))
                {
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        var description = "Appointments Today:\n";
                        while (await reader.ReadAsync())
                        {
                            description += $"- Name: {reader["Name"]}, Address: {reader["Address"]}, Mobile: {reader["MobileNumber"]}\n";
                        }
                        return description;
                    }
                }
            }
        }


        public async Task<string> GetAppointmentsThisWeekDescriptionAsync()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();
                var query = @"
        SELECT p.Name, v.VisitDate, v.VisitTime, p.Address 
        FROM Visits v 
        INNER JOIN Patients p ON v.PatientID = p.PatientID 
        WHERE v.VisitDate BETWEEN DATEADD(DAY, 1-DATEPART(WEEKDAY, GETDATE()), CAST(GETDATE() AS DATE)) 
        AND DATEADD(DAY, 7-DATEPART(WEEKDAY, GETDATE()), CAST(GETDATE() AS DATE))";

                using (var command = new SqlCommand(query, connection))
                {
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        var description = "Appointments This Week:\n";
                        while (await reader.ReadAsync())
                        {
                            var visitDate = ((DateTime)reader["VisitDate"]).ToString("dd/MM/yyyy");
                            description += $"- Name: {reader["Name"]}, Appointment Date: {visitDate}, Time: {reader["VisitTime"]}, Address: {reader["Address"]}\n";
                        }
                        return description;
                    }
                }
            }
        }


        public async Task<string> GetOngoingPatientsDescriptionAsync()
        {
            using (var connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();
                var query = "SELECT Name, Age, MobileNumber, Address FROM Patients WHERE TreatmentStatus = 'Ongoing'";
                using (var command = new SqlCommand(query, connection))
                {
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        var description = "Ongoing Patients:\n";
                        while (await reader.ReadAsync())
                        {
                            description += $"- {reader["Name"]}, Age: {reader["Age"]}, Mobile: {reader["MobileNumber"]}, Address: {reader["Address"]}\n";
                        }
                        return description;
                    }
                }
            }
        }


    }
}
