import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _switchValue = false;

  switchdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("Switchvalue"));
    {
      setState(() {
        _switchValue = prefs.getBool("Switchvalue")!;
      });
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Read Receipts",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Switch(
                        value: _switchValue,
                        onChanged: (bool newValue) async{



                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool("Switchvalue",newValue);

                          setState(() {
                            _switchValue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
