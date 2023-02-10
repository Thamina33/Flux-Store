import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/entities/user.dart';
import '../models/user_model.dart';
import '../screens/checkout/checkout_screen.dart';
import 'checkoutPrescription.dart';

class cartPrescriotion extends StatefulWidget {
 final  List<XFile>? imageFileList ;


  const cartPrescriotion({Key? key , this.imageFileList}) : super(key: key);

  @override
  State<cartPrescriotion> createState() => _cartPrescriotionState();
}


class _cartPrescriotionState extends State<cartPrescriotion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SafeArea(child:
              Padding(
                padding: const EdgeInsets.only(top: 8),
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

                    const Text("Cart",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                ),
              ),),
              SizedBox(height: 12,),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8),
                elevation: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Prescriptions attached by you", style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                      ),),

                      widget.imageFileList?.length  != 0 ? SizedBox(
                        height: 80,
                        child: ListView.builder(
                            shrinkWrap: true ,
                            itemCount: widget.imageFileList?.length ?? 0,
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
                                      child: Image.file(File(widget.imageFileList![index].path), fit: BoxFit.cover),
                                    ),


                                  ],
                                ),
                                // Image.file(File(imageFileList![index].path), width: 80 , height: 80, fit: BoxFit.cover),
                              );
                            }
                        ),
                      )
                          : Container()

                    ],


                  ),
                ),
              ),
              SizedBox(height: 12,),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 8),
                elevation: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12),
                  child: DottedBorder(
                    color: Colors.blueGrey,//color of dotted/dash line
                    strokeWidth: 1, //thickness of dash/dots
                    dashPattern: [5,3],
                    //dash patterns, 10 is dash width, 6 is space width
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Text(
                        "One fluxstore representive will call you shortly for confirming this order. You may receive cashback based on the final order value."
                            , style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12
                      ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ),
                ),
              ),

              // Card(
              //   margin: EdgeInsets.symmetric(horizontal: 8),
              //   elevation: 4,
              //   child: Container(
              //     width: double.infinity,
              //     padding: EdgeInsets.all(12),
              //     child: Row(
              //       children: [
              //
              //         SizedBox(
              //           width: (MediaQuery.of(context).size.width - 20)*.10,
              //           child: SvgPicture.asset(
              //               'assets/icons/prescriptions/location.svg',
              //               width: 24,
              //               height: 24,
              //               semanticsLabel: 'A back arrow'
              //           ),
              //         ),
              //         SizedBox(width: 10,),
              //         SizedBox(
              //             width: (MediaQuery.of(context).size.width - 20)*.60,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text("Omar" , style: TextStyle(
              //             fontSize: 14,
              //             color: Colors.blueGrey,
              //             fontWeight: FontWeight.w400,
              //           ),),
              //               Text("01234567890" , style: TextStyle(
              //                 fontSize: 14,
              //                 color: Colors.blueGrey,
              //                 fontWeight: FontWeight.w400,
              //               ),),
              //               Text("Address" , style: TextStyle(
              //                 fontSize: 14,
              //                 color: Colors.blueGrey,
              //                 fontWeight: FontWeight.w400,
              //               ),),
              //               Text("District" , style: TextStyle(
              //                 fontSize: 14,
              //                 color: Colors.blueGrey,
              //                 fontWeight: FontWeight.w400,
              //               ),),
              //               Text("Region" , style: TextStyle(
              //                 fontSize: 14,
              //                 color: Colors.blueGrey,
              //                 fontWeight: FontWeight.w400,
              //               ),),
              //
              //             ],
              //           )
              //         ),
              //         SizedBox(
              //             width: (MediaQuery.of(context).size.width - 20)*.20,
              //           child: Card(
              //             child: Container(
              //               alignment: Alignment.center,
              //               padding: EdgeInsets.all(6),
              //               child: Text("Change" , style: TextStyle(
              //                 fontSize: 14,
              //                 color: Colors.teal,
              //                 fontWeight: FontWeight.w400,
              //               ),),
              //             ),
              //             color: Color(0xff94FFFF),
              //           )
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 28,),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(left: 12,right: 12, top: 12 , bottom: 12),
                width: double.infinity,
                child: InkWell(
                  onTap: () async {
                     await Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Checkout(isPrescription : true )));


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


                          Text("Proceed to Checkout",
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
}
