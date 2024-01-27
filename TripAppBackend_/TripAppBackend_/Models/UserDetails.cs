namespace TripAppBackend_.Models
{
    public class UserDetails
    {
        public string UserName { get; set; }
        public string Email { get; set; }

        public UserDetails(string userName, string email)
        {
            UserName = userName;
            Email = email;
        }
    }
}
