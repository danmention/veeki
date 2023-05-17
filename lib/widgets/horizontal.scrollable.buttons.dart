import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';

class HorizontalButtonsList extends StatefulWidget {
  HorizontalButtonsList({Key? key}) : super(key: key);
  _HorizontalButtonsListState createState() => _HorizontalButtonsListState();
}

class _HorizontalButtonsListState extends State<HorizontalButtonsList> {
  var ChosenHairstylist = null;
  void initState(){
    super.initState();
    ChosenHairstylist = "";
  }
  var list = ['John Smith','Alexander','Nacho','Johnathan','Wilfred','Graham Arnold','Rahul Gonzalez','Kovacic Van',];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 8.0,bottom: 8.0,right: 8.0),
                child: InkWell(
                  onTap: (){

                    setState(() {
                      ChosenHairstylist = index;
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width:  150,
                      decoration: BoxDecoration(
                        color: ChosenHairstylist == index? GlobalColors.primaryColor : Colors.white54,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const CircleAvatar(
                          //   backgroundImage: AssetImage('Images/download.png'),
                          //   radius: 50,
                          // ),
                          Image.asset('Images/download.png',),
                          Text(
                            list[index],
                            style: TextStyle(
                              color: ChosenHairstylist == index? Colors.white : GlobalColors.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(),
                        ],
                      )

                  ),
                ),
              );
            }
        ),
      ),
    );
  }

}
