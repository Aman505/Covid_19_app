class Hospitals {
  bool success;
  Data data;
  String lastRefreshed;
  String lastOriginUpdate;

  Hospitals(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  Hospitals.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['lastRefreshed'] = this.lastRefreshed;
    data['lastOriginUpdate'] = this.lastOriginUpdate;
    return data;
  }
}

class Data {
  List<MedicalColleges> medicalColleges;
  List<String> sources;

  Data({this.medicalColleges, this.sources});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['medicalColleges'] != null) {
      medicalColleges = new List<MedicalColleges>();
      json['medicalColleges'].forEach((v) {
        medicalColleges.add(new MedicalColleges.fromJson(v));
      });
    }
    sources = json['sources'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.medicalColleges != null) {
      data['medicalColleges'] =
          this.medicalColleges.map((v) => v.toJson()).toList();
    }
    data['sources'] = this.sources;
    return data;
  }
}

class MedicalColleges {
  String state;
  String name;
  String city;
  String ownership;
  int admissionCapacity;
  int hospitalBeds;

  MedicalColleges(
      {this.state,
      this.name,
      this.city,
      this.ownership,
      this.admissionCapacity,
      this.hospitalBeds});

  MedicalColleges.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    name = json['name'];
    city = json['city'];
    ownership = json['ownership'];
    admissionCapacity = json['admissionCapacity'];
    hospitalBeds = json['hospitalBeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['name'] = this.name;
    data['city'] = this.city;
    data['ownership'] = this.ownership;
    data['admissionCapacity'] = this.admissionCapacity;
    data['hospitalBeds'] = this.hospitalBeds;
    return data;
  }
}
