import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:flutterwave_standard/core/flutterwave.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:flutterwave_standard/models/requests/customer.dart';
import 'package:flutterwave_standard/models/requests/customizations.dart';

import 'package:veeki/models/businessLayer/global.dart' as global;
import 'BookAppointment/bookingConfirmationScreen.dart';
import 'booking_provider.dart';
import 'models/businessLayer/base.dart';
import 'models/request/bookingconfirm_request.dart';
import 'models/response/booknow.dart';

class AcceptRejectScreen  extends Base {
   AcceptRejectScreen ({Key? key,this.status});
final int? status;

  @override
  _AcceptRejectScreenState createState() => _AcceptRejectScreenState(this.status);
}

class _AcceptRejectScreenState extends BaseState{

  _AcceptRejectScreenState(this.status);
  int? status;

  final plugin = PaystackPlugin();
  var publicKey = 'pk_test_59b09788900a513d57d5b280c1225ee6616a8ce2';


  @override
  Widget build(BuildContext context) {
status = 1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Center(
          child:

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                status == 1 ? Icons.check_circle : Icons.cancel,
                size: 120,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text('${ref.watch(myprovider).bookedService.user![0].fullName}', style: TextStyle(color: Colors.white,fontSize: 15),),
              Text(
                status == 1 ? 'Accepted' : 'Rejected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to previous screen
                  Navigator.pop(context);
                },
                child: status == 1 ?
                GestureDetector(
                    onTap: (){

                      makePayment();
                     // pay(context);
                    },
                    child: Column(
                      children: [
                        Text('Make Payment'),

                      ],
                    )

                )

                    :Text('Back to search') ,
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void initState() {
    print(" ${global.publicKey}");
    plugin.initialize(publicKey: publicKey);
    // TODO: implement initState
    super.initState();
  }


  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  Future<void> makePayment() async {
    //PaymentScreen()
    // var amt  = _cAmountForPayment.text.replaceAll(",", "");
    //  String  amt  =  bookingRequest!.amount.toString()+"00";
    //  int paymentamount = int.tryParse(amt) ??00;
    Charge charge = Charge()

    // ..amount = int.parse(projectAmount!)
      ..amount = ref.watch(myprovider).bookingRequestitem.amount! *100
      ..reference = _getReference()
    // or ..accessCode = _getAccessCodeFrmInitialization()
      ..email = '${global.user.email}';
    final response = await plugin.checkout(
        context , method: CheckoutMethod.card, charge: charge);


    if (response.status) {

      book();
      //
      // BookNow _bookNow = new BookNow();
      // _bookNow.amount = bookingRequest!.amount;
      // _bookNow.userId = int.parse("${global.user.id}");
      // _bookNow.transactionReference = _getReference();
      // _bookNow.purpose = service!.title;
      // Payment was successful
      print('Payment was successful');
      // await apiHelper!.checkOut(_bookNow).then((result) async {
      //   if (result != null) {
      //     if (result.status == "1") {
      //
      //       Navigator.pushAndRemoveUntil(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) =>
      //                   BookingConfirmationScreen()),
      //           ModalRoute.withName('/'));
      //       // Navigator.of(context).push(
      //       //   MaterialPageRoute(builder: (context) => BookingConfirmationScreen()),
      //       // )
      //
      //     }
      //   }
      // });


    } else {
      // Payment failed
      print('Payment failed');
    }
  }

  // handlePaymentInitialization() async {
  //   final Customer customer = Customer(
  //       name: "Flutterwave Developer",
  //       phoneNumber: "1234566677777",
  //       email: global.user.email!
  //   );
  //   final Flutterwave flutterwave = Flutterwave(
  //       context: context,
  //       publicKey:global.publicKey,
  //       currency: "NGN",
  //       redirectUrl: "www.veeki.co",
  //       txRef: _getReference(),
  //       amount: "3000",
  //       customer: customer,
  //       paymentOptions: "card",
  //       customization: Customization(title: "My Payment"),
  //       isTestMode: true );
  //
  //   final ChargeResponse response = await flutterwave.charge();
  //
  //     if(response.success!){
  //       book();
  //     }
  // }


void book()async{

    //after payment log your transaction into database  below


    //if (response.status) {

  BookConfirmRequest _bookNow = new BookConfirmRequest();
  _bookNow.amount = ref.watch(myprovider).bookingRequestitem.amount;
  _bookNow.userId = int.parse("${global.user.id}");
  _bookNow.transactionReference = "";
  _bookNow.referral_code = "KIOW11110";
  _bookNow.booking_id = 1;
  _bookNow.purpose = ref.watch(myprovider).bookedService.title;
  // Payment was successful
  print('Payment  coming acceptrejectscreen was successful');
  await apiHelper!.checkOut(_bookNow).then((result) async {
  if (result != null) {
  if (result.resp_code == "00") {

  Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
  builder: (context) =>
  BookingConfirmationScreen()),
  ModalRoute.withName('/'));
  // Navigator.of(context).push(
  //   MaterialPageRoute(builder: (context) => BookingConfirmationScreen()),
  // )

  }
  }
  });


  // } else {
  // // Payment failed
  // print('Payment failed');
  // }

}



    //
    // void pay(BuildContext context) {
    //   int date = DateTime.now().microsecondsSinceEpoch;
    //
    //   int transactionId = Random().nextInt(1000000).floor().toInt();
    //
    //   String publicKey = global.publicKey;
    //
    //   InitialisePayment initialisePayment = InitialisePayment(
    //       transactionId: (date + transactionId).toString(),
    //       amount: 200.0,
    //       email: '${global.user.email}',
    //       productId: "12",
    //       productDescription: "some description"
    //   );
    //   Xpay xpay = Xpay(context, publicKey, isLive: false);
    //   xpay.transact(initialisePayment, (transaction) {
    //     debugPrint("result: ${transaction.toString()}");
    //   }, (exception, transaction) {
    //     debugPrint("error: " + exception.message);
    //   });
    // }


}
