using TripAppFrontend.ViewModels;

namespace TripAppFrontend;

public partial class SignUp : ContentPage
{
    private SignUpViewModel _viewModel;

    public SignUp()
    {
        InitializeComponent();
        _viewModel = new SignUpViewModel();
        BindingContext = _viewModel;
    }

    private async void SignUpButton_Clicked(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(_viewModel.UserName) || string.IsNullOrWhiteSpace(_viewModel.Password) || string.IsNullOrWhiteSpace(_viewModel.Email))
        {
            await DisplayAlert("Error", "Please fill in all fields", "OK");
            return;
        }

        var userData = new Dictionary<string, string>
        {
            { "UserName", _viewModel.UserName },
            { "Password", _viewModel.Password },
            { "Email", _viewModel.Email }
        };

        var jsonUserData = Newtonsoft.Json.JsonConvert.SerializeObject(userData);

        var apiEndpoint = "http://localhost:5115/api/Users/register";
        var httpClient = new System.Net.Http.HttpClient();
        var content = new System.Net.Http.StringContent(jsonUserData, System.Text.Encoding.UTF8, "application/json");

        try
        {
            var response = await httpClient.PostAsync(apiEndpoint, content);

            if (response.IsSuccessStatusCode)
            {
                await DisplayAlert("Success", "User registered successfully", "OK");
            }
            else
            {
                await DisplayAlert("Error", "Failed to register user", "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"Exception: {ex.Message}", "OK");
        }
    }

    private async void SignInLabel_Tapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync($"//LoginPage");
    }
}
