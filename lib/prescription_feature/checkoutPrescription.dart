import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class chekoutPrescriotion extends StatefulWidget {
  const chekoutPrescriotion({Key? key}) : super(key: key);

  @override
  State<chekoutPrescriotion> createState() => _chekoutPrescriotionState();
}

class _chekoutPrescriotionState extends State<chekoutPrescriotion> {
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

                    const Text("Checkout",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 16
                      ),),

                  ],
                ),
              ),),
              SizedBox(height: 12,),
              SizedBox(height: 12,),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 8),
                elevation: 4,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [

                      SizedBox(
                        width: (MediaQuery.of(context).size.width - 20 )*.10,
                        child: SvgPicture.asset(
                            'assets/icons/prescriptions/location.svg',
                            width: 24,
                            height: 24,
                            semanticsLabel: 'A back arrow'
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width - 20 )*.70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Omar" , style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                              ),),
                              Text("01234567890" , style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                              ),),
                              Text("Address" , style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                              ),),
                              Text("District" , style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                              ),),
                              Text("Region" , style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                              ),),

                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  maxLength: 250,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write here any additional info', hintStyle: TextStyle(

                  ),

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
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const chekoutPrescriotion()));
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


                          Text("Place Order",
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
