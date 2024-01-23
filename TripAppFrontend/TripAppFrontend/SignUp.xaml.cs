using System.Windows.Input;
using TripAppFrontend.ViewModels;

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

        var apiService = new ApiService("adresu_backendu_sem_dám");
        var response = await apiService.RegisterUserAsync(viewModel);

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
