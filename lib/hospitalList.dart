import 'package:covid19app/Hospitals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NetworkCallDemo.dart';

class hospitalList extends StatefulWidget {
  @override
  _hospitalListState createState() => _hospitalListState();
}
class _hospitalListState extends State<hospitalList> {
  Future<Hospitals> total;
  @override
  void initState() {
    total=NetworkCallDemo().fetch_HospitalList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Covid Tracker',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[300],
      ),
      body:  FutureBuilder<Hospitals>(
        future: total,
        builder: (context,snapshot) {
          if (snapshot.hasData)  {
             // Hospitals h1= (snapshot.data as Hospitals).val;
            return HospitalUI(total: snapshot.data);
          } else if (snapshot.hasError) {
            return  ErrorUI(errormsg : snapshot.error);
          }
          return Center(child: Text('Loading...'));
        },
      ),
    );
  }
}
 // medicalCollegesItem(BuildContext context, int index, HospitalData hospitalData){
 //  ListTile(
 //    title: Text(hospitalData.medicalColleges[index].name),
 //    subtitle: Text('${hospitalData.medicalColleges[index].state}'),
 //  )
 // }
class HospitalUI extends StatelessWidget {
   Hospitals total;
   // List<MedicalColleges> medicalColleges;
   HospitalUI({this.total});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        child: ListView.builder(itemBuilder: (context,index){
          return ListTile(
            title: Text(total.hospitalData.medicalcolleges[index].name),
            subtitle: Text('${total.hospitalData.medicalcolleges[index].state}'),
          );
        })
        ),
      );
  }
}
class ErrorUI extends StatelessWidget {
  String errormsg;

  ErrorUI({this.errormsg});

  @override
  Widget build(BuildContext context) {
    return Text('${errormsg}');
  }
}


