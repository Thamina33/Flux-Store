import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'prescription.dart';

class MyPrescriptions extends StatefulWidget {
  const MyPrescriptions({Key? key}) : super(key: key);

  @override
  State<MyPrescriptions> createState() => _MyPrescriptionsState();
}

class _MyPrescriptionsState extends State<MyPrescriptions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(0),
              color: Colors.white,
              child: SafeArea(child:
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    SizedBox(width: 12, height: 0),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                          'assets/icons/prescriptions/back_icon.svg',
                          width: 24,
                          height: 24,
                          semanticsLabel: 'A back arrow'
                      ),
                    ),
                    SizedBox(width: 8, height: 0),

                    Text("Prescription",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 16
                      ),),

                  ],
                ),
              ),),
            ),
            Expanded(child: Align(
              alignment: FractionalOffset.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Prescription()));

                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                      color: Colors.pinkAccent,
                      shape: BoxShape.circle
                    ),
                    child: Icon(CupertinoIcons.plus,
                    color: Colors.white,
                    size: 20,),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
