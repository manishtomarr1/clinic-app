using MauiApp1.Models;
using MauiApp1.Services;
using System;
using System.Collections.ObjectModel;
using Microsoft.Maui.Controls;

namespace MauiApp1.Views
{
    public partial class SearchPatientPage : ContentPage
    {
        private readonly PatientService _patientService;
        public ObservableCollection<PatientViewModel> Patients { get; set; }

        // Parameterless constructor
        public SearchPatientPage()
        {
            InitializeComponent();
            // Manually instantiate the PatientService with the hard-coded connection string
            _patientService = new PatientService();
            Patients = new ObservableCollection<PatientViewModel>();
            PatientsCollectionView.ItemsSource = Patients;
        }

        // Constructor that accepts PatientService as a dependency (optional)
        public SearchPatientPage(PatientService patientService) : this()
        {
            _patientService = patientService;
        }

        private async void OnSearchClicked(object sender, EventArgs e)
        {
            string searchQuery = SearchEntry.Text;
            DateTime? searchDate = SearchDatePicker.Date;

            // Clear the existing list
            Patients.Clear();

            if (!string.IsNullOrWhiteSpace(searchQuery))
            {
                // Perform the search by name
                var foundPatients = await _patientService.SearchPatientsByNameAsync(searchQuery);

                if (foundPatients == null || !foundPatients.Any())
                {
                    NoPatientsFoundLabel.IsVisible = true;
                }
                else
                {
                    AddPatientsToCollection(foundPatients);
                }
            }
            else if (searchDate.HasValue)
            {
                // Perform the search by date
                var foundPatients = await _patientService.SearchPatientsByDateAsync(searchDate.Value);

                if (foundPatients == null || !foundPatients.Any())
                {
                    NoPatientsFoundLabel.IsVisible = true;
                }
                else
                {
                    AddPatientsToCollection(foundPatients);
                }
            }
            else
            {
                await DisplayAlert("Error", "Please enter a patient name or select a date to search.", "OK");
            }

            // Hide the message after 3 seconds
            if (NoPatientsFoundLabel.IsVisible)
            {
                await Task.Delay(3000);
                NoPatientsFoundLabel.IsVisible = false;
            }
        }

        private void AddPatientsToCollection(IEnumerable<Patient> patients)
        {
            foreach (var patient in patients)
            {
                Patients.Add(new PatientViewModel
                {
                    PatientID = patient.PatientID,
                    Name = patient.Name,
                    LastVisit = patient.LastVisit,
                    BalanceAmount = patient.BalanceAmount,
                    NextAppointmentDate = patient.NextAppointmentDate,
                    TreatmentStatus = patient.TreatmentStatus,
                    TreatmentStatusColor = patient.TreatmentStatus == "Ongoing" ? Colors.Green : Colors.Orange
                });
            }
        }

        private async void OnViewDetailsClicked(object sender, EventArgs e)
        {
            var button = sender as Button;
            var patient = button?.BindingContext as PatientViewModel;

            if (patient != null)
            {
                // Debugging line to check the patient ID before navigating
                Console.WriteLine($"Navigating to PatientDetailPage with ID: {patient.PatientID}");

                // Navigate using the registered route
                await Shell.Current.GoToAsync($"{nameof(PatientDetailPage)}?patientId={patient.PatientID}");
            }
        }
    }

    public class PatientViewModel
    {
        public int PatientID { get; set; }
        public string Name { get; set; }
        public DateTime? LastVisit { get; set; }
        public decimal BalanceAmount { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public string TreatmentStatus { get; set; }
        public Color TreatmentStatusColor { get; set; }
    }
}
