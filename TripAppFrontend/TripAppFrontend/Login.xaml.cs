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

        var userData = new Dictionary<string, string>
    {
        { "LoginUserName", _loginModel.UserName },
        { "LoginPassword", _loginModel.Password },
    };

        var jsonUserData = Newtonsoft.Json.JsonConvert.SerializeObject(userData);

        var apiEndpoint = "http://localhost:5115/api/Users/login"; 
        var httpClient = new System.Net.Http.HttpClient();
        var content = new System.Net.Http.StringContent(jsonUserData, System.Text.Encoding.UTF8, "application/json");

        try
        {
            var response = await httpClient.PostAsync(apiEndpoint, content);

            if (response.IsSuccessStatusCode)
            {
                await Shell.Current.GoToAsync($"//MainPage");
            }
            else
            {
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
        await Shell.Current.GoToAsync($"//SignUpPage");
    }
}

