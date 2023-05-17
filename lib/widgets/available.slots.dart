import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/global.colors.dart';


class AvailableSlot extends StatefulWidget {
  AvailableSlot({Key? key}) : super(key: key);
  _AvailableSlotState createState() => _AvailableSlotState();
}

class _AvailableSlotState extends State<AvailableSlot> {
  var ChosenTimeSlot = null;
  void initState(){
    super.initState();
    ChosenTimeSlot = "";
  }

var list = ['10:00AM','11:00AM','12:00PM','1:00PM','2:00PM','3:00PM','4:00PM','5:00PM','6:00PM','7:00PM','8:00PM','9:00PM'];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GridView.builder(
        itemCount: list.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.7
          ),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){

                  setState(() {
                    ChosenTimeSlot = index;

                  });

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 10,
                  decoration: BoxDecoration(
                    color: ChosenTimeSlot == index? GlobalColors.primaryColor : Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child:
                       Text(
                         list[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      )

                ),
              ),
            );
          }
      ),
    );
  }
}