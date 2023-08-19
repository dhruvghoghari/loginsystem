import 'package:flutter/material.dart';
import 'package:loginsystem/LogIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  checklogin() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
      {

        Navigator.pop(context);
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    else
      {

        Navigator.pop(context);
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => LogIn()),
        );
      }
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      checklogin();
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LOGO"),
      ),
    );
  }
}