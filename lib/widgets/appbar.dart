import 'package:flutter/material.dart';

import '../utils/global.colors.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({Key? key,this.title }) : super(key: key);
 final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar( backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(title!, style: TextStyle(
          color: GlobalColors.textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold),),
      leading: const BackButton(
        color: Colors.black, // <-- SEE HERE
      ),

    );
  }
}
