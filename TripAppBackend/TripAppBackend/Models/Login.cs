using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TripAppBackend.Models
{
    public class Login
    {
        [NotMapped]
        [Required]
        public string LoginUserName { get; set; } = string.Empty;

        [NotMapped]
        [Required]
        public string LoginPassword { get; set; } = string.Empty;
        public bool IsLoggedIn { get; set; }
    }
}