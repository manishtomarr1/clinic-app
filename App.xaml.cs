namespace MauiApp1
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new AppShell();

            // Navigate to LoginPage on startup
            Shell.Current.GoToAsync("//LoginPage");
        }
    }
}
