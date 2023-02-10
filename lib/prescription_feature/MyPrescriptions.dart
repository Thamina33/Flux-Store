import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../models/entities/user.dart';
import '../models/user_model.dart';
import 'model/DeletePrescriptionResp.dart';
import 'model/MyPrescriptionResp.dart';
import 'prescription.dart';

class MyPrescriptions extends StatefulWidget {
  const MyPrescriptions({Key? key}) : super(key: key);

  @override
  State<MyPrescriptions> createState() => _MyPrescriptionsState();
}

class _MyPrescriptionsState extends State<MyPrescriptions> {
  List<Data> prescriptionList = [];
  bool _isLoading=false;
  User? get user => Provider.of<UserModel>(context, listen: false).user;
  @override
  void initState() {
    getPrescriptionImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(0),
                color: Colors.white,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        SizedBox(width: 12, height: 0),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                              'assets/icons/prescriptions/back_icon.svg',
                              width: 24,
                              height: 24,
                              semanticsLabel: 'A back arrow'),
                        ),
                        SizedBox(width: 8, height: 0),
                        Text(
                          "Prescription",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true ,
                physics: NeverScrollableScrollPhysics(),
                itemCount: prescriptionList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.blue,
                      child: Stack(
                        clipBehavior: Clip.none, fit: StackFit.passthrough,
                        children: <Widget>[
                          // Max Size Widget
                          prescriptionList[index].images?.length != 0  ?  Image.network(prescriptionList[index].images![0].image.toString() ?? "",
                            fit: BoxFit.cover,) : Container(),

                          Positioned(
                            top: 4,
                            right: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0x80000000),
                                  shape: BoxShape.circle
                              ),
                              //color: Color(0x80000000),
                              child: Center(
                                child: InkWell(
                                  onTap: () {

                                    print("remove img");
                                    dialogforRemoveImage(context , index);

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(CupertinoIcons.clear , size: 12, color: Colors.white,),
                                  )
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      // child: prescriptionList[index].images?.length != 0  ?  Image.network(prescriptionList[index].images![0].image.toString() ?? "",
                      // fit: BoxFit.cover,) : Container(),
                    );
                  }),

            ],
          ),
        ),
      ),
    );
  }

  getPrescriptionImage() async {

    setState(() {
      _isLoading=true;
    });

    var  _accessToken =  user?.email.toString() ;  //'rahat@gmail.com';

    print("$_accessToken");

    var url =
        'https://fluxstore.spinnertechltd.com/api/prescriptions/uploaded?email=$_accessToken';

    var respone = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    if (respone.statusCode == 200) {
      setState(() {
        _isLoading=false;
      });
      prescriptionList.clear();

      var model = myPrescriptionRespFromJson(respone.body.toString());
      print('data found -> ${respone.body.toString()}');
      prescriptionList.addAll(model.data ?? []);

      setState(() {
        prescriptionList.addAll(model.data ?? []);


        print(prescriptionList.length);

      });
    } else {
      print('somthing went wrong ${respone.statusCode}');
    }
  }

  void deletePrescriptionImage(int index) async {
    const _accessToken = '';
    var  url =
        'https://fluxstore.spinnertechltd.com/api/prescriptions/delete?prescription_id=${prescriptionList[index]?.prescriptionId?.toString() ?? ""}';

    var respone = await http.post(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    if (respone.statusCode == 200) {

      prescriptionList.removeAt(index);
      setState(() {

      });


    } else {
      print('somthing went wrong ${respone.statusCode}');
    }
  }

  YYDialog dialogforRemoveImage(BuildContext context , int index) {
    return YYDialog().build(context)
      ..width = 240
      ..borderRadius = 0.0

      ..text(
        padding: EdgeInsets.only(left: 25.0, right: 25.0 , top: 25 , bottom: 12),
        alignment: Alignment.centerLeft,
        text: "Are you sure want to remove this image?",
        color: Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      )


      ..doubleButton(
        padding: EdgeInsets.all(2),
        gravity: Gravity.right,
        withDivider: false,
        text1: "Cancel",
        color1: Colors.black,
        fontSize1: 14.0,
        fontWeight1: FontWeight.normal,
        onTap1: () {
          print("Cancel");
        },
        text2: "Yes",
        color2: Colors.black,
        fontSize2: 14.0,
        fontWeight2: FontWeight.normal,
        onTap2: () {
          deletePrescriptionImage(index);
        },
      )
      ..show();
  }

}
