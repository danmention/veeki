
import 'package:flutter/material.dart';

import '../models/businessLayer/base.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;

import '../widgets/ProgressBar.dart';

class BookingConfirmationScreen extends Base {

   int? screenId;
  BookingConfirmationScreen({ this.screenId});
  @override
  _BookingConfirmationScreenState createState() => new _BookingConfirmationScreenState(this.screenId);
}

class _BookingConfirmationScreenState extends BaseState {

  int? screenId;
  _BookingConfirmationScreenState(this.screenId) : super();
  @override
  Widget build(BuildContext context) {
    return sc(Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Color(0xFF171D2C), borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          height: 60,
          padding: EdgeInsets.only(
            left: 100,
            right: 100,
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              child: Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: TextButton(
                  onPressed: () {


                  },
                  child: Text("Finish"),
                ),
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ProgressBar(processindex: 3,)
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Container(
                    decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/greatekan3.png'))),
                    width: 200,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Great' + ' ' + '${global.user.fullName}',
                        style: Theme.of(context).primaryTextTheme.caption,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: screenId == 1
                      ? Text('Your order has been placed successfully, please pick your items from store ASAP', textAlign: TextAlign.center, style: Theme.of(context).primaryTextTheme.subtitle1)
                      : Text('Your booking has been placed successfully, you will receive a notification/sms about your booking status', textAlign: TextAlign.center, style: Theme.of(context).primaryTextTheme.subtitle1),
                ),
              ],
            ))));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
