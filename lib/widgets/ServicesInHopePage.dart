import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';

class ServicesInHopePage extends StatefulWidget {
  ServicesInHopePage({Key? key}) : super(key: key);
  _ServicesInHopePageState createState() => _ServicesInHopePageState();
}

class _ServicesInHopePageState extends State<ServicesInHopePage> {

  var list = ['Haircut','Treatment','Shaving','Beard trimming','Kids hair cut','Facials & massages',];
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
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width:  150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage("Images/HomepageBannerImage3.png"),
                          fit: BoxFit.cover,
                          opacity:150,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            blurStyle: BlurStyle.inner
                          )
                        ],
                      ),
                      child:
                          Text(
                            list[index],
                            style: TextStyle(
                              color:  Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

}
