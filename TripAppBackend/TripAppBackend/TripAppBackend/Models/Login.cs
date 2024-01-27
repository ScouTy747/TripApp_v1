using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TripAppBackend.Models
{
    public class Login
    {
        // Existing properties from the Users class
        // Adding new properties for login credentials
        [NotMapped]
        [Required(ErrorMessage = "Username is required")]
        public string LoginUserName { get; set; }

        [NotMapped]
        [Required(ErrorMessage = "Password is required")]
        public string LoginPassword { get; set; }
        public bool IsLoggedIn { get; set; }
    }
}