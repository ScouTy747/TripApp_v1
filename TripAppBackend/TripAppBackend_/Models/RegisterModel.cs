using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.Numerics;
using System.Text.Json.Serialization;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace TripAppBackend_.Models
{
    [JsonSerializable(typeof(RegisterModel))]

    public class RegisterModel : IdentityUser
    {
        [Key]
        [JsonPropertyName("username")]
        [StringLength(50, MinimumLength = 3)]
        public required string UserName { get; set; }

        [MinLength(6)]
        [JsonPropertyName("password")]
        [DataType(DataType.Password)]
        public required string Password { get; set; }

        [EmailAddress]
        [JsonPropertyName("email")]
        [StringLength(255)]
        public required string Email { get; set; }

    

    }




}

