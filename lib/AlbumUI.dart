import 'package:covid19app/TotalRecord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/NetworkCallDemo.dart';

class AlbumUI extends StatefulWidget {
  @override
  _AlbumUiState createState() => _AlbumUiState();
}

class _AlbumUiState extends State<AlbumUI> {
  Future<TotalRecord> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = NetworkCallDemo().fetchTotalRecord();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Demo'),
      ),
      body: FutureBuilder<TotalRecord>(
        future: futureAlbum,
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            return finaldata(totaldata: snapshot.data);
          } else if (snapshot.hasError) {
            return Statedata(statedata: snapshot.error);
          }
          return Text('Error');
        },
      ),
    );
  }
}
class finaldata extends StatelessWidget {
  TotalRecord totaldata;
  finaldata({this.totaldata});

  @override
  Widget build(BuildContext context) {
    return Text('${totaldata.active}');
  }
}
class Statedata extends StatelessWidget {
  String statedata;
  Statedata({this.statedata});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('${statedata}'),

    );
  }
}

