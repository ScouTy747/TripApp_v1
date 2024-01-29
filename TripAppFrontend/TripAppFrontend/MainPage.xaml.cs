using Newtonsoft.Json;
using TripAppFrontend.ViewModels;
using Microsoft.AspNetCore.Http;
using System.Net.Http;
using System.Diagnostics;

namespace TripAppFrontend
{
    public partial class MainPage : ContentPage
    {

        private MainPageViewModel _mainPageViewModel = new MainPageViewModel();

        public MainPage()
        {
            InitializeComponent();
            BindingContext = _mainPageViewModel;
        }
        private async void SignInLabel_Tapped(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync($"//EditTripPage");
        }

        private async void SignInLabel_Tapped_UserEdit(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync($"//UserEditPage");
        }
    }

}
