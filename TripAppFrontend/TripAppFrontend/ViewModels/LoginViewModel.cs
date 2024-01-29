using Microsoft.Toolkit.Mvvm.ComponentModel;
using Microsoft.Toolkit.Mvvm.Input;
using Newtonsoft.Json;
using System;
using System.Diagnostics;
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

        private string _token;

        public string Token
        {
            get => _token;
            set
            {
                _token = value;
                OnPropertyChanged(nameof(Token));
            }
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
                    var responseContent = await response.Content.ReadAsStringAsync();
                    Debug.WriteLine($"Response Content: {responseContent}");

                    var loginResponse = JsonConvert.DeserializeObject<LoginViewModel>(responseContent);
                    Debug.WriteLine($"Response Content Data: {JsonConvert.SerializeObject(loginResponse)}");

                    if (loginResponse != null)
                    {
                        var token = loginResponse.Token;

                        // Set the JWT token on the MainPageViewModel
                        var mainPageModel = new MainPageViewModel();
                        mainPageModel.JwtToken = token;

                        // Navigate to MainPage
                        await Shell.Current.GoToAsync($"//MainPage");


                        // Display a message to confirm the login
                        Debug.WriteLine("Login Successful", $"You have been logged in successfully.", "OK");
                    }
                    else
                    {
                        Debug.WriteLine("Error", "Invalid response from the server.", "OK");
                    }
                }
                else
                {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    Debug.WriteLine("Error", $"Failed to log in. Status code: {response.StatusCode}\nResponse: {responseContent}", "OK");
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine("Error", $"Exception: {ex.Message}", "OK");
            }
        }

    }
}
