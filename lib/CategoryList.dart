import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/widgets/CardButton.dart';

import 'CategorySearchList.dart';
import 'models/businessLayer/base.dart';
import 'models/response/category_response.dart';

class CategoryList extends Base{
  @override
  _CategoryListState createState() => _CategoryListState();
  CategoryList ({Key? key,});
}

class _CategoryListState extends BaseState {
  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Categories', style: AppBarTheme.of(context).titleTextStyle),

      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


            SizedBox(height: 30,),

              _isDataLoaded
                  ?

              _categoryList.length > 0
                  ?


              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _categoryList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0,top: 8.0,bottom: 8.0,right: 8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => CategorySearchList(_categoryList[index].id!)),
                          );
                        },
                        child:

                        CardButton(text1: "${ _categoryList[index].title??""}", text2: "BarberShop (650)", image: "Images/clippers.png"),

                      ),
                    );
                  }
              )

                  :
              Text(
                "NO Category ",
                style: Theme.of(context).primaryTextTheme.subtitle2,
              )

                  : _shimmer()
              ,

              // CardButton(text1: "Treatment", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Shaving", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Beard Trimming", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Kids Haircut", text2: "BarberShop (650)", image: "Images/clippers.png"),
              // CardButton(text1: "Facials and Trimming", text2: "BarberShop (650)", image: "Images/clippers.png"),

              SizedBox(height: 40,),



            ],
          ),
        ),

      ),
      // bottomNavigationBar: Container(
      //     height: 60,
      //     child: BottomNavBar(id: "profile",)
      // ),
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
                  width: 110,
                  height: 50,
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
      print("Exception - getcategoryScreen.dart - _getAllCategorylist():" +
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
}
