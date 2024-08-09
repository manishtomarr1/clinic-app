using MauiApp1.Models;
using MauiApp1.Services;
using Microsoft.Maui.Controls;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MauiApp1.Views
{
    public partial class BalanceRemainingPage : ContentPage
    {
        private readonly PatientService _patientService;

        // Parameterless constructor
        public BalanceRemainingPage()
        {
            InitializeComponent();
            // Manually instantiate the PatientService with the hard-coded connection string
            _patientService = new PatientService();
            LoadPatientsWithBalance();
        }

        // Constructor that accepts PatientService as a dependency (optional)
        public BalanceRemainingPage(PatientService patientService) : this()
        {
            _patientService = patientService;
        }

        private async void LoadPatientsWithBalance()
        {
            try
            {
                var patients = await _patientService.GetPatientsWithBalanceAsync();
                PatientsCollectionView.ItemsSource = patients;
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", "An error occurred while loading patients.", "OK");
            }
        }

        private async void OnBackButtonClicked(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync("..");
        }

        private async void OnViewDetailsClicked(object sender, EventArgs e)
        {
            var button = sender as Button;
            if (button == null)
            {
                Console.WriteLine("Button is null.");
                return;
            }

            var patient = button.BindingContext as PatientViewModel;

            if (patient != null)
            {
                Console.WriteLine($"Navigating to PatientDetailPage with ID: {patient.PatientID}");
                await Shell.Current.GoToAsync($"///PatientDetailPage?patientId={patient.PatientID}");
            }
            else
            {
                Console.WriteLine("Patient data is null, navigation aborted.");
            }
        }
    }
}
