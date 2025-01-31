import 'package:covid19app/Hospitals.dart';
import 'package:covid19app/Notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'NetworkCallDemo.dart';

class NotificationsList extends StatefulWidget {
  @override
  _NotificationsListState createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  Future<Notifications> total;
  List<NotificationData> list = new List();

  @override
  void initState() {
    /* total = NetworkCallDemo().fetch_HospitalList().then((value) {
      list.addAll(value.data.medicalColleges);
      print('ListValue ${list.length}');
    });*/
    NetworkCallDemo().getNotifications().then(
      (value) {
        var response = Notifications.fromJson(value);
        setState(() {
          list.addAll(response.data.notifications);
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
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Covid Tracker',
            style: TextStyle(
              color: Colors.white,
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
                      await _launchURL(list[index].link);
                      // await _launchURL("https://www.google.co.in");
                    },
                    title: Text(list[index].title),
                    subtitle: Text('${list[index].link}'),
                  );
                  // ;
                }));
  }
}

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
}
