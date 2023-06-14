import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veeki/utils/global.colors.dart';

import '../booking_provider.dart';
import '../models/response/service_response.dart';

class BookAppointmentBottomNavBar extends ConsumerWidget{
  BookAppointmentBottomNavBar ({Key? key, required this.widget, this.service}) : super (key:key);
  final Widget widget;
Service? service;
  @override
  Widget build (BuildContext context, ref){
    return


      Container(
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
                ref.watch(myprovider).calculatedCost !=0?
                Text("₦${ ref.watch(myprovider).calculatedCost}",style: TextStyle(color: GlobalColors.primaryColor,fontWeight: FontWeight.w500, fontSize: 22),):
                Text("₦${service?.amount??"0.00"}",style: TextStyle(color: GlobalColors.primaryColor,fontWeight: FontWeight.w500, fontSize: 22),),
              ],
            ),
            InkWell(
              onTap: (){
               if(service!.amount == null){
                 final snackBar = SnackBar(
                   content: const Text('Kindly select a product'),
                   backgroundColor: (Colors.black),
                   action: SnackBarAction(
                     label: 'dismiss',
                     onPressed: () {
                     },
                   ),
                 );
                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 return;
               }

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: GlobalColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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