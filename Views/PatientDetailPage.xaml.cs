using MauiApp1.Models;
using MauiApp1.Services;
using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace MauiApp1.Views
{
    public partial class PatientDetailPage : ContentPage, IQueryAttributable
    {
        private readonly PatientService _patientService;
        public int PatientId { get; set; }
        public List<Visit> Visits { get; set; }

        // Parameterless constructor
        public PatientDetailPage()
        {
            InitializeComponent();
            // Manually instantiate the PatientService with the hard-coded connection string
            _patientService = new PatientService();
        }

        // Constructor that accepts PatientService as a dependency (optional)
        public PatientDetailPage(PatientService patientService) : this()
        {
            _patientService = patientService;
        }

        public void ApplyQueryAttributes(IDictionary<string, object> query)
        {
            if (query.TryGetValue("patientId", out var patientId))
            {
                PatientId = Convert.ToInt32(patientId);
            }
        }

        protected override async void OnNavigatedTo(Microsoft.Maui.Controls.NavigatedToEventArgs args)
        {
            base.OnNavigatedTo(args);
            await LoadPatientDetails(PatientId);
        }

        private async Task LoadPatientDetails(int patientId)
        {
            var patient = await _patientService.GetPatientDetailsAsync(patientId);
            if (patient != null)
            {
                BindingContext = patient;
                await LoadPatientVisits(patientId); // Load visits when loading patient details
            }
            else
            {
                await DisplayAlert("Error", "Patient not found.", "OK");
            }
        }

        private async Task LoadPatientVisits(int patientId)
        {
            Visits = await _patientService.GetAllVisitsByPatientIdAsync(patientId);
        }

        private async void OnViewAllVisitsClicked(object sender, EventArgs e)
        {
            var visitsData = Uri.EscapeDataString(JsonConvert.SerializeObject(Visits));
            await Shell.Current.GoToAsync($"VisitsPage?visits={visitsData}");
        }

        private async void OnAddVisitClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync($"AddVisitPage?patientId={PatientId}");
        }

        private async void OnCompleteTreatmentClicked(object sender, EventArgs e)
        {
            var isConfirmed = await DisplayAlert("Confirm", "Are you sure you want to mark this treatment as completed?", "Yes", "No");
            if (isConfirmed)
            {
                var result = await _patientService.UpdateTreatmentStatusAsync(PatientId, "Completed");
                if (result)
                {
                    await DisplayAlert("Success", "Treatment marked as completed.", "OK");
                    await LoadPatientDetails(PatientId); // Refresh the patient details
                }
                else
                {
                    await DisplayAlert("Error", "Failed to update treatment status.", "OK");
                }
            }
        }

        private async void OnDeletePatientClicked(object sender, EventArgs e)
        {
            var patient = await _patientService.GetPatientDetailsAsync(PatientId);
            if (patient.BalanceAmount > 0)
            {
                var isConfirmed = await DisplayAlert("Confirm", $"This patient has an outstanding balance of {patient.BalanceAmount:C}. Are you sure you want to delete this patient?", "Yes", "No");
                if (!isConfirmed) return;
            }

            var deleteConfirmed = await DisplayAlert("Confirm", "Are you sure you want to delete this patient?", "Yes", "No");
            if (deleteConfirmed)
            {
                var result = await _patientService.DeletePatientAsync(PatientId);
                if (result)
                {
                    await DisplayAlert("Success", "Patient deleted successfully.", "OK");
                    await Shell.Current.GoToAsync(".."); // Navigate back after deletion
                }
                else
                {
                    await DisplayAlert("Error", "Failed to delete patient.", "OK");
                }
            }
        }
    }
}
