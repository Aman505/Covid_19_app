import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
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
        title: Text(
          'Symptoms',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.greenAccent,
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
                  tag: 'location-img',
                  child: Image.asset(
                    'Images/symptoms.png',
                    height: 300.0,
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TweenAnimationBuilder(
                duration: Duration(seconds: 1),
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Most common Symptoms:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Fever,Cough,Tiredness',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (BuildContext context, double value, Widget child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
              ),
              TweenAnimationBuilder(
                duration: Duration(seconds: 5),
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Less common Symptoms:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'aches and pains, sore throat, diarrhoea, conjunctivitis, headache,loss of taste or smell, a rash on skin',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (BuildContext context, double value, Widget child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
              ),
              TweenAnimationBuilder(
                duration: Duration(seconds: 8),
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Serious Symptoms:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'difficulty breathing or shortness of breath, chest pain or pressure, loss of speech or movement',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (BuildContext context, double value, Widget child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
