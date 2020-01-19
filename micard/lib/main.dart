import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("images/IMG.jpg"),
              ),
              Text(
                "John Doe",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Devonshire"),
              ),
              Text(
                "SOFTWARE DEVELOPER",
                style: TextStyle(
                    fontFamily: "SourceSans",
                    fontSize: 20,
                    fontStyle: FontStyle.italic),
              ),
              SizedBox(
                height: 10,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade200,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(Icons.call, color: Colors.teal),
                      title: Text(
                        "9512345678",
                        style: TextStyle(
                            fontFamily: "SourceSans",
                            fontSize: 20,
                            color: Colors.teal.shade900),
                      ),
                    )),
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: Icon(Icons.mail, color: Colors.teal),
                      title: Text(
                        "johndoe@gmail.com",
                        style: TextStyle(
                          fontFamily: "SourceSans",
                          fontSize: 20,
                          color: Colors.teal.shade900,
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
