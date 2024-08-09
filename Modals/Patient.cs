namespace MauiApp1.Models
{
    public class Patient
    {
        public int PatientID { get; set; }
        public string Name { get; set; }
        public int Age { get; set; }
        public string Address { get; set; }
        public string MobileNumber { get; set; }
        public string TreatmentStatus { get; set; }
        public decimal BalanceAmount { get; set; }
        public DateTime? LastVisit { get; set; }
        public DateTime? NextAppointmentDate { get; set; } // New property

        public ICollection<Visit> Visits { get; set; }
        public string TreatmentStatusColor // New property for color indicator
        {
            get
            {
                return TreatmentStatus == "Ongoing" ? "Green" : "Orange";
            }
        }
    }
}
