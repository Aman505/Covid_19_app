class StateData {
  String id;
  String active;
  String confirmed;
  String recovered;
  String deaths;
  String state;

  StateData({
    this.id,
    this.active,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.state,
  });

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      id: json['id'].toString(),
      active: json['active'].toString(),
      confirmed: json['confirmed'].toString(),
      recovered: json['recovered'].toString(),
      deaths: json['deaths'].toString(),
      state: json['state'].toString(),
    );
  }
}
