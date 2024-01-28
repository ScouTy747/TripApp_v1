using Newtonsoft.Json;
using TripAppFrontend.ViewModels;
using Microsoft.AspNetCore.Http;
using System.Net.Http;
using System.Diagnostics;

namespace TripAppFrontend
{
    public partial class MainPage : ContentPage
    {
        private MainPageViewModel _mainPageModel = new MainPageViewModel();

        public MainPage()
        {
            InitializeComponent();
            _mainPageModel = new MainPageViewModel();
            BindingContext = _mainPageModel;

            Debug.WriteLine($"BindingContext set to {_mainPageModel}");
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
