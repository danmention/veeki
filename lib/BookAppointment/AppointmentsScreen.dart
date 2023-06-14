import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:veeki/BookAppointment/SummaryScreen.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/models/request/booking_request.dart';
import 'package:veeki/utils/global.colors.dart';

import '../Details.dart';
import '../booking_provider.dart';
import '../models/businessLayer/base.dart';
import '../models/response/service_response.dart';
import '../widgets/ProgressBar.dart';
import '../widgets/back.button.global.dart';
import '../widgets/text.form.global.dart';

class AppointmentsScreen extends Base {
  AppointmentsScreen({Key? key, this.service}) ;
  Service? service;
  _AppointmentsScreenState createState() => _AppointmentsScreenState(this.service);
}

class _AppointmentsScreenState extends BaseState{
 var ChosenHairstylist = null;
 DateTime today = DateTime.now();
 var ChosenTimeSlot = null;
 int? calculatedCost ;
 TextEditingController _caddress = TextEditingController();
 TextEditingController _clandmark = TextEditingController();
 TextEditingController _carea = TextEditingController();
 TextEditingController _chours = TextEditingController();
 BookingRequest bookingRequest = BookingRequest();
 var list = ['7:00AM','8:00AM','9:00AM','10:00AM','11:00AM','12:00PM',
   '1:00PM','2:00PM','3:00PM','4:00PM','5:00PM','6:00PM','7:00PM','8:00PM','9:00PM', '10:00PM'];
 _AppointmentsScreenState(this.service);
 Service? service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,

            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BackButtonGlobal(
                      widget: Details(),
                    ),
                    Text(
                      'Book an appointment',
                      style: TextStyle(
                          color: GlobalColors.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),

                  ],
                ),
                SizedBox(
                  height: 70,
                    width: double.infinity,
                    child: ProgressBar(processindex: 1,)
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: SizedBox(
                    height: 123,
                      child:

                      //Calender()

                        TableCalendar(
                          locale: "en_US",
                          calendarFormat : CalendarFormat.week,
                          rowHeight: 43,
                          calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(color: GlobalColors.primaryColor,shape: BoxShape.circle),
                            todayDecoration : BoxDecoration(color: Color(0xFFFFB892), shape: BoxShape.circle),
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle : const TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold ),
                          ),
                          availableGestures: AvailableGestures.all,
                          selectedDayPredicate: (day) => isSameDay(day, today),
                          focusedDay: today,
                          firstDay: DateTime.utc(2010,10,16),
                          lastDay: DateTime.utc(2030,3,14),
                          onDaySelected: _onDaySelected,
                        ),





                  ),
                ),
                Divider(thickness: 1,),
                SizedBox(
                  height: 215,
                    child: timeslot()
                ),
                Divider(),
                Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 8.0),
                    //   child: Container(
                    //     height: 20,
                    //     width: 20,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(6),
                    //       color: Colors.grey
                    //     ),
                    //   ),
                    // ),

                   // Text('Available slots')
                    Text('How many hours :'),
                    SizedBox(width: 10,),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child:
                      TextFormField(
                        controller: _chours,
                        keyboardType: TextInputType.number,
                        onChanged: (value){
                          int serviceamt = int.tryParse(service!.amount!)??0;
                          var amt  =  int.tryParse(value) ?? 0;
                          var result = serviceamt *amt;
                          ref.watch(myprovider).calculatedamount(result);

                        },
                        decoration: InputDecoration(
                          // prefixIcon: prefixIcon == null ? prefixIcon : Icon(prefixIcon,
                          //   color: Color.fromRGBO(105, 108, 121, 1),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(74, 77, 84, 0.2),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black12,
                            ),
                          ),
                          hintText: "1  ",
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromRGBO(105, 108, 121, 0.7),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _caddress,
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  decoration: InputDecoration(
                    // prefixIcon: prefixIcon == null ? prefixIcon : Icon(prefixIcon,
                    //   color: Color.fromRGBO(105, 108, 121, 1),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(74, 77, 84, 0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    hintText: "Describe your address  ",
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(105, 108, 121, 0.7),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                TextFormGlobal(
                  controller: _carea,
                  text: 'Area ',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                SizedBox(height: 20,),
                TextFormGlobal(
                  controller: _clandmark,
                  text: 'Popular landmark',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),



                // Row(
                //   children: [
                //     Text("Choose hair Specialist  ",
                //       style: TextStyle(
                //         color: GlobalColors.textColor,
                //         fontSize: 15,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     Text("(Optional) ", style: TextStyle(
                //         color: GlobalColors.textColor,
                //         fontSize: 12,
                //         ),
                //     ),
                //   ],
                // ),
               // SizedBox(height: 20,),
                // Container(
                //   height: 50,
                //     child: HorizontalButtonsList()
                // ),

                SizedBox(height: 40,),
                Container(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Theme(
                          data: ThemeData(
                              unselectedWidgetColor: Color(0xff138D1f)),
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: true,
                                  checkColor: Colors.white,
                                  activeColor: GlobalColors.primaryColor,
                                  onChanged: (value) {
                                    value = false;
                                  },

                                ),
                                Text(
                                  'Remind me 30 mins in advance',
                                  style: TextStyle(
                                    color: GlobalColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
          ],
            ),

          ),
        ),
      ),
      bottomNavigationBar: Container(
          height: 70,
          child: bookppointmentbottom()

          // BookAppointmentBottomNavBar(
          //   service: service != null?service:Service(),
          //   widget: SummaryScreen(),
          // )
      ),
    );
  }




  Widget bookppointmentbottom(){
    return


      Container(
        height: 200,
        decoration: BoxDecoration(
          color: GlobalColors.secondaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text("Total cost ",style: TextStyle(color: Colors.white),),
                ref.watch(myprovider).calculatedCost !=0?
                Text("₦${ ref.watch(myprovider).calculatedCost}",style: TextStyle(color: GlobalColors.primaryColor,fontWeight: FontWeight.w500, fontSize: 22),):
                Text("₦${service?.amount??"0.00"}",style: TextStyle(color: GlobalColors.primaryColor,fontWeight: FontWeight.w500, fontSize: 22),),
              ],
            ),
            InkWell(
              onTap: (){
                if(service!.amount == null){
                  final snackBar = SnackBar(
                    content: const Text('Kindly select a product'),
                    backgroundColor: (Colors.black),
                    action: SnackBarAction(
                      label: 'dismiss',
                      onPressed: () {
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
              bookapointment();
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => widget),
                // );
              },
              child: Container(
                height: 40,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: GlobalColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Next    ",style: TextStyle(color: Colors.white),),
                    Icon(Icons.arrow_forward,color: Colors.white,)
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }


Widget timeslot(){
 return GridView.builder(
      itemCount: list.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1.7
      ),
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){

          setState(() { });

                ChosenTimeSlot = index;
                //bookingRequest.timeFrom = ChosenTimeSlot;
                bookingRequest.timeFrom = list[index];



            },
            child: Container(
                alignment: Alignment.center,
                height: 10,
                decoration: BoxDecoration(
                  color: ChosenTimeSlot == index? GlobalColors.primaryColor : Colors.grey,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child:
                Text(
                  list[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                )

            ),
          ),
        );
      }
  );
}

 void bookapointment() async{
   try {


     if (_caddress.text.isEmpty && _clandmark.text.isEmpty) {
       showSnack(snackBarMessage:"Enter all fields ");

       return;
     }

     int caregiver_id = int.tryParse(service!.userId!)??0;
     bookingRequest.streetAddress = _caddress.text.trim();
     bookingRequest.area = _carea.text.trim();
     bookingRequest.popularLandMark = _clandmark.text.trim();

     bookingRequest.numberOfHour = int.tryParse(_chours.text.trim())??1;
     bookingRequest.amount =  ref.watch(myprovider).calculatedCost !=0?ref.watch(myprovider).calculatedCost:int.parse(service!.amount!) ;
     bookingRequest.serviceId = service!.id!;
     bookingRequest.caregiverUserId = caregiver_id;
     bookingRequest.userId = global.user.id!;
     bookingRequest.timeTo = "";


     Navigator.of(context).push(
       MaterialPageRoute(builder: (context) => SummaryScreen(bookingRequest: bookingRequest,service: service,)),
     );











   } catch (e) {
     print("Exception - bookapointmentScreen.dart - _addsevice():" + e.toString());
   }
 }

 var formatter = new DateFormat('yyyy-MM-dd');

 void initState(){
   super.initState();
   ref.read(myprovider).calculatedCost =0;
   ChosenTimeSlot = "";
 }


  _onDaySelected(DateTime day, DateTime focusedDay){
   setState(() {
     today = day;


     String formattedDate = formatter.format(today);
     bookingRequest.date = formattedDate;

     print(formattedDate);
   });
 }
}
