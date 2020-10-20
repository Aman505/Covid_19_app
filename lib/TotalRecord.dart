class TotalRecord {
  int active;
  int confirmed;
  int recovered;
  int deaths;
  String state;

  TotalRecord(
      {this.active, this.confirmed, this.recovered, this.deaths, this.state});

  factory TotalRecord.fromJson(Map<String, dynamic> responseJson) {
    return TotalRecord(
      active: responseJson['active'],
      confirmed: responseJson['confirmed'],
      recovered: responseJson['recovered'],
      deaths: responseJson['deaths'],
      state: responseJson['state'],
    );
  }
}
