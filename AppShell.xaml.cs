using MauiApp1.Views;
namespace MauiApp1
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(PatientDetailPage), typeof(PatientDetailPage));
            Routing.RegisterRoute("VisitsPage", typeof(VisitsPage));
            Routing.RegisterRoute("AddVisitPage", typeof(AddVisitPage));


        }
    }
}
