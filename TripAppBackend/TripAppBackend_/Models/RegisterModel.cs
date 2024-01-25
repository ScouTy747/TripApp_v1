using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace TripAppBackend_.Models
{
    public class RegisterModel : IdentityUser
    {
        [Required]
        [StringLength(50, MinimumLength = 3)]
        public string UserName { get; set; }

        [Required]
        [MinLength(6)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        [EmailAddress]
        [StringLength(255)]
        public string Email
        { get; set; }

        public record UserDetails(string Username, string Email);



    }
}