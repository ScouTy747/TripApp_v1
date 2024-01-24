using System.Text;
using System.Windows.Input;
using TripAppFrontend.ViewModels;
using Newtonsoft.Json;

namespace TripAppFrontend;



public partial class SignUp : ContentPage
{
    private async void SignUpButton_Clicked(object sender, EventArgs e)
    {
        var viewModel = new SignUpViewModel
        {
            UserName = UserNameEntry.Text,
            Password = PasswordEntry.Text,
            Email = EmailEntry.Text
        };

        var apiService = new ApiService("http://localhost:5011/");
        var request = new HttpRequestMessage(HttpMethod.Post, "/api/Register"); 
        request.Content = new StringContent(JsonConvert.SerializeObject(viewModel), Encoding.UTF8, "application/json");


        var response = await apiService.SendAsync(request);

        if (response != null && response.IsSuccessStatusCode)
        {
            await DisplayAlert("Success", "Registration successful", "OK");
        }
        else
        {
            var errorMessage = await response.Content.ReadAsStringAsync();
            await DisplayAlert("Error", errorMessage, "OK");
        }
    }
}
