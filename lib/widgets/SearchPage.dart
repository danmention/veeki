import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spa/widgets/StylishDropdownButton.dart';

import '../HomePage.dart';
import '../utils/global.colors.dart';
import 'BottomNavBar.dart';
import 'Profile.Buttons.dart';
import 'back.button.global.dart';

class SearchPage extends StatefulWidget{
  SearchPage ({Key? key,})
      : super (key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _search = TextEditingController();

  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtonGlobal(widget: HomePage()),
                    Text("Search",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 30,)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
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
                      child: TextFormField(
                        controller: _search,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search_outlined,color: GlobalColors.primaryColor,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1,color: GlobalColors.primaryColor),
                          ),
                          hintText: "Search...",
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(10),
                          hintStyle:const TextStyle(
                            height: 1,
                          ),
                        ),
                      ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StylishDropdownButton(items: ["Lagos","Abuja","Abia","Ogun"], header: "State"),
                      StylishDropdownButton(items: ["Alimosho","Ikeja","Ikorodu"], header: "LGA"),
                    ],
                  ),
                )



              ],
            ),
          ),

        ),
      ),

    );
  }
}