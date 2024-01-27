using System.ComponentModel.DataAnnotations;

namespace TripAppBackend_.Models
{
    public class ExpenseModel
    {
        [Key]
        public string UserId { get; set; }
        public int TripId { get; set; }

        [Required]
        public decimal Amount { get; set; }

        [Required]
        public DateTime Date { get; set; }
        public string Description { get; set; }
        public string Trip { get; set; }
    }
}
