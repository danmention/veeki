import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/businessLayer/base.dart';
import '../models/response/view_my_booking.dart';
import '../widgets/BottomNavBar.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;


class BookingDetailScreen extends Base {
   BookingDetailScreen({this.booking}) ;
   final  MyBooking? booking;
  @override
  _BookingDetailScreenState createState() => _BookingDetailScreenState(this.booking);
}

class _BookingDetailScreenState extends BaseState {
  _BookingDetailScreenState(this._mybookingList
      );
  MyBooking? _mybookingList;
  final oCcy = new NumberFormat("#,##0.00", "en_US");

var age ;
  @override
  Widget build(BuildContext context) {
    _mybookingList!.user![0].dateOfBirth != null ?
     calculateAge(_mybookingList!.user![0].dateOfBirth!):"NA";
print(_mybookingList!.user![0].dateOfBirth);
    return Scaffold(
      appBar: AppBar(title: Text('Detail Appointments '),),
      bottomNavigationBar: Container(
          height: 60,
          child: BottomNavBar(id: "booking",)
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(children: [
              SizedBox(height: 40,),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Ready  for Care    ', style: TextStyle(fontSize: 20,   fontWeight: FontWeight.bold,),),
                      Text('Appointment   ', style: TextStyle(fontSize: 25,   fontWeight: FontWeight.bold,),),
                    ],
                  ),

                  Expanded(child: Image.asset("assets/preg.jpg"))
                ],
              ),
              SizedBox(height: 40,),

              _mybookingList!.status == "2"? Text("Status :Payment Completed ", style: TextStyle(

                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 25,),): Text("Status :Payment Pending!! ", style: TextStyle(

                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 25,),),
              SizedBox(height: 40,),

              _mybookingList != null?

              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Container(child: "${_mybookingList!.service?[0].images![0].images}".isEmpty?
                          CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/nurse.jpeg")):
                          CircleAvatar(
                              radius: 40,
                              backgroundImage:
                              //  borderRadius: BorderRadius.circular(300.0),child:
                              NetworkImage("${_mybookingList?.service?[0].images![0].images}",)) ,),
                        ),

                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                             // Text("jgggjgjjgjgjjgjgjgjgjgjgjgjgjjgjgjgjgjgjgjgjgjgjgjgjgjj ",
                              Text("${_mybookingList!.service?[0].title??" "}",

                                style: TextStyle(
                                color: Colors.black,overflow: TextOverflow.ellipsis,

                                fontSize:20,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,),), SizedBox(height: 15,),

                              Text("Duration :${_mybookingList?.numberOfHour??" "} ${_mybookingList!.service?[0].unit??" "}(s) ", style: TextStyle(
                                color: Colors.black,overflow: TextOverflow.ellipsis,

                                fontSize:15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,),),
                                SizedBox(height: 15,),

                                Text("₦${ oCcy.format(int.tryParse(_mybookingList!.amount!)??0)}", style: TextStyle(

                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,),),



                            ],),

                          ),
                        ) ,


                      ],


                      ),
                      SizedBox(height: 20,),
            Container(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:   Row(
                children: [
                  Icon(Icons.access_time, size: 17,),
                  SizedBox(width: 5,),
                  Row(
                    children: [

                      Text("${_mybookingList!.timeFrom!}, ", style: TextStyle(

                        fontFamily: 'Lato',
                        fontSize: 14,),),
                      Text("${_mybookingList!.date!}", style: TextStyle(

                        fontFamily: 'Lato',

                        fontSize: 14,),),

                      // Text("${_mybookingList!.user![0].dateOfBirth??""}", style: TextStyle(
                      //
                      //   fontFamily: 'Lato',
                      //
                      //   fontSize: 14,),),
                    ],
                  ),
                ],
              ),),),

                      SizedBox(height: 10,),
                      Container(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:   Row(
                          children: [
                            Icon(Icons.add_location_alt_outlined, size: 17,),
                            SizedBox(width: 5,),
                            Text("${_mybookingList!.service![0].area!},", style: TextStyle(

                              fontFamily: 'Lato',

                              fontSize: 15,),), SizedBox(width: 5,),

                            Text("${_mybookingList!.service![0].state!}", style: TextStyle(

                              fontFamily: 'Lato',

                              fontSize: 15,),),
                          ],
                        ),
                      )
                        ,),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Icon(Icons.house_outlined, size: 17,),
                          SizedBox(width: 5,),
                          Text("${_mybookingList!.streetAddress!},",overflow: TextOverflow.ellipsis, style: TextStyle(

                            fontFamily: 'Lato',

                            fontSize: 15,),),
                        ],),
                      ),

                      SizedBox(height: 20,),
                      Divider(thickness: 1,color: Colors.grey,),
                      SizedBox(height: 20,),
                    //  global.user.role  == "SERVICE_PROVIDER" ?
                      Text("You appointment with ${_mybookingList!.user![0].fullName!} is confirmed", style: TextStyle(

                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w300,
                        fontSize: 15,),),

                        //   : Text("You appointment with ${_mybookingList!.user![0].fullName!} is confirmed", style: TextStyle(
                        //
                        // fontFamily: 'Lato',
                        // fontWeight: FontWeight.w300,
                        // fontSize: 15,),),
                      SizedBox(height: 40,),
                      SizedBox(
                        width: 500,
                        height: 55,
                        child: TextButton(onPressed: (){
                          viewprofile();
                        }, child: Text('View Profile', style: TextStyle(fontSize: 16),),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black38),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    //  side: BorderSide(color: Colors.blueGrey)
                                  )
                              )
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ):Card(),





            ],),
          ),
        ),
      ),
    );
  }

  void viewprofile() {

// Replace this with your date of birth.


    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Colors.white,
        isScrollControlled:true,

        showDragHandle: true,
        useSafeArea: true,
        isDismissible: true,
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.9,
            child: SingleChildScrollView(
                   // controller: scrollController,
            child: Padding(
              //padding: MediaQuery.of(context).viewInsets,
              padding:EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 56.0,
                                child: Center(
                                    child: Text("${_mybookingList!.user![0].fullName}") // Your desired title
                                ),
                              ),

                              Positioned(
                                  left: 0.0,
                                  top: 0.0,
                                  child: IconButton(
                                      icon: Icon(Icons.close), // Your desired icon
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      }
                                  )
                              )
                            ]
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top:8.0),
                        //   child: GestureDetector(
                        //       onTap: (){
                        //         Navigator.pop(context);
                        //       },
                        //       child: Icon(Icons.close, size: 30,)),
                        // ),
                        SizedBox(height: 20,),

                        "${_mybookingList!.service?[0]}".isNotEmpty?    Column(
                          children: [
                            _mybookingList?.user![0].profileImage == "" ?   SizedBox(

                              width: 550,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(  topLeft: Radius.circular(12), topRight: Radius.circular(12)  ),child:
                              Image.network("${_mybookingList?.user?[0].profileImage}",)),
                              //Image.asset("assets/nurse.jpeg"),
                            ):SizedBox(

                              width: 550,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(  topLeft: Radius.circular(12), topRight: Radius.circular(12)  ),child:
                              Image.asset("assets/logo.png",)),
                              //Image.asset("assets/nurse.jpeg"),
                            ),



                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12.0),
                                    bottomLeft: Radius.circular(12.0)),
                                color: Colors.blueGrey,
                              ),


                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                                child: Row(children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text('${_mybookingList!.user![0].fullName}', style:
                                    TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Lato',),),

                                    Expanded(
                                      child: Container(
                                        width: 280,
                                        child: Row(children: [
                                          Text('${_mybookingList!.user![0].city??" "}, ',overflow: TextOverflow.ellipsis, style:
                                          TextStyle(fontSize: 17, color: Colors.white38, fontWeight: FontWeight.bold, fontFamily: 'Lato',),),
                                          Text('${_mybookingList!.user![0].state??" "}',overflow: TextOverflow.ellipsis,
                                            style:
                                          TextStyle(fontSize: 17, color: Colors.white38, fontWeight: FontWeight.bold, fontFamily: 'Lato',),),

                                        ],),
                                      ),
                                    ),

                                    _mybookingList!.status != 0?   Text('${_mybookingList!.user![0].phone??" "}', style:
                                    TextStyle(fontSize: 15,color:Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Lato',),):Text('Awaiting payment'),
                                  ],),


                                  age !=null? Expanded(
                                    child: Row(
                                      children: [

                                        Text("Age:", style:
                                        TextStyle(fontSize: 20, color: Colors.white38, fontWeight: FontWeight.bold, fontFamily: 'Lato',),),
                                        Text('$age', style:
                                        TextStyle(fontSize: 20, color: Colors.white38, fontWeight: FontWeight.bold, fontFamily: 'Lato',),),
                                      ],
                                    ),
                                  ):SizedBox(),
                                ],),
                              ),
                            )

                          ],
                        ):

                        SizedBox(

                          width: 550,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),child:
                          Image.asset("assets/nurse.jpeg")

                          ),
                          //Image.asset("assets/nurse.jpeg"),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20,),
                                  Text('ABOUT ME'),
                                  SizedBox(height: 30,),
                                  Text('${_mybookingList!.user![0].aboutMe??" "}', style: TextStyle(fontSize: 20),),
                                  SizedBox(height: 20,),
                                  Divider(thickness: 1,color: Colors.grey,),
                                  Text('${_mybookingList!.user![0].workExperience??" "}', style: TextStyle(fontSize: 20),),
                                ],),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
                  ),

          );
        });
  }

  int calculateAge(String dateOfBirth) {
    if(dateOfBirth == null){
      return 0;
    }


    final dob = DateFormat('dd-MM-yyyy').parse(dateOfBirth);
    final now = DateTime.now();
     age = now.year - dob.year;
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    return age;
  }

  // String calculateAge(String birthDated) {
  //
  //   DateTime birthDate = DateTime.parse(birthDated);
  //   print(birthDate); // 2020-01-02 03:04:05.000
  //
  //
  //   DateTime currentDate = DateTime.now();
  //   int age = currentDate.year - birthDate.year;
  //   int month1 = currentDate.month;
  //   int month2 = birthDate.month;
  //   if (month2 > month1) {
  //     age--;
  //   } else if (month1 == month2) {
  //     int day1 = currentDate.day;
  //     int day2 = birthDate.day;
  //     if (day2 > day1) {
  //       age--;
  //     }
  //   }
  //   return age.toString();
  // }
}
