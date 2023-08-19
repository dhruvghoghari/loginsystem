import 'package:flutter/material.dart';
import 'package:loginsystem/LogIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(onPressed: () async{
                    SharedPreferences prefs=await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.pop(context);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                  ),
                      child: Text("Logout")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
