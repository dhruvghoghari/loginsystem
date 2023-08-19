import 'package:flutter/material.dart';
import 'package:loginsystem/Screens/Salary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {

  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();

  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("name"))
      {
        _name.text = prefs.getString("name").toString();
        _salary.text = prefs.getString("salary").toString();
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller:_name,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Name",
                        prefixIcon:Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller:_salary,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Salary",
                          prefixIcon:Icon(Icons.money),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(onPressed: () async{

                      var nm = _name.text.toString();
                      var sal = _salary.text.toString();

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("name", nm);
                      prefs.setString("salary", sal);

                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Salary(
                        name: nm,
                        salary: sal,
                      )),
                      );
                    }, child: Text("Submit"))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
