import 'package:flutter/material.dart';
import 'package:loginsystem/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  var em="";
  var pw="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black,
                cursorWidth: 8.0,
                cursorRadius: Radius.circular(10.0),
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.black,
                cursorWidth: 8.0,
                cursorRadius: Radius.circular(10.0),
                decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
            ),
            ElevatedButton(onPressed: ()async{
              var email = _email.text.toString();
              var password = _password.text.toString();

              if(email.length<=0)
                {
                  var snackbar = SnackBar(
                    content: Text("Enter Email"),
                    duration: Duration(seconds:5),
                    backgroundColor: Colors.red,
                    action: SnackBarAction(textColor:Colors.white,label: "Close",onPressed: (){}),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              else if(password.length<=0)
                  {
                    var snackbar = SnackBar(
                      content: Text("Enter Password"),
                      duration: Duration(seconds: 5),
                      backgroundColor: Colors.red,
                      action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){}),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
              else
                {
                  if(email=="test@gmail.com" && password=="123")
                    {

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("islogin", "yes");

                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  else
                    {
                      var snackbar = SnackBar(
                        content: Text("Email or password not correct"),
                        duration: Duration(seconds: 5),
                        backgroundColor: Colors.red,
                        action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){}),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                }

            },style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
                child: Text("LogIn")),
          ],
        ),
      ),
    );
  }
}
