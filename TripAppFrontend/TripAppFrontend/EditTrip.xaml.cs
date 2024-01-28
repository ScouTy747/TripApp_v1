namespace TripAppFrontend;

public partial class EditTrip : ContentPage
{
    public EditTrip()
    {
        InitializeComponent();
    }

    private async void SignInLabel_Tapped(object sender, EventArgs e)
    {
        await Shell.Current.GoToAsync($"//MainPage");
    }
}