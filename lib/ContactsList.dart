import 'package:covid19app/Contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'NetworkCallDemo.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  Future<Contacts> total;
  List<RegionalData> list = new List();

  @override
  void initState() {
    /* total = NetworkCallDemo().fetch_HospitalList().then((value) {
      list.addAll(value.data.medicalColleges);
      print('ListValue ${list.length}');
    });*/
    NetworkCallDemo().getContacts().then(
      (value) {
        var response = Contacts.fromJson(value);
        setState(() {
          list.addAll(response.data.contactData.regionalList);
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
            ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async {
                      await _makingPhoneCall("tel:${list[index].number}");
                    },
                    title: Text(list[index].loc),
                    subtitle: Text('${list[index].number}'),
                  );
                }));
  }
}

/*
class ErrorUI extends StatelessWidget {
  String errorMsg;

  ErrorUI({this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Text('$errorMsg');
  }
}

_launchURL(String url) async {
  await launch(url);
  // if (await canLaunch("https://www.google.co.in")) {
  // } else {
  //   throw 'Could not launch $url';
  // }
}*/
_makingPhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
