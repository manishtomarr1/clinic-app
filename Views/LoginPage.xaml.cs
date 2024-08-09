using MauiApp1.Services;

namespace MauiApp1.Views
{
    public partial class LoginPage : ContentPage
    {
        private readonly DatabaseService _databaseService;

        // Parameterless constructor
        public LoginPage()
        {
            InitializeComponent();
            // Manually instantiate the DatabaseService with the hard-coded connection string
            _databaseService = new DatabaseService();
        }

        // Constructor that accepts DatabaseService as a dependency
        public LoginPage(DatabaseService databaseService) : this()
        {
            _databaseService = databaseService; // Use the injected DatabaseService
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            // Clear the username and password fields when the page appears
            UsernameEntry.Text = string.Empty;
            PasswordEntry.Text = string.Empty;
        }

        private async void OnLoginClicked(object sender, EventArgs e)
        {
            var username = UsernameEntry.Text;
            var password = PasswordEntry.Text;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                DisplayMessage("Please enter both username and password.", false);
                return;
            }

            var loginSuccess = _databaseService.ValidateUser(username, password);

            if (loginSuccess)
            {
                DisplayMessage("Login successful!", true);
                await Task.Delay(100);

                // Navigate to MainPage and reset the navigation stack
                await Shell.Current.GoToAsync("//MainPage");
            }
            else
            {
                DisplayMessage("Invalid username or password.", false);
            }
        }

        private async void DisplayMessage(string message, bool isSuccess)
        {
            MessageLabel.Text = message;
            MessageLabel.TextColor = isSuccess ? Colors.Green : Colors.Red;
            MessageLabel.IsVisible = true;

            // Hide the message after 3 seconds
            await Task.Delay(3000);
            MessageLabel.IsVisible = false;
        }
    }
}
