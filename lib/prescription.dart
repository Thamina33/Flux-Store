import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fstore/routes/flux_navigate.dart';
import 'package:fstore/services/dependency_injection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import 'common/constants.dart';
import 'screens/index.dart';



class Prescription extends StatefulWidget {
   Prescription({Key? key}) : super(key: key);

   @override
   State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  bool getStorageKey(String key) =>
      injector<SharedPreferences>().getBool(key) ?? false;
  final ImagePicker imagePicker = ImagePicker();
  final ScrollController _scrollController = ScrollController() ;

  var isVisible = true ;
  bool isLoggedIn = false ;




  List<XFile>? imageFileList = [];

  void openCamera() async {
    final selectedImages = await imagePicker.pickImage(source: ImageSource.camera);

    if (selectedImages != null) {

      imageFileList?.add(selectedImages);
    }
    setState(() {
    });

  }



  void selectImages() async {
    final selectedImages = await imagePicker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {
    });

  }



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.pink,
        body:  Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
             Card(
               margin: EdgeInsets.all(0),
                color: Colors.white,
                child: SafeArea(child:
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
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
              SizedBox(
                height: 6,
              ),
              SizedBox(
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 24, left: 12),
                        child: Text('Have a prescription? Upload here',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.teal,
                              fontSize: 18
                          ),),
                      ),
                      const SizedBox(height: 12,),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 12,right: 12,left: 12),
                        width: double.infinity,
                        child: Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          color: Colors.teal,
                          shape: RoundedRectangleBorder(
                            //side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {

                                    openCamera();
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/prescriptions/camera_icon.svg',
                                          width: 18,
                                          height: 18,
                                          color: Colors.white,
                                          semanticsLabel: 'A back arrow'
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const Text("Camera",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 14
                                        ),),
                                    ],

                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  width: 1,
                                  height: 50,
                                ),
                                InkWell(
                                  onTap: () {
                                    selectImages();
                                    },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/prescriptions/gallerya_icon.svg',
                                          width: 18,
                                          height: 18,
                                          color: Colors.white,
                                          semanticsLabel: 'A back arrow'
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text("Gallery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 14
                                        ),),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  width: 1,
                                  height: 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    isLoggedIn == true ? SvgPicture.asset(
                                        'assets/icons/prescriptions/prescription_icon.svg',
                                        width: 18,
                                        height: 18,
                                        color: Colors.white,
                                        semanticsLabel: 'A back arrow'
                                    ):SvgPicture.asset(
                                        'assets/icons/prescriptions/prescription_icon.svg',
                                        width: 18,
                                        height: 18,
                                        color: Colors.white,
                                        semanticsLabel: 'A back arrow'
                                    ),
                                    // Card(
                                    //    elevation: 0,
                                    //    margin: EdgeInsets.all(0),
                                    //    color: Color(0xff00AEAE),
                                    //    shape: RoundedRectangleBorder(
                                    //      borderRadius: BorderRadius.all(Radius.circular(4))
                                    //    ),
                                    //    child: Padding(
                                    //      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                    //      child: Text("Login to View",
                                    //        style: TextStyle(
                                    //            fontWeight: FontWeight.w400,
                                    //            color: Colors.white,
                                    //            fontSize: 14
                                    //        ),),
                                    //    ),
                                    //  ),


                                    const SizedBox(
                                      height: 2,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        isLoggedIn = getStorageKey(
                                            LocalStorageKey.loggedIn);

                                        if (isLoggedIn == false) {
                                          FluxNavigate.pushNamed(
                                            RouteList.login,
                                          ).then((value) {
                                            print("object");
                                          });
                                          setState(() {

                                          });
                                        }
                                      },
                                      child: Text("My Prescriptions",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 14
                                        ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      imageFileList?.length  != 0 ? SizedBox(
                        height: 80,
                        child: ListView.builder(
                            itemCount: imageFileList?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Stack(
                                  clipBehavior: Clip.none, fit: StackFit.passthrough,
                                  children: <Widget>[
                                    // Max Size Widget
                                    Container(
                                      height: 100,
                                      width: 80,
                                      child: Image.file(File(imageFileList![index].path), fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                      top: 52,
                                      child: Container(
                                        height: 20,
                                        width: 80,
                                        color: Color(0x80000000),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {

                                              print("remove img");
                                              dialogforRemoveImage(context , index);
                                              AlertDialog(

                                                title: const Text('Attention'),           // To display the title it is optional
                                                content: Text('Are you sure want to remove this prescription?'),   // Message which will be pop up on the screen
                                                // Action widget which will provide the user to acknowledge the choice
                                                actions: <Widget>[
                                                  TextButton(                     // FlatButton widget is used to make a text to work like a button
                                                    onPressed: () {

                                                    },             // function used to perform after pressing the button
                                                    child: Text('CANCEL'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      imageFileList?.removeAt(index);
                                                      setState(() {

                                                      });

                                                    },
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                            child: Text(
                                              'Remove',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white, fontSize: 12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                // Image.file(File(imageFileList![index].path), width: 80 , height: 80, fit: BoxFit.cover),
                              );
                            }
                        ),
                      ) :
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                'assets/icons/prescriptions/protection_security_shield_icon.svg',
                                width: 32,
                                height: 32,
                                semanticsLabel: 'A back arrow'
                            ),
                            SizedBox(width: 8,),
                            Flexible(
                              child: Text("Your attatched prescription will be secure and private. Only our pharmacist will review it. ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 14
                                ),),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          YYAlertDialogWithDivider(context);
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                  'assets/icons/prescriptions/info_icon.svg',
                                  width: 18,
                                  height: 18,
                                  color: Colors.grey,
                                  semanticsLabel: 'A back arrow'
                              ),
                              SizedBox(width: 8,),
                              Flexible(
                                child: Text("Valid Prescription Guide",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.teal,
                                      fontSize: 14
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Flexible(
                              child: Text("কেন প্রেসক্রিপশনের ছবি আপলোড করবেন?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.teal,
                                    fontSize: 14
                                ),),
                            ),
                            const SizedBox(width: 18,),
                            isVisible ? Visibility(
                              visible: true,
                              child: InkWell(
                                onTap: (){
                                  isVisible = false ;

                                  setState(() {

                                  });

                                },

                                child: SvgPicture.asset(
                                    'assets/icons/prescriptions/ttop_icon.svg',
                                    width: 18,
                                    height: 18,
                                    color: Colors.teal,
                                    semanticsLabel: 'A back arrow'
                                ),
                              ),
                            ):
                            Visibility(
                              visible: true,
                              child: InkWell(
                                onTap: (){
                                  isVisible = true;
                                  setState(() {

                                  });

                                },
                                child: SvgPicture.asset(
                                    'assets/icons/prescriptions/down_arrow_icon.svg',
                                    width: 16,
                                    height: 16,
                                    color: Colors.teal,
                                    semanticsLabel: 'A back arrow'
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Visibility(
                        visible: isVisible,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 260,
                          child: Scrollbar(
                            controller: _scrollController,
                            thumbVisibility: true ,
                            scrollbarOrientation: ScrollbarOrientation.right,
                            thickness: 5,
                            radius: const Radius.circular(10),
                            child: ScrollConfiguration(
                              behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
                              child: ListView(
                                controller: _scrollController,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                reverse: false ,
                                  children: [
                                    const SizedBox(height: 6,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/prescriptions/phone_portrait_icon.svg',
                                              width: 32,
                                              height: 32,
                                              color: Color(0xff454545),
                                              semanticsLabel: 'A back arrow'
                                          ),
                                          SizedBox(width: 12,),
                                          const Flexible(
                                            child: Text("প্রেসক্রিপশন হারানোর ভয় থেকে আপনি মুক্ত, আজীবনের জন্য Fluxstore অ্যাপে আপনি খুজে পাবেন আপনার ডিজিটাল প্রেসক্রিপশন।",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.blueGrey,
                                                  fontSize: 14

                                              ),
                                              textAlign: TextAlign.justify,

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 6,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/prescriptions/paper_sheet_icon.svg',
                                              width: 24,
                                              height: 32,
                                              color: Color(0xff454545),
                                              semanticsLabel: 'A back arrow'
                                          ),
                                          SizedBox(width: 12,),
                                          const Flexible(
                                            child: Text("ডাক্তারের হাতের লেখা বুঝা না গেলেও কোন সমস্যা নেই, আমাদের 'A' গ্রেড ফার্মাসিস্ট প্রেস্ক্রিপশন দেখে ঔষধ অর্ডারে আপনাকে সহযোগিতা করবে।",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.blueGrey,
                                                  fontSize: 14

                                              ),
                                              textAlign: TextAlign.justify,

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 6,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/prescriptions/lock_security_icon.svg',
                                              width: 32,
                                              height: 32,
                                              color: Color(0xff454545),
                                              semanticsLabel: 'A back arrow'
                                          ),
                                          SizedBox(width: 12,),
                                          const Flexible(
                                            child: Text("আপনার প্রেসক্রিপশন কখনো তৃতীয় কোন পক্ষের সাথে শেয়ার করা হবে না।",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.blueGrey,
                                                  fontSize: 14

                                              ),
                                              textAlign: TextAlign.justify,

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 6,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/prescriptions/prescription_icon.svg',
                                              width: 32,
                                              height: 32,
                                              color: Color(0xff454545),
                                              semanticsLabel: 'A back arrow'
                                          ),
                                          SizedBox(width: 12,),
                                          const Flexible(
                                            child: Text("বাংলাদেশ সরকারের নিয়ম অনুসারে, কিছু মেডিসিন অর্ডার করার জন্য প্রেসক্রিপশন থাকা বাধ্যতামুলক।",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.blueGrey,
                                                  fontSize: 14

                                              ),
                                              textAlign: TextAlign.justify,

                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],

                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),


                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(left: 12,right: 12, top: 12 , bottom: 12),
                width: double.infinity,
                child: InkWell(
                  onTap: () async {

                    isLoggedIn = getStorageKey(LocalStorageKey.loggedIn);

                    if(isLoggedIn == false){
                       FluxNavigate.pushNamed(
                        RouteList.login,
                      ).then((value) {

                        print("object");

                      });
                    }
                  },
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.all(0),
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Text("Continue",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16
                            ),),
                          const SizedBox(
                            width: 12,
                          ),
                          SvgPicture.asset(
                              'assets/icons/prescriptions/forward_icon.svg',
                              width: 16,
                              height: 16,
                              color: Colors.white,
                              semanticsLabel: 'A back arrow'
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  YYDialog YYAlertDialogWithDivider(BuildContext context) {
    return YYDialog().build(context)
      ..width = 300
      ..borderRadius = 4.0
      ..divider()
      ..doubleButton(
        padding: EdgeInsets.only(top: 10.0),
        gravity: Gravity.right,
        withDivider: true,
        text1: "",
        color1: Colors.black,
        fontSize1: 1.0,
        fontWeight1: FontWeight.bold,
        onTap1: () {
          print("");
          Spacer();
        },
        text2: "X",
        color2: Colors.black,
        fontSize2: 24.0,
        fontWeight2: FontWeight.normal,
        onTap2: () {
          print("X");
        },
      )
      ..widget( 
          Container(
           child: Column(
             children: [
               Image.asset('assets/icons/prescriptions/pp.png', width: 120, height: 200,)
             ],
           ),
      )
      )
      ..text(
        padding: EdgeInsets.only(left: 25.0, right: 25.0 , top: 12),
        alignment: Alignment.centerLeft,
        text: "Include details of doctor and patient+clinic visit details",
        color: Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      )
      ..text(
        padding: EdgeInsets.only(left: 25.0, right: 25.0 , top: 12, bottom: 25),
        alignment: Alignment.centerLeft,
        text: "Medicines will be dispensed as per prescription",
        color: Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
      )
      ..show();
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

          imageFileList?.removeAt(index);
          setState(() {

          });
        },
      )
      ..show();
  }


}
