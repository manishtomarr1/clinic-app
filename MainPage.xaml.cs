using MauiApp1.Models;
using MauiApp1.Services;
using Microsoft.Maui.Controls;
using System;
using System.Threading.Tasks;

namespace MauiApp1.Views
{
    public partial class MainPage : ContentPage
    {
        private readonly PatientService _patientService;

        // Parameterless constructor
        public MainPage()
        {
            InitializeComponent();
            // Manually instantiate the PatientService with the hard-coded connection string
            _patientService = new PatientService();
        }

        // Constructor with dependency injection (still available if needed)
        public MainPage(PatientService patientService) : this()
        {
            _patientService = patientService;
        }

        protected override void OnAppearing()
        {
            base.OnAppearing();
            LoadDashboardCounters();
        }

        private async void LoadDashboardCounters()
        {
            int ongoingPatientsCount = await _patientService.GetOngoingPatientsCountAsync();
            int appointmentsThisWeekCount = await _patientService.GetAppointmentsThisWeekCountAsync();
            int appointmentsTodayCount = await _patientService.GetAppointmentsTodayCountAsync();

            await AnimateCounter(OngoingPatientsCounter, ongoingPatientsCount);
            await AnimateCounter(AppointmentsThisWeekCounter, appointmentsThisWeekCount);
            await AnimateCounter(AppointmentsTodayCounter, appointmentsTodayCount);
        }

        private async void OnViewAllPatientsClicked(object sender, EventArgs e)
        {
            var ongoingPatientsDetails = await _patientService.GetOngoingPatientsDescriptionAsync();
            await DisplayAlert("Ongoing Patients", ongoingPatientsDetails, "OK");
        }

        private async void OnAppointmentsThisWeekClicked(object sender, EventArgs e)
        {
            var appointmentsThisWeekDetails = await _patientService.GetAppointmentsThisWeekDescriptionAsync();
            await DisplayAlert("Appointments This Week", appointmentsThisWeekDetails, "OK");
        }

        private async void OnAppointmentsTodayClicked(object sender, EventArgs e)
        {
            var appointmentsTodayDetails = await _patientService.GetAppointmentsTodayDescriptionAsync();
            await DisplayAlert("Appointments Today", appointmentsTodayDetails, "OK");
        }

        private async Task AnimateCounter(Label counterLabel, int targetValue)
        {
            int currentValue = 0;
            while (currentValue < targetValue)
            {
                currentValue++;
                counterLabel.Text = currentValue.ToString();
                await Task.Delay(50);
            }
        }

        private async void OnAddNewPatientClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new AddNewPatientPage(_patientService));
        }

        private async void OnSearchPatientClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new SearchPatientPage(_patientService));
        }

        private async void OnViewBalanceRemainingClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new BalanceRemainingPage(_patientService));
        }

        private async void OnLogoutClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync("//LoginPage");
        }
    }
}
