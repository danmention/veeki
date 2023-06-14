import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veeki/widgets/StylishDropdownAreaButton.dart';
import 'package:veeki/widgets/StylishDropdownCategoryButton.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';
import '../HomePage.dart';
import '../models/businessLayer/base.dart';
import '../models/response/category_response.dart';
import '../models/response/service_response.dart';
import '../models/response/state_response.dart';
import '../utils/global.colors.dart';
import 'BottomNavBar.dart';
import 'Profile.Buttons.dart';
import 'StylishDropdownStateButton.dart';
import 'back.button.global.dart';
import 'button.global.dart';

class SearchPage extends Base{
  SearchPage ({Key? key,});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends BaseState {


  TextEditingController _search = TextEditingController();

  String dropdownvalue = 'Item 1';



   List<States> items =[];
  // String header;
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  States? selectedStateValue;
  Area? selectedAreavalue;
  //String? selectedValue;
  List<Area> _areaList = [];
  int? selected_area;

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  List<Category> _categoryList = [];
  List<States> _stateList = [];
  Category? selectedCategoryvalue;
  String? _selectedGender;
  String? _selectedUserType;
  Category? _selectedCategory;
  States? _selectedState;
  Area? _selectedArea;
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                        "Select state ",
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
                                items: _stateList
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
                      ),
                      //  StylishDropdownStateButton(items: _stateList, header: "State"),
                      SizedBox(height: 10,),
                      Container(
                        width: 350,
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
                            items: _categoryList
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
                      )

                      // showCategory(),
                    ,

                      const SizedBox(height: 40),
                      ButtonGlobal(
                        ontap:(){
                          // login();
                        },
                        //  OnBoardingPage(),
                        text: 'Search',
                        color: GlobalColors.primaryColor,
                        fontsize: 20,
                      ),
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

  _getAllCategory() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        // showOnlyLoaderDialog();
        if (_isRecordPending) {
          await apiHelper?.getAllCategory().then((result) {
            // hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Category> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _categoryList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });
              } else {
                _categoryList = [];
              }
            }
          });
        }
      } else {
        hideLoader();
        showNetworkErrorSnackBar(_scaffoldkey);

      }
    } catch (e) {
      print("Exception - hopCategoryScreen.dart - _getCategory():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllCategory() ;
      await  _getState();

      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcatgory.dart - _initFinal():" + e.toString());
    }
  }

  _getState() async {
    _stateList.clear();
    // _areaList.clear();
    setState(() { });
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          showOnlyLoaderDialog();
          await apiHelper?.getAllState().then((result) {
            hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<States> _tList = result.recordList;

                //  print(_tList[0].name);

                // ref.watch(myprovider).setZone(_tList);

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }


                _stateList.addAll(_tList);
                print(" goit here");
                setState(() { });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }
    } catch (e) {
      print("Exception - signupscreen.dart - _getstate():" + e.toString());
    }
  }

  // void search(int? id) async {
  //
  //   _areaList.clear();
  //   setState(() { });
  //   try {
  //     bool isConnected = await br!.checkConnectivity();
  //     if (isConnected) {
  //       if (_isRecordPending) {
  //         showOnlyLoaderDialog();
  //         await apiHelper?.getSearchResult(id!).then((result) {
  //           hideLoader();
  //           if (result != null) {
  //             if (result.resp_code == "00") {
  //               List<Service> _tList = result.recordList;
  //
  //               if (_tList.isEmpty) {
  //                 _isRecordPending = false;
  //               }
  //
  //               // ref.watch(myprovider).setArea(_tList);
  //
  //               _areaList.addAll(_tList);
  //
  //               setState(() {
  //                 //  _isMoreDataLoaded = false;
  //               });
  //
  //               // } else {
  //               //   _zoneList = [];
  //             }
  //           }
  //         });
  //       }
  //     } else {
  //       showSnack(snackBarMessage: "No Network ");
  //     }
  //   } catch (e) {
  //     print("Exception - stylishdropdownstatebuttonscreen.dart - _getarea():" + e.toString());
  //   }
  // }


  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }

 // Widget showCategory() {
 //    return
 //
 //      Expanded(
 //      child: Container(
 //        width: 400,
 //        child: DropdownButtonHideUnderline(
 //          child: DropdownButton2(
 //            isExpanded: true,
 //            hint: Row(
 //              children: [
 //                Icon(
 //                  Icons.list,
 //                  size: 16,
 //                  color: Colors.black87,
 //                ),
 //                SizedBox(
 //                  width: 4,
 //                ),
 //                Expanded(
 //                  child: Text(
 //                    " Select Category",
 //                    style: TextStyle(
 //                      fontSize: 14,
 //                      fontWeight: FontWeight.bold,
 //                      color: Colors.black87,
 //                    ),
 //                    overflow: TextOverflow.ellipsis,
 //                  ),
 //                ),
 //              ],
 //            ),
 //            items: _categoryList
 //                .map((item) => DropdownMenuItem<Category>(
 //              value: item,
 //              child: Text(
 //                item.title!,
 //                style: const TextStyle(
 //                  fontSize: 14,
 //                  fontWeight: FontWeight.bold,
 //                  color: Colors.black87,
 //                ),
 //                overflow: TextOverflow.ellipsis,
 //              ),
 //            ))
 //                .toList(),
 //            value:   selectedCategoryvalue,
 //            onChanged: (value) {
 //              setState(() {
 //                selectedCategoryvalue = value;
 //
 //
 //
 //              });
 //            },
 //            buttonStyleData: ButtonStyleData(
 //              height: 50,
 //              width: 160,
 //              padding: const EdgeInsets.only(left: 14, right: 14),
 //              decoration: BoxDecoration(
 //                borderRadius: BorderRadius.circular(7),
 //                border: Border.all(
 //                  color: Colors.deepOrange,
 //                ),
 //                color: Colors.white,
 //              ),
 //              elevation: 2,
 //            ),
 //            iconStyleData: const IconStyleData(
 //              icon: Icon(
 //                Icons.arrow_forward_ios_outlined,
 //              ),
 //              iconSize: 14,
 //              iconEnabledColor: Colors.black87,
 //              iconDisabledColor: Colors.grey,
 //            ),
 //            // dropdownStyleData: DropdownStyleData(
 //            //   maxHeight: 200,
 //            //   width: 160,
 //            //   padding: null,
 //            //   decoration: BoxDecoration(
 //            //     borderRadius: BorderRadius.circular(14),
 //            //     color: Colors.white,
 //            //   ),
 //            //   elevation: 8,
 //            //   offset: const Offset(0, 0),
 //            //   scrollbarTheme: ScrollbarThemeData(
 //            //     radius: const Radius.circular(30),
 //            //     thickness: MaterialStateProperty.all<double>(6),
 //            //     thumbVisibility: MaterialStateProperty.all<bool>(true),
 //            //   ),
 //            // ),
 //            // menuItemStyleData: const MenuItemStyleData(
 //            //   height: 40,
 //            //   padding: EdgeInsets.only(left: 14, right: 14),
 //            // ),
 //          ),
 //        ),
 //      ),
 //    );
 // }

}