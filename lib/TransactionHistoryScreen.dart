import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:veeki/models/response/billing_response.dart';
import 'package:veeki/utils/constant.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'models/businessLayer/base.dart';
import 'models/response/booking_response.dart';

class TransactionHistoryScreen extends Base{
   TransactionHistoryScreen({Key? key}) ;

  @override
  _TransactionHistoryScreenState createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends BaseState{
  GlobalKey<ScaffoldState>? _scaffoldKey;
  List<Billing> _productOrderHistoryList = [];
  bool _isRecordPending = true;
  bool _isDataLoaded = false;
  bool _isMoreDataLoaded = false;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return sc(Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(text:lbl_my_orders,
                style:
            Theme.of(context).appBarTheme.titleTextStyle, children: [
             ]),
          ),
        ),
        body: _isDataLoaded
            ? _productOrderHistoryList != null && _productOrderHistoryList.length > 0
            ?

        ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: _productOrderHistoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   // MaterialPageRoute(
                  //   //     builder: (context) => ProductOrderHistoryDetailScreen(
                  //   //       _productOrderHistoryList[index],
                  //   //       a: widget.analytics,
                  //   //       o: widget.observer,
                  //   //     )),
                  // );
                },
                child: Card(
                    margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                    child: ListTile(
                      title: Text('${_productOrderHistoryList[index].transactionReference}', ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius:  new BorderRadius.only(
                                    topLeft: new Radius.circular(5.0),
                                    bottomLeft: new Radius.circular(5.0),
                                  ),
                                  color: Colors.grey[200],
                                  border: new Border.all(
                                    color: Colors.grey[200]!,
                                  ),
                                ),
                                padding: EdgeInsets.all(4),
                                height: 25,
                                child: Center(
                                  child: Text(
                                    "Items",

                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 40,
                              padding: EdgeInsets.all(4),
                              child: Center(
                                child: Text(
                                  "${_productOrderHistoryList[index].name}",

                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius:  new BorderRadius.only(
                                  topRight: new Radius.circular(5.0),
                                  bottomRight: new Radius.circular(5.0),
                                ),
                                border: new Border.all(
                                  color: Colors.grey[200]!,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 22,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    color: _productOrderHistoryList[index].status == 4
                                        ? Colors.grey
                                        : _productOrderHistoryList[index].status == 3
                                        ? Colors.red
                                        : _productOrderHistoryList[index].status == 1
                                        ? Colors.amber
                                        : Colors.green[600],
                                    borderRadius: new BorderRadius.circular(7.0),
                                  ),
                                  padding: EdgeInsets.only(left: 5, right: 5),
                                  child: Center(
                                    child: Text(

                                      _productOrderHistoryList[index].status == 3
                                          ? lbl_cancelled
                                          : _productOrderHistoryList[index].status == 1

                                          ? lbl_accepted
                                          : _productOrderHistoryList[index].status == 0
                                          ? lbl_pending
                                          : lbl_completed,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              width: 80,
                              child: Column(
                                crossAxisAlignment:  CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 15,
                                    child: Text(
                                      '${DateFormat('hh:mm a').format(DateTime.parse(_productOrderHistoryList[index].createdAt!))}',
                                      textAlign: TextAlign.right,

                                    ),
                                  ),
                                  Container(
                                    height: 15,
                                    child: Text(
                                      '${DateFormat('dd/MM/yyyy').format(DateTime.parse(_productOrderHistoryList[index].createdAt!))}',
                                      textAlign: TextAlign.right,

                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    child: Text(
                                      '${ 'NGN  ' + _productOrderHistoryList[index].amount!}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              );
            })
            : Center(
          child: Text(
            txt_no_order_yet,
          ),
        )
            : _shimmer()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }
  int pageNumber = 1;
  _getProductOrderHistory() async {
    try {
   bool isConnected = await br!.checkConnectivity();
      if (isConnected) {

        if (_isRecordPending) {
          setState(() {
            _isMoreDataLoaded = true;
          });

          if (_productOrderHistoryList.isEmpty) {
            pageNumber = 1;
          } else {
            pageNumber++;
          }
          await apiHelper?.getMyTransaction(pageNumber, global.user.id!).then((
              result) {
            if (result != null) {
              if (result.resp_code == "00") {
                _isDataLoaded = true;

                List<Billing> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _productOrderHistoryList.addAll(_tList);
                setState(() {
                  _isMoreDataLoaded = false;
                });


                setState(() {});
              } else {
                _productOrderHistoryList = [];
                //  _productOrderHistoryList = List<Billing>();
                _isDataLoaded = true;
                setState(() {});
              }
            }
          });
        }
      } else {
        showNetworkErrorSnackBar(_scaffoldKey!);
      }
    } catch (e) {
      print("Exception - productOrderHistoryScreen.dart - _getProductOrderHistory():" + e.toString());
    }
  }

  _init() async {
    await _getProductOrderHistory();




    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isMoreDataLoaded) {
        setState(() {
          _isMoreDataLoaded = true;
        });
        await _getProductOrderHistory();
        setState(() {
          _isMoreDataLoaded = false;
        });
      }
    });
    _isDataLoaded = true;
    setState(() {});
  }

  Widget _shimmer() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(8),
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: Card(),
              );
            }),
      ),
    );
  }
}
