import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../HomePage.dart';
import '../models/businessLayer/base.dart';
import '../models/response/category_response.dart';
import '../utils/global.colors.dart';
import '../widgets/back.button.global.dart';

class ViewCategoryScreen extends Base {
  ViewCategoryScreen({Key? key}) ;
  _ViewCategoryScreenState createState() => _ViewCategoryScreenState();
}

class _ViewCategoryScreenState extends BaseState {
  final TextEditingController rewardpointController = TextEditingController();


  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        Navigator.of(context).pop();
        return false;
      }

      ,
      child: Scaffold(

        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,

              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BackButtonGlobal(
                            widget: HomePage(),
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'View Category',
                            style: TextStyle(
                                color: GlobalColors.textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Icon(Icons.filter_alt_outlined)
                      //   ],
                      // )

                    ],
                  ),
                  SizedBox(height: 30,),
                  _isDataLoaded
                      ?

                  _categoryList.length > 0
                      ?
                  Container(
                    height: 700,
                    child: ListView.builder(
                      itemCount: _categoryList.length,
                      itemBuilder: (context, index){
                      return  Container(
                        margin: EdgeInsets.only(bottom: 10),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        height: 50,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(width: 20,),

                            Column(
                            //  mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(

                                      child: Text(

                                            _categoryList[index].title??"",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: GlobalColors.textColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      width: 330,
                                    ),
                                    GestureDetector(

                                        child: Icon(Icons.close,
                                          color: Colors.red,),
                                    onTap: (){
                                          delete(_categoryList[index].id);
                                    },
                                    )
                                  ],
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //   Text(' '),
                                //     Icon(Icons.delete_outline_outlined)
                                // ],),



                              ],
                            ),
                          ],
                        ),
                      );
                    },

                    ),
                  )
                      :
                  Text(
                    "NO Category ",

                  )

                      : _shimmer()

                ],
              ),

            ),
          ),
        ),

      ),
    );
  }

  Widget _shimmer() {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 170,
                  height: 150,
                  child: Card(
                    margin: EdgeInsets.only(left: 5, right: 5),
                  ),
                );
              }),
        ));
  }
  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
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
        showSnack( snackBarMessage: " No Network Available");

      }
    } catch (e) {
      print("Exception - getcategoryScreen.dart - _getAllUser():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllCategory() ;

      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcategory.dart - _initFinal():" + e.toString());
    }
  }

  void delete(int? id) async{
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {

        if (_isRecordPending) {
          await apiHelper?.deleteCategory(id).then((result) {

            if (result != null) {
              if (result.resp_code == "00") {

                showSnack( snackBarMessage: " Deleted successfully ");

                nextScreen(context, 'home');
                setState(() {

                });
              } else {
                showSnack( snackBarMessage:result.resp_message.toString());
              }
            }
          });
        }
      } else {

        showSnack( snackBarMessage: " No Network Available");

      }
    } catch (e) {
      print("Exception - getcategoryScreen.dart - _getAllUser():" +
          e.toString());
    }

  }

}