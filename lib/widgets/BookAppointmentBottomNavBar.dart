import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spa/utils/global.colors.dart';

class BookAppointmentBottomNavBar extends StatelessWidget{
  BookAppointmentBottomNavBar ({Key? key, required this.widget}) : super (key:key);
  final Widget widget;

  @override
  Widget build (BuildContext context){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: GlobalColors.secondaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text("Total cost ",style: TextStyle(color: Colors.white),),
                Text("\$85",style: TextStyle(color: GlobalColors.primaryColor),),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
              child: Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: GlobalColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next    ",style: TextStyle(color: Colors.white),),
                    Icon(Icons.arrow_forward,color: Colors.white,)
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}
class PaymentBottomNavBar extends StatelessWidget{
  PaymentBottomNavBar ({Key? key, required this.widget}) : super (key:key);
  final Widget widget;

  @override
  Widget build (BuildContext context){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: GlobalColors.secondaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text("Total cost ",style: TextStyle(color: Colors.white),),
                Text("\$85",style: TextStyle(color: GlobalColors.primaryColor),),
              ],
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
              child: Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: GlobalColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pay    ",style: TextStyle(color: Colors.white),),
                    Icon(Icons.payments_outlined,color: Colors.white,)
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}