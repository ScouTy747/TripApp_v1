using TripAppFrontend.ViewModels;


namespace TripAppFrontend;

public partial class Login : ContentPage
{
    private LoginViewModel _loginModel = new LoginViewModel();
    public Login()
	{
		InitializeComponent();
        BindingContext = _loginModel;
    }

    private async void SignUpButton_Clicked(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(_loginModel.UserName) || string.IsNullOrWhiteSpace(_loginModel.Password))
        {
            await DisplayAlert("Error", "Please fill in all fields", "OK");
            return;
        }

        // Create a dictionary to hold the user registration data
        var userData = new Dictionary<string, string>
    {
        { "LoginUserName", _loginModel.UserName },
        { "LoginPassword", _loginModel.Password },
    };

        // Convert the dictionary to a JSON string
        var jsonUserData = Newtonsoft.Json.JsonConvert.SerializeObject(userData);

        // Make a POST request to the API endpoint for user registration
        var apiEndpoint = "http://localhost:5115/api/Users/login"; // Replace with your actual API endpoint
        var httpClient = new System.Net.Http.HttpClient();
        var content = new System.Net.Http.StringContent(jsonUserData, System.Text.Encoding.UTF8, "application/json");

        try
        {
            var response = await httpClient.PostAsync(apiEndpoint, content);

            if (response.IsSuccessStatusCode)
            {
                // Navigate to MainPage.xaml
                await Shell.Current.GoToAsync($"//MainPage");
            }
            else
            {
                // Log or display the response details
                var responseContent = await response.Content.ReadAsStringAsync();
                await DisplayAlert("Error", $"Failed to register user. Status code: {response.StatusCode}\nResponse: {responseContent}", "OK");
            }
        }
        catch (Exception ex)
        {
            await DisplayAlert("Error", $"Exception: {ex.Message}", "OK");
        }
    }

    private async void SignInLabel_Tapped(object sender, EventArgs e)
    {
        // Navigate to the LoginPage.xaml
        await Shell.Current.GoToAsync($"//SignUpPage");
    }
}

