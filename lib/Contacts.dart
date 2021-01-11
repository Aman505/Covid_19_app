class Contacts {
  bool success;
  Data data;

  Contacts({this.success, this.data});

  Contacts.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  ContactData contactData;

  Data({this.contactData});

  Data.fromJson(Map<String, dynamic> json) {
    contactData = json['contacts'] != null
        ? new ContactData.fromJson(json['contacts'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contactData != null) {
      data['contacts'] = this.contactData.toJson();
    }
    return data;
  }
}

class ContactData {
  PrimaryData primary;
  List<RegionalData> regionalList;

  ContactData({this.primary, this.regionalList});

  ContactData.fromJson(Map<String, dynamic> json) {
    primary = json['primary'] != null
        ? new PrimaryData.fromJson(json['primary'])
        : null;

    if (json['regional'] != null) {
      regionalList = new List<RegionalData>();
      json['regional'].forEach((v) {
        regionalList.add(new RegionalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.primary != null) {
      data['primary'] = this.primary.toJson();
    }
    if (this.regionalList != null) {
      data['regional'] = this.regionalList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegionalData {
  String loc;
  String number;

  RegionalData({this.loc, this.number});

  RegionalData.fromJson(Map<String, dynamic> json) {
    loc = json['loc'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loc'] = this.loc;
    data['number'] = this.number;
    return data;
  }
}

class PrimaryData {
  String number;
  String numberTollFree;
  String email;

  PrimaryData({this.number, this.numberTollFree, this.email});

  PrimaryData.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    numberTollFree = json['number-tollfree'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['number-tollfree'] = this.numberTollFree;
    data['email'] = this.email;
    return data;
  }
}
