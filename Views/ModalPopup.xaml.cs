using Microsoft.Maui.Controls;

namespace MauiApp1.Views
{
    public partial class ModalPopup : ContentView
    {
        public ModalPopup()
        {
            InitializeComponent();
        }

        public void SetData(string title, string description)
        {
            TitleLabel.Text = title;
            DescriptionLabel.Text = description;
            IsVisible = true;
        }

        private void OnCloseClicked(object sender, EventArgs e)
        {
            IsVisible = false;
        }
    }
}
