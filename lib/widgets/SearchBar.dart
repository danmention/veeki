import 'package:flutter/material.dart';
import '../utils/global.colors.dart';
import 'SearchPage.dart';


class SearchBarForm extends StatelessWidget{
  SearchBarForm ({Key? key,})
      : super (key: key);

  TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
      },
      child: Container(
        height: 45,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),

            boxShadow:[
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 7,
              ),
            ]

        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
            Icon(Icons.search_outlined,color: GlobalColors.primaryColor,),
            SizedBox(width: 20,),
            Text("search here...",
              style: TextStyle(
                color: Colors.black54
              ),
            ),

          ],
        ) ,
        // child: InkWell(
        //   onTap: () {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(builder: (context) => SearchPage()),
        //     );
        //   },
        //   // child: TextFormField(
        //   //   controller: _search,
        //   //   keyboardType: TextInputType.text,
        //   //   obscureText: false,
        //   //   decoration: InputDecoration(
        //   //     prefixIcon: Icon(Icons.search_outlined,color: GlobalColors.primaryColor,),
        //   //     focusedBorder: OutlineInputBorder(
        //   //       borderSide: BorderSide(width: 1,color: GlobalColors.primaryColor),
        //   //     ),
        //   //     hintText: "Search...",
        //   //     border: InputBorder.none,
        //   //     contentPadding: const EdgeInsets.all(10),
        //   //     hintStyle:const TextStyle(
        //   //       height: 1,
        //   //     ),
        //   //   ),
        //   // ),
        // ),
      ),
    );
  }
}
