/*
import 'package:flutter/material.dart';
import 'package:veeki/utils/global.colors.dart';

class CheckboxGlobal extends StatefulWidget{
  final bool isChecked;
  CheckboxGlobal({required this.isChecked});
  @override
  _CheckboxGlobalState createState() => _CheckboxGlobalState();

}
class _CheckboxGlobalState extends State<CheckboxGlobal> {
  bool _isSelected = false;
  @override
  void initState(){
    _isSelected = widget.isChecked ?? false;
  }
  @override
  Widget build(BuildContext context){
    _isSelected = widget.isChecked ?? false;

    return GestureDetector(
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: _isSelected? GlobalColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: _isSelected ? null : Border.all(
            color: GlobalColors.primaryColor,
            width: 10.0,
          )
        ),
        child: _isSelected ? Icon(
            Icons.check,
          color: Colors.white,
        ): null,
              ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:veeki/utils/global.colors.dart';

class CheckboxGlobal extends StatefulWidget{
  final bool isChecked;
  CheckboxGlobal({required this.isChecked});
  @override
  _CheckboxGlobalState createState() => _CheckboxGlobalState();

}
class _CheckboxGlobalState extends State<CheckboxGlobal> {
  bool _isSelected = false;
  @override
  void initState(){
    _isSelected = widget.isChecked ?? false;
  }
  @override
  Widget build(BuildContext context){
    _isSelected = widget.isChecked ?? false;

    return GestureDetector(
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Checkbox(
        value: true,
        checkColor: Colors.white,
        activeColor: GlobalColors.primaryColor,
        onChanged: (value){
          setState(() {
            _isSelected = value!;
          });
        },
      ),
    );
  }
}