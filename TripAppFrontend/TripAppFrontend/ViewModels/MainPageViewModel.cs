using Microsoft.Toolkit.Mvvm.ComponentModel;
using System.Diagnostics;

namespace TripAppFrontend.ViewModels
{
    public class MainPageViewModel : ObservableObject
    {
        private int _userId;
        private string _userName;
        private string _email;

        public int UserId
        {
            get => _userId;
            set => SetProperty(ref _userId, value);
        }

        public string UserName
        {
            get => _userName;
            set => SetProperty(ref _userName, value);
        }

        public string Email
        {
            get => _email;
            set => SetProperty(ref _email, value);
        }

        public void UpdateUserInfo(string userName, string email, int userId)
        {
            UserName = userName;
            Email = email;
            UserId = userId;

            Debug.WriteLine($"Updated UserInfo: UserId={userId}, UserName={userName}, Email={email}");

            OnPropertyChanged(nameof(UserId));
            OnPropertyChanged(nameof(Email));
            OnPropertyChanged(nameof(UserName));
        }
    }
}
