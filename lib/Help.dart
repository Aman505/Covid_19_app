import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help guide',
        style: TextStyle(
          color: Colors.white,
        ) ,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            ClipRRect(
              child: Hero(
                tag: 'guide',
                child: Image.asset('Images/Guidelines-800px.jpg',
                height: 300,
                  fit: BoxFit.fill,
                ),

              ),
            ),
            Card(
              child: ListTile(
                title: Text('List of Covid Hospitals',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            SizedBox(height: 10.0,),
            Card(
              child: ListTile(
                title: Text('Lockdown Guide lines',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            )
          ],
        ),
      ),
    );
  }
}
