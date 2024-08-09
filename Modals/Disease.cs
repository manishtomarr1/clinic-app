namespace MauiApp1.Models
{
    public class Disease
    {
        public int DiseaseID { get; set; }
        public int PatientID { get; set; }
        public string DiseaseName { get; set; }
        public DateTime DiagnosisDate { get; set; }
        public string Status { get; set; }
    }
}
