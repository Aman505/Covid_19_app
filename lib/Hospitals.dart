class Hospitals{
  bool success;
  HospitalData hospitalData;
  Hospitals({this.success,this.hospitalData});
  factory Hospitals.fromjson(Map<String, dynamic> json){
    return Hospitals(
      success: json['success'],
      hospitalData:json['data']
    );
  }
}
class HospitalData {
  List<MedicalColleges> medicalcolleges=new List<MedicalColleges>();
  HospitalData({this.medicalcolleges});
   HospitalData.fromjson(Map<String, dynamic> json){
   // return HospitalData(
     // medicalcolleges: List<MedicalColleges>.from(json['medicalColleges'].map((x)=>MedicalColleges.fromjson(x))),
       if (json['medicalColleges'] != null) {
     json['medicalColleges'].foreach((v){
       medicalcolleges.add(new MedicalColleges.fromjson(v));
     });
   }

     // );
  // }
  // Map<String,dynamic> toJson() {
  //   return {
  //   'medicalColleges': List<dynamic>.from(medicalcolleges.map((e) => e.toJson()))
  // };
}}
class MedicalColleges {
  String state;
  String name;
  String city;
  String ownership;
  String hospitalBeds;

  MedicalColleges(
      {this.state, this.name, this.city, this.ownership, this.hospitalBeds});

  factory MedicalColleges.fromjson(Map<String, dynamic> json){
    return MedicalColleges(
        state: json['state'].toString(),
        name: json['name'].toString(),
        city: json['city'].toString(),
        ownership: json['ownership'].toString(),
        hospitalBeds: json['hospitalBeds'].toString()
    );
  }
}
//   Map<String,dynamic> toJson() {
//     return {
//       'state': state,
//       'name': name,
//       'city': city,
//       'ownership': ownership,
//       'hospitalBeds': hospitalBeds,
//     };
//   }
// }