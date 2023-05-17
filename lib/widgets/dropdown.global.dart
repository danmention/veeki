import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/button.global.dart';
import 'package:spa/widgets/checkbox.global.dart';
import 'package:spa/widgets/text.form.global.dart';

import '../widgets/back.button.global.dart';

class DropDownGlobal extends StatefulWidget {
  @override
  _DropDownGlobalState createState() => _DropDownGlobalState();
  DropDownGlobal ({
    Key? key,
    required this.dropdownHeader,
    required this.options,
  })
      : super (key: key);
  final String dropdownHeader;
  final List<String> options;
}

class _DropDownGlobalState extends State<DropDownGlobal> {

  bool isOpen = true;
  @override
  String? selectedRadio;
  @override
  void initState(){
    super.initState();
    selectedRadio = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                isOpen = !isOpen;
                setState(() {

                });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.dropdownHeader),
                      Container(
                          margin: EdgeInsetsDirectional.only(end: 10),
                          child: Icon(isOpen?Icons.arrow_drop_down : Icons.arrow_right)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if(isOpen)
              ListView(
                primary: true,
                shrinkWrap: true,
                children: widget.options.map((dropdownoptions) => Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 0.5,
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(dropdownoptions,
                              style: TextStyle(
                                color: GlobalColors.textColor,
                              ),
                              textAlign: TextAlign.start,),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '50min | ',
                                      style: TextStyle(
                                          fontSize: 12
                                      ),
                                    ),
                                    Text(
                                      "\$50",
                                    style: TextStyle(
                                      color: GlobalColors.primaryColor,
                                      fontSize: 12
                                    ),
                                    ),
                                  ],
                                ),
                                Radio(
                                    value: dropdownoptions,
                                    //value: 1,
                                    groupValue: selectedRadio,
                                    activeColor: GlobalColors.primaryColor,
                                    onChanged: (value){
                                      setState(() {
                                        selectedRadio = value;
                                      });
                                    }
                                )
                              ],

                            ),


                          ],)




                    ),
                  ),
                )).toList(),
              )


          ]
      ),
    );
  }

}
