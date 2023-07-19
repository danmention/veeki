import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/models/response/payment_response.dart';

import '../HomePage.dart';
import '../models/businessLayer/base.dart';
import '../models/response/category_response.dart';
import '../utils/global.colors.dart';
import '../widgets/back.button.global.dart';

class ViewPaymentScreen extends Base {
  ViewPaymentScreen({Key? key}) ;
  _ViewPaymentScreenState createState() => _ViewPaymentScreenState();
}

class _ViewPaymentScreenState extends BaseState {



  bool _isDataLoaded = false;
  bool _isRecordPending = true;
  List<PaymentReponse> _paymentList = [];
  ScrollController _scrollController = ScrollController();
  bool _isMoreDataLoaded = false;


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
                            'View Payment',
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

                  _paymentList.length > 0
                      ?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      height: 800,
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _paymentList.length,
                        itemBuilder: (context, index){
                        return  Container(
                          margin: EdgeInsets.symmetric(vertical: 10),

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
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [


                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(

                                      child: Text(

                                        _paymentList[index].purpose??"",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: GlobalColors.textColor
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      width: 250,
                                    ),

                                    Expanded(
                                      child: Container(

                                        child: Text(

                                         "₦${_paymentList[index].amount}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(

                                      _paymentList[index].name??"",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                ],),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(

                                      "TransRef: ${_paymentList[index].transactionReference??""}",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black38
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                  ],),


                              ],
                            ),
                          ),
                        );
                      },

                      ),
                    ),
                  )
                      :
                  Center(
                    child: Text(
                      "No result found ",

                    ),
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
  int pageNumber = 1;
  _getAllPayment() async {
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
         showOnlyLoaderDialog();
        if (_isRecordPending) {

          setState(() {
            _isMoreDataLoaded = true;
          });

          if (_paymentList.isEmpty) {
            pageNumber = 1;
          } else {
            pageNumber++;
          }
          await apiHelper?.getAllPayment(pageNumber).then((result) {
            hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<PaymentReponse> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _paymentList.addAll(_tList);

                setState(() {
                  _isMoreDataLoaded = false;
                });
              } else {
                _paymentList = [];
              }
            }
          });
        }
      } else {
        hideLoader();
        showSnack( snackBarMessage: " No Network Available");

      }
    } catch (e) {
      print("Exception - getpaymentScreen.dart - _getAllPayment():" +
          e.toString());
    }
  }

  _init() async {
    try {
      await  _getAllPayment() ;
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent
            && !_isMoreDataLoaded) {
          setState(() {
            _isMoreDataLoaded = true;
          });
          await _getAllPayment();
          setState(() {
            _isMoreDataLoaded = false;
          });
        }
      });
      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initpayment.dart - _initFinal():" + e.toString());
    }
  }



}