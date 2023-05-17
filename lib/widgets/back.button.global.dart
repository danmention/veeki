import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';

class BackButtonGlobal extends StatelessWidget{
  const BackButtonGlobal({Key? key, required this.widget}) : super(key: key);
  final Widget widget;
  @override
  Widget build(BuildContext context) {
   // return Container(
   //     child: FloatingActionButton(onPressed: () {
   //       Navigator.of(context).push(
   //          MaterialPageRoute(builder: (context) => widget),
   //          );
   //       },
   //       backgroundColor: Colors.white24,
   //       elevation: 0,
   //       hoverColor: Colors.white24,
   //        child: Container(
   //          margin: EdgeInsetsDirectional.only(end: 100.0),
   //          child: const Icon(
   //            Icons.arrow_back,
   //            color: Colors.black,
   //
   //          ),
   //        ),
   //      ),
   //   );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
          onTap: () {
              Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) => widget),
                 );
              },
        child: Icon(Icons.arrow_back,color: Colors.black,size: 25,),
      ),
    );

  }
}
