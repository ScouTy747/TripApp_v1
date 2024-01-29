namespace TripAppBackend.Models
{
    public class LoginResponse
    {
        public int UserId { get; set; } = 0;
        public string UserName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
    }
}
