import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';

class PopularBarbersInHomePage extends StatefulWidget {
  PopularBarbersInHomePage({Key? key}) : super(key: key);
  _PopularBarbersInHomePageState createState() => _PopularBarbersInHomePageState();
}

class _PopularBarbersInHomePageState extends State<PopularBarbersInHomePage> {

  var list = ['John Smith','Alexander','Nacho','Johnathan','Wilfred','Graham Arnold','Rahul Gonzalez','Kovacic Van',];
  @override
  Widget build(BuildContext context){
    return  Container(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 8.0,bottom: 8.0,right: 8.0),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('Images/download.png'),
                          radius: 30,
                        ),
                        Text(list[index],
                        style: TextStyle(
                          fontSize: 10,
                        )
                          ,)
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      );
  }
}

