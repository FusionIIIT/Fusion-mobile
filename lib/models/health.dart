class HealthData {
  List? complaints;
  List? medicines;
  List? ambulances;
  List? doctors;
  List? days;
  Map? count;
  List? hospitals;
  List? appointments;
  List? prescription;
  List? schedule;
  HealthData(
      {this.complaints,
      this.medicines,
      this.ambulances,
      this.doctors,
      this.days,
      this.count,
      this.hospitals,
      this.appointments,
      this.prescription,
      this.schedule});
  factory HealthData.fromJson(Map json)
  {
    return HealthData(
      complaints: json["complaints"],
      medicines: json["medicines"],
      ambulances: json["ambulances"],
      doctors: json["doctors"],
      days: json["days"],
      count: json["count"],
      hospitals: json["hospitals"],
      appointments: json["appointments"],
      prescription: json["prescription"],
      schedule: json["schedule"],
    );
  }
    Map<String, dynamic> toJson() {
    return{
      "complaints": this.complaints,
      "medicines": this.medicines,
      "ambulance": this.ambulances,
      "doctors": this.doctors,
      "days": this.days,
      "count": this.count,
      "hospitals": this.hospitals,
      "appointments": this.appointments,
      "prescription": this.prescription,
      "schedule": this.schedule,
    };
  }
}
class StudentMedicalHistory {
  List? medical_history;
  StudentMedicalHistory({this.medical_history});
  factory StudentMedicalHistory.fromJson(Map json) {
    return StudentMedicalHistory(
      medical_history: json["student_complain"],
    );
  }
}
class Doctor {
  final int id;
  final String doctorName;
  final String doctorPhone;
  final String specialization;
  final bool active;

  Doctor({
    required this.id,
    required this.doctorName,
    required this.doctorPhone,
    required this.specialization,
    required this.active,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      doctorName: json['doctor_name'],
      doctorPhone: json['doctor_phone'],
      specialization: json['specialization'],
      active: json['active'],
    );
  }
}