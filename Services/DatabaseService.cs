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
            connectionString = "Server=(localdb)\\MyLocalDB;Database=ExpenseManagerDB;Trusted_Connection=True;";
        }

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
