using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;



namespace TripAppBackend_.Models
{
    public class LoginModel
    {
        [Required]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }

    [JsonSerializable(typeof(LoginModel))]
    public partial class MyContext : JsonSerializerContext { }

}
