namespace TripAppFrontend;

public partial class UserEdit : ContentPage
{
	public UserEdit()
	{
		InitializeComponent();
	}

    private async void SignInLabel_Tapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync($"//MainPage");
    }
}