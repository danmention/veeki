import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../models/businessLayer/base.dart';
import '../models/response/category_response.dart';
import '../models/response/state_response.dart';


class StylishDropdownCategoryButton extends Base{
  StylishDropdownCategoryButton({Key? key, required this.items, required this.header}) ;
   List<Category> items;
   String header;

  @override
  _StylishDropdownButtonCategory  createState() => _StylishDropdownButtonCategory(this.items, this.header);
}

class _StylishDropdownButtonCategory extends BaseState {

  _StylishDropdownButtonCategory(this.items, this.header);

  List<Category> items;
  String header;
  bool _isDataLoaded = false;
  bool _isRecordPending = true;

  Category? selectedCategoryvalue;

  int? selected_area;
  @override
  Widget build(BuildContext context) {
    return

      Row(
      children: [
        Expanded(
          child: Container(
          width: 400,
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Row(
                    children: [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.black87,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          " Select Category",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: items
                      .map((item) => DropdownMenuItem<Category>(
                    value: item,
                    child: Text(
                      item.title!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                      .toList(),
                  value:   selectedCategoryvalue,
                  onChanged: (value) {
                    setState(() {
                      selectedCategoryvalue = value;



                    });
                  },
                  buttonStyleData: ButtonStyleData(
                    height: 50,
                    width: 160,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(
                        color: Colors.deepOrange,
                      ),
                      color: Colors.white,
                    ),
                    elevation: 2,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                    iconSize: 14,
                    iconEnabledColor: Colors.black87,
                    iconDisabledColor: Colors.grey,
                  ),
                  // dropdownStyleData: DropdownStyleData(
                  //   maxHeight: 200,
                  //   width: 160,
                  //   padding: null,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(14),
                  //     color: Colors.white,
                  //   ),
                  //   elevation: 8,
                  //   offset: const Offset(0, 0),
                  //   scrollbarTheme: ScrollbarThemeData(
                  //     radius: const Radius.circular(30),
                  //     thickness: MaterialStateProperty.all<double>(6),
                  //     thumbVisibility: MaterialStateProperty.all<bool>(true),
                  //   ),
                  // ),
                  // menuItemStyleData: const MenuItemStyleData(
                  //   height: 40,
                  //   padding: EdgeInsets.only(left: 14, right: 14),
                  // ),
                ),
              ),
            ),
        ),

      ],
    );
  }


}