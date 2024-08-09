using System;
using System.Collections.Generic;
using Microsoft.Maui.Controls;
using Newtonsoft.Json;
using MauiApp1.Models;
using System.Linq;

namespace MauiApp1.Views
{
    public partial class VisitsPage : ContentPage, IQueryAttributable
    {
        public List<Visit> Visits { get; set; }
        public decimal TotalRemainingBalance { get; set; }

        public VisitsPage()
        {
            InitializeComponent();
        }

        public void ApplyQueryAttributes(IDictionary<string, object> query)
        {
            if (query.TryGetValue("visits", out var visitsData) && visitsData is string visitsJson)
            {
                try
                {
                    visitsJson = Uri.UnescapeDataString(visitsJson); // Decode the URL-encoded string
                    Visits = JsonConvert.DeserializeObject<List<Visit>>(visitsJson);

                    // Calculate total remaining balance
                    TotalRemainingBalance = Visits.Sum(v => v.BalanceAmount);

                    // Bind the Visits list to the UI
                    BindingContext = this;
                }
                catch (JsonReaderException)
                {
                    DisplayError("Failed to parse visit data.");
                }
            }
            else
            {
                DisplayError("No visit data received.");
            }
        }

        private Visit _lastSelectedVisit;

        private async void OnVisitSelected(object sender, SelectionChangedEventArgs e)
        {
            if (e.CurrentSelection != null && e.CurrentSelection.Count > 0)
            {
                var selectedVisit = e.CurrentSelection[0] as Visit;

                if (selectedVisit != null && _lastSelectedVisit != selectedVisit)
                {
                    _lastSelectedVisit = selectedVisit;
                    var visitDetails = $"Visit Date: {selectedVisit.VisitDate:dd/MM/yyyy}\n" +
                                       $"Medicines Prescribed: {selectedVisit.MedicinesPrescribed}\n" +
                                       $"Remaining Balance: {selectedVisit.BalanceAmount:C}";

                    await DisplayAlert("Visit Details", visitDetails, "OK");

                    // Deselect the item after showing details to allow re-selecting the same item
                    ((CollectionView)sender).SelectedItem = null;

                    // Reset the last selected visit after a delay
                    Device.StartTimer(TimeSpan.FromMilliseconds(100), () =>
                    {
                        _lastSelectedVisit = null;
                        return false;
                    });
                }
            }
        }

        private async void DisplayError(string message)
        {
            await DisplayAlert("Error", message, "OK");
        }
    }
}
