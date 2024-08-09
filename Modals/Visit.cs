namespace MauiApp1.Models
{
    public class Visit
    {
        public int VisitID { get; set; }
        public int PatientID { get; set; }
        public DateTime VisitDate { get; set; }
        public TimeSpan VisitTime { get; set; }
        public string MedicinesPrescribed { get; set; }
        public DateTime? NextAppointmentDate { get; set; }
        public decimal BalanceAmount { get; set; }

        public Patient Patient { get; set; }
    }
}
