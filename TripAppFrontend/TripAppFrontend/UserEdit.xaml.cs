using System;
using System.Diagnostics;
using System.Net.Http;
using System.Threading.Tasks;
using TripAppFrontend.ViewModels;
using Windows.Media.Protection.PlayReady;

namespace TripAppFrontend
{

    public partial class UserEdit : ContentPage
    {
        private MainPageViewModel _mainPageViewModel = new MainPageViewModel();

        public UserEdit()
        {
            InitializeComponent();
        }

        private async void SignInLabel_Tapped(object sender, EventArgs e)
        {
            await Shell.Current.GoToAsync($"//MainPage");
        }

        private async void DeleteAccountLabel_Tapped(object sender, EventArgs e)
        {


            Console.WriteLine($"User ID: {_mainPageViewModel.UserId}");
            Console.WriteLine($"JWT Token: {_mainPageViewModel.JwtToken}");
            



            var result = await DisplayAlert("Confirmation", "Are you sure you want to delete your account?", "Yes", "No");

            if (result)
            {
                string responseContent = await DeleteUserAccount();

                Console.WriteLine($"Delete User Account Response: {responseContent}");

                if (responseContent != null && responseContent.Contains("Account deleted successfully"))
                {
                    await Shell.Current.GoToAsync($"//LoginPage");
                }
                else
                {
                    await DisplayAlert("Error", "Failed to delete the account. Please try again.", "OK");
                }
            }
        }

        private async Task<string> DeleteUserAccount()
        {
            try
            {
                using (HttpClient client = new HttpClient())
                {
                    Debug.WriteLine($"User ID for deletion: {_mainPageViewModel.UserId}");

                    string apiUrl = $"http://localhost:5115/api/users/{_mainPageViewModel.UserId}";

                    client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _mainPageViewModel.JwtToken);

                    try
                    {
                        Debug.WriteLine($"DELETE Request to: {apiUrl}");

                        HttpResponseMessage response = await client.DeleteAsync(apiUrl);

                        Debug.WriteLine($"HTTP Status Code: {response.StatusCode}");

                        return await response.Content.ReadAsStringAsync();
                    }
                    catch (HttpRequestException ex)
                    {
                        Debug.WriteLine($"HTTP Request Exception: {ex.Message}");
                        return null;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Exception during account deletion: {ex.ToString()}");
                return null;
            }
        }




    }
}
