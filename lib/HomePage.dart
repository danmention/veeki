import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veeki/BookAppointment/ViewBookingScreen.dart';
import 'package:veeki/CategoryList.dart';
import 'package:veeki/LoginScreen.dart';
import 'package:veeki/MyServiceListScreen.dart';
import 'package:veeki/Notifications.dart';
import 'package:veeki/PopularBarbers.dart';
import 'package:veeki/Products.dart';
import 'package:veeki/Profile.dart';
import 'package:veeki/SearchResultScreen.dart';
import 'package:veeki/ServiceList.dart';
import 'package:veeki/admin/AccountPayment.dart';
import 'package:veeki/models/businessLayer/base.dart';
import 'package:veeki/utils/global.colors.dart';
import 'package:veeki/widgets/BottomNavBar.dart';
import 'package:veeki/widgets/MyDropDownForm.dart';
import 'package:veeki/widgets/PopularcaregiverInHomePage.dart';
import 'package:veeki/widgets/ProductsInHomePage.dart';
import 'package:veeki/widgets/RecommendedBarbershopInHomePage.dart';
import 'package:veeki/widgets/SearchBar.dart';
import 'package:veeki/widgets/ServicesInHopePage.dart';
import 'package:veeki/widgets/CarouselWithIndicator.dart';
import 'package:veeki/models/businessLayer/global.dart' as global;
import 'package:veeki/widgets/button.global.dart';


import 'AddServiceScreen.dart';
import 'TransactionHistoryScreen.dart';
import 'models/businessLayer/global.dart';
import 'models/response/category_response.dart';
import 'models/response/service_response.dart';
import 'models/response/state_response.dart';
import 'models/response/wallet_response.dart';
import 'widgets/ViewMyServiceScreen.dart';



class HomePage extends Base {
  @override
  _HomePageState createState() => _HomePageState();
  HomePage ({Key? key,}) ;
}

class _HomePageState extends BaseState {

  int _current = 0;
 // var list = ['Captain Salon','Breaking Barbershop','Something Salon','Something Salon','Something Salon','Something Salon',];
  final CarouselController _controller = CarouselController();
  TextEditingController _search = TextEditingController();

  String dropdownvalue = 'Item 1';
  bool isLoading = false;
  List<Service> _serviceList = [];

  List<States> items =[];
  // String header;
  bool _isDataLoaded = false;
  bool _isAreaDataLoaded = false;
  bool _isRecordPending = true;
  States? selectedStateValue;
  Area? selectedAreavalue;
  Area noselectedAreavalue = Area(localName: 'Choose Area');
  //String? selectedValue;
  List<Area> _areaList = [];

  int? selected_area;

  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  List<Category> _categoryList = [];
  List<States> _stateList = [];
  Category? selectedCategoryvalue;
  String? _selectedGender;
  String? _selectedUserType;
  Category? _selectedCategory;
  States? _selectedState;
  Area? _selectedArea;

  @override
  Widget build(BuildContext context) {

    //calculateAge(global.user.dateOfBirth??" ");
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            //padding: const EdgeInsets.only(left: 30.0,right: 30),
            child:
           // global.user.isAdmin  != "1" ||  global.user.role  == "SERVICE_PROVIDER"?
            global.user.role  == "USER" ?
            Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: GlobalColors.secondaryColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0,right: 0,left: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Profile()),
                                );
                              },
                              child:

                              global.user.profileImage ==null?
                              CircleAvatar(
                                backgroundColor: GlobalColors.primaryColor,
                                radius: 32,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage('assets/pic.png'),
                                ),
                              ):CircleAvatar(
                                backgroundColor: GlobalColors.primaryColor,
                                radius: 32,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage('${global.user.profileImage}'),
                                ),
                              ) ,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  global.user.fullName != null?
                                  Text(
                                    "${global.user.fullName}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ): Text(
                              "Hi Buddy",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),

                                  Row(

                                    children: [
                                      Icon(Icons.location_on_outlined,color: Colors.white,size: 15,),
                                      global.user.city != null?
                                     Row(children: [
                                       Text(
                                         "${global.user.city}" ,
                                         style: TextStyle(
                                             fontSize: 13,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white
                                         ),
                                       ),Text(',', style: TextStyle(
                                           fontSize: 13,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white
                                       ),),
                                       Text(
                                         "${global.user.state}" ,
                                         style: TextStyle(
                                             fontSize: 13,
                                             fontWeight: FontWeight.bold,
                                             color: Colors.white
                                         ),
                                       ),
                                     ],): Text(
                                        "Ikeja, Lagos",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(

                              children: [
                               // Icon(Icons.search_outlined,color: Colors.white,),
                                SizedBox(width: 15,),

                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(
                                     // MaterialPageRoute(builder: (context) => Notifications()),
                                      MaterialPageRoute(builder: (context) => ViewBookingScreen()),
                                    );
                                  },
                                    child: Icon(Icons.notifications_none_outlined,color: Colors.white,
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 20),

                        child: Container(

                          width: 310,
                            child: CarouselWithIndicator()
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: MyDropdownFormField<States>(
                              items: _stateList,
                              displayText: (state) => state.name!,
                              onSelected: (state) {
                                setState(() {
                                  _selectedState = state;
                                  // selectedStateValue  = state;
                                  getSearchArea(state.id);
                                });
                              },
                              labelText: 'State',
                            ),
                          ), const SizedBox(width: 10),
                          // Container(
                          //
                          //   child:
                          //
                          //   DropdownButtonHideUnderline(
                          //     child: DropdownButton2(
                          //       isExpanded: true,
                          //       hint: Row(
                          //         children: [
                          //           Icon(
                          //             Icons.list,
                          //             size: 16,
                          //             color: Colors.black87,
                          //           ),
                          //           SizedBox(
                          //             width: 4,
                          //           ),
                          //           Expanded(
                          //             child: Text(
                          //               "Select state ",
                          //               style: TextStyle(
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Colors.black87,
                          //               ),
                          //               overflow: TextOverflow.ellipsis,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //       items: _stateList
                          //           .map((item) => DropdownMenuItem<States>(
                          //         value: item,
                          //         child: Text(
                          //           item.name!,
                          //           style: const TextStyle(
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.bold,
                          //             color: Colors.black87,
                          //           ),
                          //           overflow: TextOverflow.ellipsis,
                          //         ),
                          //       ))
                          //           .toList(),
                          //       value: selectedStateValue,
                          //       onChanged: (value) {
                          //         setState(() {
                          //           selectedStateValue = value;
                          //
                          //
                          //           getArea(value?.id);
                          //
                          //
                          //         });
                          //       },
                          //       buttonStyleData: ButtonStyleData(
                          //         height: 50,
                          //         width: 180,
                          //         padding: const EdgeInsets.only(left: 14, right: 14),
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(7),
                          //           border: Border.all(
                          //             color: Colors.deepOrange,
                          //           ),
                          //           color: Colors.white,
                          //         ),
                          //         elevation: 2,
                          //       ),
                          //       iconStyleData: const IconStyleData(
                          //         icon: Icon(
                          //           Icons.arrow_forward_ios_outlined,
                          //         ),
                          //         iconSize: 14,
                          //         iconEnabledColor: Colors.black87,
                          //         iconDisabledColor: Colors.grey,
                          //       ),
                          //       // dropdownStyleData: DropdownStyleData(
                          //       //   maxHeight: 200,
                          //       //   width: 160,
                          //       //   padding: null,
                          //       //   decoration: BoxDecoration(
                          //       //     borderRadius: BorderRadius.circular(14),
                          //       //     color: Colors.white,
                          //       //   ),
                          //       //   elevation: 8,
                          //       //   offset: const Offset(0, 0),
                          //       //   scrollbarTheme: ScrollbarThemeData(
                          //       //     radius: const Radius.circular(30),
                          //       //     thickness: MaterialStateProperty.all<double>(6),
                          //       //     thumbVisibility: MaterialStateProperty.all<bool>(true),
                          //       //   ),
                          //       // ),
                          //       // menuItemStyleData: const MenuItemStyleData(
                          //       //   height: 40,
                          //       //   padding: EdgeInsets.only(left: 14, right: 14),
                          //       // ),
                          //     ),
                          //   ),
                          // ),
                          //  _areaList.length>0?


                          _areaList.length >0?
                          Expanded(
                            // width: 250,
                            child: MyDropdownFormFieldArea<Area>(
                              items: _areaList,
                              displayText: (area) => area.localName!,
                              onSelected: (area) {
                                setState(() {
                                  _selectedArea = area;
                                });
                              },
                              labelText: 'Area',
                            ),
                          ):
                          Container(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Select Area'),
                                Icon(Icons.arrow_drop_down_outlined)
                              ],
                            ),
                          )

                        ],
                      ),
                      //  StylishDropdownStateButton(items: _stateList, header: "State"),
                      SizedBox(height: 10,),
                      Container(
                        width: 390,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  size: 16,
                                  color: Colors.black87,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    " Select Category",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: _categoryList
                                .map((item) => DropdownMenuItem<Category>(
                              value: item,
                              child: Text(
                                item.title!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value:   selectedCategoryvalue,
                            onChanged: (value) {
                              setState(() {
                                selectedCategoryvalue = value;



                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 160,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.black87,
                              iconDisabledColor: Colors.grey,
                            ),
                            // dropdownStyleData: DropdownStyleData(
                            //   maxHeight: 200,
                            //   width: 160,
                            //   padding: null,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(14),
                            //     color: Colors.white,
                            //   ),
                            //   elevation: 8,
                            //   offset: const Offset(0, 0),
                            //   scrollbarTheme: ScrollbarThemeData(
                            //     radius: const Radius.circular(30),
                            //     thickness: MaterialStateProperty.all<double>(6),
                            //     thumbVisibility: MaterialStateProperty.all<bool>(true),
                            //   ),
                            // ),
                            // menuItemStyleData: const MenuItemStyleData(
                            //   height: 40,
                            //   padding: EdgeInsets.only(left: 14, right: 14),
                            // ),
                          ),
                        ),
                      )

                      // showCategory(),
                      ,

                      const SizedBox(height: 40),
                      ButtonGlobal(
                        isLoading: isLoading,
                        ontap:(){
                          setState(() {
                            isLoading = true;
                          });
                          searchhome();
                        },
                        //  OnBoardingPage(),
                        text: 'Search',
                        color: GlobalColors.primaryColor,
                        fontsize: 20,
                      ),
                    ],
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(20),
                //   child:
                //
                //   SearchBarForm(),
                //
                //
                // )



                Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Find by Categories",style: TextStyle(fontWeight: FontWeight.bold,),),
                          InkWell(
                              onTap: (){

                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => CategoryList()),
                                );
                              },
                              child: Text("See more",style: TextStyle(color: GlobalColors.primaryColor),
                              )
                          )
                        ],
                      ),

                      Container(
                        height: 230,
                          child: DisplayCategoryPage()
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recommeded Services",style: TextStyle(fontWeight: FontWeight.bold,),),
                            GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => ServiceList()),
                                  );
                                },
                                child: Text("See more",style: TextStyle(color: GlobalColors.primaryColor),))
                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(top: 15),
                           height: 150,
                          child: RecommendedBarbershopInHomePage()
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(" Popular Caregivers",style: TextStyle(fontWeight: FontWeight.bold,),),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => PopularCargivers()),
                                );
                              },
                                child: Text("See more",style: TextStyle(color: GlobalColors.primaryColor),
                                ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 110,
                          child: PopularcaregiverInHomePage()
                      ),





                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Products",style: TextStyle(fontWeight: FontWeight.bold,),),
                            InkWell(
                              onTap: (){
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context) => Products()),
                                // );
                              },
                                child: Text(
                                  " ",style: TextStyle(color: GlobalColors.primaryColor),
                                ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 15),

                          child: ProductsInHomePage()
                      ),
                    ],
                  ),
                )
              ],
            ):  DashboardContainer(),
          ),

        ),
      ),
      bottomNavigationBar: Container(
          height: 60,
          child: BottomNavBar(id: "home",)
      ),
    );
  }

Widget serviceProvider(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(children: [
          Expanded(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddServiceScreen()),
                );

              },
              child: Container(
                height: 100,
                width: 200,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                   // border: Border.all(width: 5, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.red
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white,size: 25,),
                    Text('Add a service', style: TextStyle(color: Colors.white, fontSize: 17),),
                  ],
                )
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>TransactionHistoryScreen()));


              },
              child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.green
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book, color: Colors.white,size: 25,),
                      Text('Transaction History', style: TextStyle(color: Colors.white, fontSize: 17),),
                    ],
                  )
              ),
            ),
          ),
        ],),
        SizedBox(height: 10,),
          global.user.isAdmin  != "1" ?
              Column(children: [
                Text(" My Services", style: TextStyle(color: Colors.black38,  fontSize: 14, fontWeight: FontWeight.bold),),
                Container(
                  height: 300,
                  child:
                  MyServiceListScreen()
                  ,),
                SizedBox(height: 30,),
              ],):Container()


      ],),
    );
}

  @override
  void initState() {
    _init();
    // TODO: implement initState
    super.initState();
  }

String walletBalance = "0.00";

  Widget adminDashboard(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                "Hi, ${global.user.fullName}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Image.asset("assets/TVstatsIcon.png",width: 24,height: 24,),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  Notifications()),
                        );
                      },
                      child: const Icon(Icons.notifications_none_outlined)
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: GlobalColors.primaryColor),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.visibility_outlined,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                     Text(
                      "₦$walletBalance",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Account number",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "0123456789",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.copy,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Commission Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.visibility_outlined,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const Text(
                      "₦0.00",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                text: "Fund",
                textColor: Colors.white,
                buttonColor: GlobalColors.primaryColor,
                widget:  Container(),
              ),
              Button(
                text: "Withdraw",
                textColor: GlobalColors.primaryColor,
                buttonColor: Colors.white,
                widget: Container(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Quick actions",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 QuickActionsButton(
                  linkPage: Placeholder(),
                  // linkPage: Transfer(),
                  imagePath: "assets/TransferIconColored.png",
                  text: "Transfer",
                  color: 0xffD0D0E3,
                ),
                 QuickActionsButton(
                  linkPage: TransactionHistoryScreen(),
                  imagePath: "assets/NQRIconColored.png",
                  text: "Transaction",
                  color: 0xffE9D1D8,
                ),
                QuickActionsButton(
                  linkPage: Container(),
                  imagePath: "assets/POSIconColored.png",
                  text: "POS",
                  color: 0x26FFA500,
                ),
                QuickActionsButton(
                  linkPage: Accountpayment(),
                  imagePath: "assets/billPaymentIconColored.png",
                  text: "Funds",
                  color: 0x264BB543,

                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                "View all",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: GlobalColors.linkButtonColor),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const RecentTransactions(),
          const RecentTransactions(),
          const RecentTransactions(),
        ],
      ),
    );
  }

  Widget serviceProviderDashboard(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Hi, ${global.user.fullName}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Image.asset("assets/TVstatsIcon.png",width: 24,height: 24,),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  Notifications()),
                        );
                      },
                      child: const Icon(Icons.notifications_none_outlined)
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: GlobalColors.primaryColor),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.visibility_outlined,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                     Text(
                      "₦$walletBalance",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Account number",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "0123456789",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.copy,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Commission Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.visibility_outlined,
                          size: 24,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const Text(
                      "₦0.00",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                text: "Fund",
                textColor: Colors.white,
                buttonColor: GlobalColors.primaryColor,
                widget:  Container(),
              ),
              Button(
                text: "Withdraw",
                textColor: GlobalColors.primaryColor,
                buttonColor: Colors.white,
                widget: Container(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Quick actions",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuickActionsButton(
                  linkPage: AddServiceScreen(),
                  // linkPage: Transfer(),
                  imagePath: "assets/TransferIconColored.png",
                  text: "Add Service",
                  color: 0xffD0D0E3,
                ),
                QuickActionsButton(
                  linkPage: TransactionHistoryScreen(),
                  imagePath: "assets/NQRIconColored.png",
                  text: "Transaction",
                  color: 0xffE9D1D8,
                ),
                QuickActionsButton(
                  linkPage: MyServiceListScreen(),
                  imagePath: "assets/POSIconColored.png",
                  text: "View Service",
                  color: 0x26FFA500,
                ),
                QuickActionsButton(
                  linkPage: Accountpayment(),
                  imagePath: "assets/billPaymentIconColored.png",
                  text: "Funds",
                  color: 0x264BB543,

                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              Text(
                "View all",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: GlobalColors.linkButtonColor),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const RecentTransactions(),
          const RecentTransactions(),
          const RecentTransactions(),
        ],
      ),
    );
  }


  void getSearchArea(int? id) async {

    _areaList.clear();
    setState(() { });
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          //    showOnlyLoaderDialog();
          await apiHelper?.getAreaList(id!).then((result) {
            //   hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<Area> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                // ref.watch(myprovider).setArea(_tList);

                _areaList.addAll(_tList);
                _isAreaDataLoaded = true;
                setState(() {
                  //  _isMoreDataLoaded = false;
                });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showSnack(snackBarMessage: "No Network ");
      }
    } catch (e) {
      print("Exception - stylishdropdownstatebuttonscreen.dart - _getarea():" + e.toString());
    }
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
        showNetworkErrorSnackBar(_scaffoldkey);

      }
    } catch (e) {
      print("Exception - hopCategoryScreen.dart - _getCategory():" +
          e.toString());
    }
  }

  _init() async {
    try {

      await   _getWalletBalance();
      await  _getAllCategory() ;
      await  _getState();




      _isDataLoaded = true;
      setState(() {});
    } catch (e) {
      print("Exception - initcatgory.dart - _initFinal():" + e.toString());
    }
  }

  _getState() async {
    _stateList.clear();
    // _areaList.clear();
    setState(() { });
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          // showOnlyLoaderDialog();
          await apiHelper?.getAllState().then((result) {
            //  hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                List<States> _tList = result.recordList;

                             // ref.watch(myprovider).setZone(_tList);

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }


                _stateList.addAll(_tList);



                setState(() { });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }
    } catch (e) {
      print("Exception - signupscreen.dart - _getstate():" + e.toString());
    }
  }

  _getWalletBalance() async {

    setState(() { });
    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          // showOnlyLoaderDialog();
          await apiHelper?.getWalletBalance(global.user.id!).then((result) {
            //  hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                WalletResponse _tList = result.recordList;

                // ref.watch(myprovider).setZone(_tList);
                walletBalance = _tList.balance!;


                if (_tList.toString().isEmpty) {
                  _isRecordPending = false;
                }






                setState(() { });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showNetworkErrorSnackBar(_scaffoldkey);
      }
    } catch (e) {
      print("Exception - homescreen.dart - getwallet():" + e.toString());
    }
  }

  void searchhome() async {

    setState(() {
      isLoading = false;
    });

    if(  _selectedState?.id == null){
      showSnack(snackBarMessage: "Choose a state");
      return;
    };
    if(  _selectedArea?.id == null){
      showSnack(snackBarMessage: "Choose an area");
      return;
    };


    try {
      bool isConnected = await br!.checkConnectivity();
      if (isConnected) {
        if (_isRecordPending) {
          // showOnlyLoaderDialog();
          await apiHelper?.getSearchResult(state: _selectedState!.id,
              title: _search.text.trim(),
              category_id: selectedCategoryvalue?.id,
              city: _selectedArea!.id ).then((result) {
            //   hideLoader();
            if (result != null) {
              if (result.resp_code == "00") {
                _serviceList.clear();
                List<Service> _tList = result.recordList;

                if (_tList.isEmpty) {
                  _isRecordPending = false;
                }

                _serviceList.addAll(_tList);
                _isDataLoaded = true;
                // ref.watch(myprovider).setArea(_tList);

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) =>
                  //BarberShopDescriptionScreen(_barberShopList[index].vendor_id, a: widget.analytics, o: widget.observer)),
                  SearchResultScreen(_serviceList)),
                );

                // _areaList.addAll(_tList);

                setState(() {
                  //  _isMoreDataLoaded = false;
                });

                // } else {
                //   _zoneList = [];
              }
            }
          });
        }
      } else {
        showSnack(snackBarMessage: "No Network ");
      }
    } catch (e) {
      print("Exception - stylishdropdownstatebuttonscreen.dart - _getarea():" + e.toString());
    }
  }

  String calculateAge(String birthDated) {

    DateTime birthDate = DateTime.parse(birthDated);
    print("hello birthday $birthDate"); // 2020-01-02 03:04:05.000


    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age.toString();
  }

  Widget DashboardContainer() {
    if( global.user.role  == "SERVICE_PROVIDER"){
      return serviceProviderDashboard();
    }else if(global.user.isAdmin== "1"){
      return adminDashboard();
    }else{
      return Container();
    }


  }
}
// class BannerImages {
//   static const String banner1 =
//       "Images/HomepageBannerImage2.png";
//   static const String banner2 =
//       "Images/HomepageBannerImage3.png";
//   static const String banner3 = "Images/HomepageBannerImage.png";
//
//   static List<BannerModel> listBanners = [
//     BannerModel(imagePath: banner1, id: "1"),
//     BannerModel(imagePath: banner2, id: "2"),
//     BannerModel(imagePath: banner3, id: "3"),
//   ];
// }


class QuickActionsButton extends StatelessWidget {
   QuickActionsButton({Key? key, required this.imagePath, required this.text,required this.linkPage, required this.color})
      : super(key: key);
  final String imagePath;
  final String text;
  final Widget linkPage;
  final int color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => linkPage),
            );
          },
          child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(color),
                  borderRadius: BorderRadius.circular(50)),
              child: Image.asset(
                imagePath,
                height: 26,
                width: 26,
              )
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return


      Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: GlobalColors.primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child:  Image.asset(
                    "assets/airtimeIcon.png",
                    color: Colors.white,
                    height: 18.67,
                    width: 18.67,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Airtime",
                      style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "June 26,2023,06:12pm",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: GlobalColors.primaryColor.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "+ ₦50,000.00",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}