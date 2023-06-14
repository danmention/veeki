import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../models/businessLayer/base.dart';
import '../models/response/state_response.dart';


class StylishDropdownStateButton extends Base{
   StylishDropdownStateButton({Key? key, required this.items, required this.header}) ;
   List<States> items;
   String header;

  @override
  _StylishDropdownButtonState1  createState() => _StylishDropdownButtonState1(this.items, this.header);
}

class _StylishDropdownButtonState1 extends BaseState {

  _StylishDropdownButtonState1(this.items, this.header);

  List<States> items;
  String header;
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  States? selectedStateValue;
  Area? selectedAreavalue;
  //String? selectedValue;
  List<Area> _areaList = [];
  int? selected_area;
  @override
  Widget build(BuildContext context) {
    return

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(

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
                        header,
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
                    .map((item) => DropdownMenuItem<States>(
                  value: item,
                  child: Text(
                    item.name!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
                    .toList(),
                value: selectedStateValue,
                onChanged: (value) {
                  setState(() {
                    selectedStateValue = value;


                      getArea(value?.id);


                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 160,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
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

        Container(

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
                      " Select Area",
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
              items: _areaList
                  .map((item) => DropdownMenuItem<Area>(
                value: item,
                child: Text(
                  item.localName!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: selectedAreavalue,
              onChanged: (value) {
                setState(() {
                  selectedAreavalue = value;





                });
              },
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: 160,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
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
              //     radius: const Radius.circular(40),
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
      ],
    );
  }

  void getArea(int? id) async {

    _areaList.clear();
    setState(() { });
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          showOnlyLoaderDialog();
          await apiHelper?.getAreaList(id!).then((result) {
            hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Area> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                // ref.watch(myprovider).setArea(_tList);

                _areaList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showSnack(snackBarMessage: "No Network ");
      }
    } catch (e) {
      print("Exception - stylishdropdownstatebuttonscreen.dart - _getarea():" + e.toString());
    }
  }
}