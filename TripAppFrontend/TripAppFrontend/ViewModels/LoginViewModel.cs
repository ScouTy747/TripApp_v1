using Microsoft.Toolkit.Mvvm.ComponentModel;
using Microsoft.Toolkit.Mvvm.Input;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace TripAppFrontend.ViewModels
{
    public class LoginViewModel : ObservableObject
    {
        private string _userName;
        private string _password;

        public string UserName
        {
            get => _userName;
            set => SetProperty(ref _userName, value);
        }

        public string Password
        {
            get => _password;
            set => SetProperty(ref _password, value);
        }

        public AsyncRelayCommand LoginCommand { get; }

        public LoginViewModel()
        {
            LoginCommand = new AsyncRelayCommand(LoginAsync);
        }

        private async Task LoginAsync()
        {
            var loginData = new { UserName = _userName, Password = _password };
            var jsonLoginData = Newtonsoft.Json.JsonConvert.SerializeObject(loginData);

            var apiEndpoint = "http://localhost:5115/api/Users/login";
            var httpClient = new HttpClient();
            var content = new StringContent(jsonLoginData, System.Text.Encoding.UTF8, "application/json");

            try
            {
                var response = await httpClient.PostAsync(apiEndpoint, content);

                if (response.IsSuccessStatusCode)
                {
                    // Successful login
                    // Redirect to MainPage.xaml
                    await Shell.Current.GoToAsync("//MainPage");
                }
                else
                {
                    // Display error message for unsuccessful login
                   
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                
            }
        }
    }
}
