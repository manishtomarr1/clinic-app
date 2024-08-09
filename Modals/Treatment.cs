namespace MauiApp1.Models
{
    public class Treatment
    {
        public int TreatmentID { get; set; }
        public int VisitID { get; set; }
        public int DiseaseID { get; set; }
        public string TreatmentDescription { get; set; }
        public DateTime TreatmentDate { get; set; }
    }
}
