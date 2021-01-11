import 'package:covid19app/Hospitals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NetworkCallDemo.dart';

class HospitalList extends StatefulWidget {
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  Future<Hospitals> total;
  List<MedicalColleges> list = new List();
  @override
  void initState() {
    /* total = NetworkCallDemo().fetch_HospitalList().then((value) {
      list.addAll(value.data.medicalColleges);
      print('ListValue ${list.length}');
    });*/
    NetworkCallDemo().getColleges().then(
      (value) {
        var response = Hospitals.fromJson(value);
        setState(() {
          list.addAll(response.data.medicalColleges);
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Covid Tracker',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blue[300],
        ),
        body:
            /*FutureBuilder<Hospitals>(
        future: total,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Hospitals h1= (snapshot.data as Hospitals).val;
            return HospitalUI(total: snapshot.data);
          } else if (snapshot.hasError) {
            return ErrorUI(errormsg: snapshot.error);
          }
          return Center(child: Text('Loading...'));
        },
      ),*/
            list.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list[index].name),
                        subtitle: Text('${list[index].state}'),
                      );
                      ;
                    }));
  }
}

// medicalCollegesItem(BuildContext context, int index, HospitalData hospitalData){
//  ListTile(
//    title: Text(hospitalData.medicalColleges[index].name),
//    subtitle: Text('${hospitalData.medicalColleges[index].state}'),
//  )
// }
/*class HospitalUI extends StatelessWidget {
  MedicalColleges total;
  // List<MedicalColleges> medicalColleges;
  HospitalUI({this.total});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(child: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Text(total.data.medicalColleges[index].name),
          subtitle: Text('${total.data.medicalColleges[index].state}'),
        );
      })),
    );
  }
}*/

class ErrorUI extends StatelessWidget {
  String errormsg;

  ErrorUI({this.errormsg});

  @override
  Widget build(BuildContext context) {
    return Text('${errormsg}');
  }
}
