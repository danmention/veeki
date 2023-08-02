import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:veeki/utils/global.colors.dart';

import '../CategorySearchList.dart';
import '../models/businessLayer/base.dart';
import '../models/response/category_response.dart';
import '../models/response/service_response.dart';

class ServicesInHopePage extends Base {

  _ServicesInHopePageState createState() => _ServicesInHopePageState();
}

class _ServicesInHopePageState extends BaseState {


  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<Category> _categoryList = [];

  bool _isMoreDataLoaded = false;
  ScrollController _scrollController = ScrollController();
  int pageNumber = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:
      _isDataLoaded
          ?

      _categoryList.length > 0
          ?
      Container(
        //height: 100,
        padding: EdgeInsets.all(12.0),
        child:

        GridView.builder(
            // scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // crossAxisSpacing: 2.0,
                // mainAxisSpacing: 2.0
            ),

            itemCount: _categoryList.length<=6?_categoryList.length:6,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 8.0,bottom: 8.0,right: 8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CategorySearchList(_categoryList[index].id!)),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height:5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                         // image: AssetImage("Images/HomepageBannerImage3.png"),
                          image: NetworkImage(_categoryList[index].faIcon!),
                          fit: BoxFit.cover,
                          opacity:150,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            blurStyle: BlurStyle.inner
                          )
                        ],
                      ),
                      child:
                          Text(
                            _categoryList[index].title??"",
                            style: TextStyle(
                              color:  Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                  ),
                ),
              );
            }
        ),
      )

          :
       Text(
          "NO Category ",
          style: Theme.of(context).primaryTextTheme.subtitle2,
        )

         : _shimmer()
      ,
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
              } else if(result.resp_code =="01" && result.resp_message.toString().contains("Token is Invalid") )
              {
                Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
                showSnack(snackBarMessage: result.resp_message.toString());
              }else {
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
}
