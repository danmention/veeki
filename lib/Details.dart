// ignore_for_file: empty_constructor_bodies

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:veeki/booking_provider.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/models/response/service_response.dart';
import 'package:veeki/photo_view_page.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/Details.DescriptionandInformation.dart';
import 'package:veeki/widgets/back.button.global.dart';
import 'package:veeki/widgets/button.global.dart';
import 'BookAppointment/AppointmentsScreen.dart';
import 'HomePage.dart';
import 'models/businessLayer/base.dart';
import 'widgets/text.form.global.dart';

class Details extends Base {
  Details ({this.service}) ;
  @override
  _DetailsState createState() => _DetailsState(this.service);

 final  Service? service;
}

class _DetailsState extends BaseState{
  _DetailsState(this.service);
   Service? service;
  PageController pageController = PageController(initialPage: 0, viewportFraction: 1);
  final List<String> photos = [];

  int activePage = 0;
  TextEditingController  nameController = TextEditingController() ;
  TextEditingController  emailController = TextEditingController() ;
  TextEditingController  descriptionController = TextEditingController() ;
  TextEditingController  titleController = TextEditingController() ;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //appBar: AppBar(),
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
                    width: 600,
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage("assets/tera.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4),
                            BlendMode.darken
                        ),
                      ),
                    ),
                    child:

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back,color: Colors.white,),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),

                          service != null?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child:

                                Container(
                                  width: 330,
                                  child: Column(

                                    children: [
                                     // Text("Breaking Barbershop", style: TextStyle(color: Colors.white, fontSize: 20),),
                                     Text("${service?.title??" "}", overflow: TextOverflow.ellipsis,style:
                                     TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 13,top: 10),
                                        child: Row(
                                          children: [
                                           Text('₦', style: TextStyle(
                                               fontSize: 15,
                                               color: Colors.white
                                           ), ),
                                            Row(
                                              children: [
                                                Text("${service!.amount}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),SizedBox(width: 2,),

                                                Text("/ ${service!.unit??" "}",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Roboto',
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.white
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 13,top: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on_outlined,color: Colors.white,size: 12,),
                                            Row(
                                              children: [
                                                Text("${service!.area}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white
                                                  ),
                                                ),SizedBox(width: 5,),
                                                Text("${service!.state}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(right: 15),
                              //   child: Row(
                              //
                              //     children: [
                              //       Text("5.00 ",
                              //         style: TextStyle(
                              //             color: Colors.white
                              //         ),
                              //       ),
                              //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                              //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                              //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                              //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                              //       Icon(Icons.star,color: Colors.yellow,size: 13,),
                              //     ],
                              //   ),
                              // )
                            ],
                          ):Container()
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
                    child: TabBar(
                     // isScrollable: true,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      tabs: [
                        Tab(child: Text("Services",style: TextStyle(
                          color:activePage==0 ? GlobalColors.primaryColor:Colors.white,
                        ),
                        ),),



                        Tab(
                          child: Text("Gallery",style: TextStyle(
                            color:activePage==1 ?
                            GlobalColors.primaryColor:Colors.white,
                          ),
                          ),
                        ),

                        Tab(
                          child: Text("About",style: TextStyle(
                            color:activePage==2 ? GlobalColors.primaryColor:Colors.white,
                          ),
                          ),
                        ),
                        Tab(
                          child: Text("Review",style: TextStyle(
                            color:activePage==3 ? GlobalColors.primaryColor:Colors.white,
                           ),
                          ),
                        ),

                      ],
                    ),
                  ),

              SizedBox(
                  height: MediaQuery.of(context).size.height*0.9,
                child: TabBarView(


                  children:  [PageOne(), PageTwo(), PageThree(),PageFour()],),
              ),








                ],
              ),
            ),

          ),
        ),

      ),
    );
  }

@override
  void initState() {
  getimages();
    // TODO: implement initState
    super.initState();
  }

getimages()async{
   service!.images!.forEach((element) {
     photos.add( element.images!) ;
  });
}
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

 Widget PageTwo() {
    return GridView.builder(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.all(1),
      itemCount: photos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: ((context, index) {
        return Container(
          padding: const EdgeInsets.all(0.5),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PhotoViewPage(photos: photos, index: index),
              ),
            ),
            child: Hero(
              tag: photos[index],
              child: CachedNetworkImage(
                imageUrl: photos[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey),
                errorWidget: (context, url, error) => Container(
                  color: Colors.red.shade400,
                ),
              ),
            ),
          ),
        );
      }),
    );
 }

 Widget PageOne() {
   return Column(
     children: [

       DescriptionandInformation(service: service,),
       SizedBox(height: 20,),
       InkWell(
         onTap: (){
           print(service!.user?[0].availability);
          // if(service!.user?[0].availability == "NOT_ACTIVE"  ){
          // showSnack(snackBarMessage: "This user is not available for business at this time");
          // return;
          // }

           ref.watch(myprovider).addService(service!) ;

           Navigator.of(context).push(
             MaterialPageRoute(builder: (context) => AppointmentsScreen(service: service??Service(),)),
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
       ),]
   );
 }

  Widget PageThree() {
    return service != null? Container(
      child: service?.user != null  ?

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${service?.user?[0].fullName??"No result found"}', style: TextStyle(fontSize: 18, color: Colors.black),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('${service?.user?[0].workExperience??""}', style: TextStyle(fontSize: 18, color: Colors.black),),
          ),
        ],
      ):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text("No result found",  style: TextStyle(fontSize: 18, fontFamily: 'Lato'))),
      ),
    ):Container();
  }

  Widget PageFour() {

    return Container(
      width: 400,
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormGlobal(
              controller: nameController,
              text: 'Name',
              obscure: false,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            TextFormGlobal(
              controller: emailController,
              text: 'Email',
              obscure: false,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            TextFormGlobal(
              controller: titleController,
              text: 'Title',
              obscure: false,
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
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
                hintText: "Describe your experience   ",
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(105, 108, 121, 0.7),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ButtonGlobal(
              isLoading: false,
              ontap:(){
                //_signUp();
              } ,
              text: 'Review',
              color: GlobalColors.primaryColor,
              fontsize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
