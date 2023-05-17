import 'package:flutter/material.dart';
import 'package:spa/BookAppointment/ChooseServiceScreen.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/Details.DescriptionandInformation.dart';
import 'package:spa/widgets/back.button.global.dart';
import 'HomePage.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
  Details ({Key? key,}) : super (key: key);
}

class _DetailsState extends State<Details> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            //padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage("Images/HomepageBannerImage.png"),
                    fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackButtonGlobal(
                              widget: HomePage(),
                            ),
                            Icon(Icons.favorite_outline_outlined,color: Colors.white,size: 25,)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(

                                children: [
                                  Text("Breaking Barbershop",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 53,top: 10),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on_outlined,color: Colors.white,size: 12,),
                                        Text(
                                          "  Liverpool, United Kingdom",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(

                                children: [
                                  Text("5.00 ",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ),
                                  Icon(Icons.star,color: Colors.yellow,size: 13,),
                                  Icon(Icons.star,color: Colors.yellow,size: 13,),
                                  Icon(Icons.star,color: Colors.yellow,size: 13,),
                                  Icon(Icons.star,color: Colors.yellow,size: 13,),
                                  Icon(Icons.star,color: Colors.yellow,size: 13,),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: GlobalColors.secondaryColor,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),bottomLeft: Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About",style: TextStyle(
                          color: GlobalColors.primaryColor,
                         ),
                        ),
                        Text("Services",style: TextStyle(
                          color: Colors.white,
                         ),
                        ),
                        Text("Barbers",style: TextStyle(
                          color: Colors.white,
                         ),
                        ),
                        Text("Review",style: TextStyle(
                          color: Colors.white,
                         ),
                        ),
                        Text("Gallery",style: TextStyle(
                          color: Colors.white,
                         ),
                        ),
                      ],
                    ),
                  ),
                ),
                DescriptionandInformation(),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ChooseServiceScreen()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 45,
                width: 200,
                decoration: BoxDecoration(
                  color: GlobalColors.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Text(
                  "Book Appointment",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),

              ),
            ),



              ],
            ),
          ),

        ),
      ),

    );
  }
}
