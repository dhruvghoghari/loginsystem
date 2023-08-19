import 'package:flutter/material.dart';

class Salary extends StatefulWidget {
  var name="";
  var salary="";

  Salary({required this.name,required this.salary});

  @override
  State<Salary> createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Text("Result :",style: TextStyle(
                    fontSize: 30.0
                  ),),
                  Text(widget.name.toString()),
                  Text(widget.salary.toString()),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}