using MauiApp1.Models;
using MauiApp1.Services;

namespace MauiApp1.Views
{
    public partial class AddNewPatientPage : ContentPage
    {
        private readonly PatientService _patientService;

        // Parameterless constructor
        public AddNewPatientPage()
        {
            InitializeComponent();
            // Manually instantiate the PatientService with the hard-coded connection string
            _patientService = new PatientService();
        }

        // Constructor that accepts PatientService as a dependency (optional)
        public AddNewPatientPage(PatientService patientService) : this()
        {
            _patientService = patientService;
        }

        private async void OnSaveClicked(object sender, EventArgs e)
        {
            try
            {
                var patient = new Patient
                {
                    Name = NameEntry.Text,
                    Age = int.TryParse(AgeEntry.Text, out int age) ? age : 0,
                    Address = AddressEntry.Text,
                    MobileNumber = MobileNumberEntry.Text,
                    TreatmentStatus = TreatmentStatusPicker.SelectedItem?.ToString(),
                    BalanceAmount = decimal.TryParse(BalanceEntry.Text, out decimal balance) ? balance : 0
                };

                var visit = new Visit
                {
                    VisitDate = VisitDatePicker.Date,
                    VisitTime = VisitTimePicker.Time,
                    MedicinesPrescribed = MedicinesEntry.Text,
                    NextAppointmentDate = NextAppointmentDatePicker.Date,
                    BalanceAmount = decimal.TryParse(BalanceEntry.Text, out decimal visitBalance) ? visitBalance : 0
                };

                // Save the patient details using the service
                await _patientService.AddPatientAsync(patient, visit);

                // Display success message
                await DisplayAlert("Success", "Patient details saved successfully!", "OK");

                // Wait for 2 seconds before navigating back
                await Task.Delay(2000);
                await Navigation.PopAsync(); // Return to the previous page
            }
            catch (Exception ex)
            {
                // Display error message
                await DisplayAlert("Error", $"An error occurred: {ex.Message}", "OK");
            }
        }

        private async void OnCancelClicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync(); // Go back to the previous page without saving
        }
    }
}
