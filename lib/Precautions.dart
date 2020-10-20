import 'package:flutter/material.dart';

class Precautions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title:Text('Precautions',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              ClipRRect(
                child: Hero(
                  tag: 'location2-img',
                  child: Image.asset('Images/precautions.png',
                    height: 300.0,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('To prevent the spread of COVID-19:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.asset('Images/washing-hands.png'),
                  ),
                  title: Text('Clean your hands often. Use soap and water, or an alcohol-based hand rub.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.asset('Images/social-distancing.png'),
                  ),
                  title: Text('Maintain a safe distance from anyone who is coughing or sneezing.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.asset('Images/face-mask.png'),
                  ),
                  title: Text('Wear a mask when physical distancing is not possible.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Card(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(3.0),
                    child: Image.asset('Images/doctor.png'),
                  ),
                  title: Text('If you have a fever, cough and difficulty breathing, seek medical attention.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
