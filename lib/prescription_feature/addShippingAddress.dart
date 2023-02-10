import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cartPrescriotion.dart';

class addShippingAddress extends StatefulWidget {
  const addShippingAddress({Key? key}) : super(key: key);

  @override
  State<addShippingAddress> createState() => _addShippingAddressState();
}

class _addShippingAddressState extends State<addShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
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

                      const Text("Add Shipping Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 16
                        ),),

                    ],
                  ),
                ),),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: 24,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Name', hintStyle: TextStyle(

                        ),
                          label:Text("Full Name"),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Phone Number', hintStyle: TextStyle(

                        ),
                          label:Text("Mobile"),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter region', hintStyle: TextStyle(

                        ),
                          label:Text("Region"),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter city', hintStyle: TextStyle(

                        ),
                          label:Text("City"),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Area', hintStyle: TextStyle(

                        ),
                          label:Text("Area"),
                        ),
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter address', hintStyle: TextStyle(

                        ),
                          label:Text("Address"),
                        ),
                      ),
                    ),
                    SizedBox(height: 28,),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(left: 12,right: 12, top: 12 , bottom: 12),
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const cartPrescriotion()));

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


                                Text("Save Address",
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
            ],
          ),
        ),
      ),
    );
  }
}
