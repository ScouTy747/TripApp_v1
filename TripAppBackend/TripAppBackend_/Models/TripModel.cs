using System.ComponentModel.DataAnnotations;

namespace TripAppBackend_.Models
{
    public class TripModel
    {
        public int Id { get; set; }
        public string UserId { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public DateTime StartDate { get; set; }

        [Required]
        public DateTime EndDate { get; set; }

        public string Location { get; set; }

        public ICollection<ExpenseModel> Expenses { get; set; }
    }
}
