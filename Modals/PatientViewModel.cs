namespace MauiApp1.Models
{
    public class PatientViewModel
    {
        public int PatientID { get; set; }
        public string Name { get; set; }
        public decimal BalanceAmount { get; set; }
        public DateTime? LastVisit { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public string TreatmentStatus { get; set; }
        public Color TreatmentStatusColor { get; set; }
    }
}
