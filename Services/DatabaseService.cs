using MauiApp1.Models;
using Microsoft.Data.SqlClient;

namespace MauiApp1.Services
{
    public class DatabaseService
    {
        private readonly string connectionString;

        // Constructor with hard-coded connection string
        public DatabaseService()
        {
            // Hard-coded connection string
            connectionString = "Server=192.168.1.100\\SQLEXPRESS01;Database=ClinicApp;Trusted_Connection=True;TrustServerCertificate=True;";

        }
        //MANISHTOMAR\SQLEXPRESS01

        // Example method to validate a user
        public bool ValidateUser(string username, string password)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "SELECT COUNT(1) FROM Users WHERE Username=@Username AND Password=@Password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);
                    int count = (int)command.ExecuteScalar();
                    return count > 0;
                }
            }
        }
    }
}
