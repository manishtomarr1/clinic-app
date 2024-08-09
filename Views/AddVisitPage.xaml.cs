using MauiApp1.Models;
using MauiApp1.Services;
using Microsoft.Maui.Controls;
using System;
using System.Windows.Input;
using System.Collections.Generic;

namespace MauiApp1.Views
{
    public partial class AddVisitPage : ContentPage, IQueryAttributable
    {
        private readonly PatientService _patientService;
        private int PatientId { get; set; }

        public ICommand BackCommand { get; }

        // Parameterless constructor
        public AddVisitPage()
        {
            InitializeComponent();
            // Manually instantiate the PatientService with the hard-coded connection string
            _patientService = new PatientService();

            // Command to handle back button
            BackCommand = new Command(async () => await Shell.Current.GoToAsync(".."));

            // Explicitly set the TitleView to avoid overlap issues
            NavigationPage.SetTitleView(this, new Label
            {
                Text = "Add New Visit",
                HorizontalOptions = LayoutOptions.CenterAndExpand,
                VerticalOptions = LayoutOptions.Center,
                FontSize = 20,
                FontAttributes = FontAttributes.Bold,
                TextColor = Colors.Black
            });
        }

        // Constructor that accepts PatientService as a dependency (optional)
        public AddVisitPage(PatientService patientService) : this()
        {
            _patientService = patientService;
        }

        public void ApplyQueryAttributes(IDictionary<string, object> query)
        {
            if (query.ContainsKey("patientId"))
            {
                PatientId = Convert.ToInt32(query["patientId"]);
            }
        }

        private async void OnSaveVisitClicked(object sender, EventArgs e)
        {
            var visit = new Visit
            {
                PatientID = PatientId,
                VisitDate = VisitDatePicker.Date,
                VisitTime = VisitTimePicker.Time,
                MedicinesPrescribed = MedicinesEditor.Text,
                BalanceAmount = decimal.TryParse(BalanceEntry.Text, out var balance) ? balance : 0
            };

            await _patientService.AddVisitAsync(visit);

            await DisplayAlert("Success", "Visit added successfully!", "OK");
            await Shell.Current.GoToAsync(".."); // Navigate back using Shell navigation
        }

        protected override bool OnBackButtonPressed()
        {
            // Handle back button press using Shell navigation
            Shell.Current.GoToAsync("..");
            return true;
        }
    }
}
