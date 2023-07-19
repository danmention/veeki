import 'package:flutter/material.dart';


import 'package:veeki/utils/global.colors.dart';

import '../models/response/service_response.dart';

class DescriptionandInformation extends StatelessWidget{
   DescriptionandInformation({this.service}) ;
  Service? service;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                  child: Text("Description",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),)
              ),
                   service != null? Padding(
                padding: const EdgeInsets.only(top: 17,bottom: 17,right:17),
                child: Text("${service!.desc}",textAlign: TextAlign.left,
                style: TextStyle(
                   color: Colors.black45,
                   fontSize: 15
                  ),
                ),
              ):Container(),
            ],
          ),
          Column(
            children: [
              Container(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Information",
                    style: TextStyle(
                      fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sunday - Thursday",
                          style: TextStyle(color: Colors.black45
                          ),
                        ),
                        Text("10:00AM - 11:00PM",
                          style: TextStyle(color: Colors.black45
                          ),
                        ),
                        SizedBox(width: 50,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Friday - Saturday",
                          style: TextStyle(color: Colors.black45
                          ),
                        ),
                        Text("12:00PM - 11:00PM",
                          style: TextStyle(color: Colors.black45
                          ),
                        ),
                        SizedBox(width: 40,)
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  // Row(
                  //   children: [
                  //     Icon(Icons.phone,color: Colors.black45,size: 15,),
                  //     Text("   +2348076543210",
                  //       style: TextStyle(color: Colors.black45
                  //       ),),
                  //   ],
                  // ),
                  // SizedBox(height: 7,),
                  // Row(
                  //   children: [
                  //     Icon(Icons.alternate_email_outlined, color: Colors.black45,size: 15,),
                  //     Text("   .",
                  //       style: TextStyle(color: Colors.black45
                  //       ),),
                  //   ],
                  // ),
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}
