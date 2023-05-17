import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/Details.dart';
import 'package:spa/utils/global.colors.dart';

class RecommendedBarbershopInHomePage extends StatefulWidget {
  RecommendedBarbershopInHomePage({Key? key}) : super(key: key);
  _RecommendedBarbershopInHomePageState createState() => _RecommendedBarbershopInHomePageState();
}

class _RecommendedBarbershopInHomePageState extends State<RecommendedBarbershopInHomePage> {

  var list = ['Captain Salon','Breaking Barbershop','Something Salon','Something Salon','Something Salon','Something Salon',];
  @override
  Widget build(BuildContext context){
    return
       Container(
        height: 120,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 0.0,bottom: 0.0,right: 8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Details())
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                   // alignment: Alignment.center,
                    height: 220,
                    width:  150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            //blurStyle: BlurStyle.inner
                        )
                      ],
                    ),
                    child:
                    Column(
                      children: [
                        FittedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset("Images/HomepageBannerImage.png",
                            ),
                          ),
                        ),
                        SizedBox(height:8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              list[index],
                              style: TextStyle(
                                color:  Colors.black87,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "4.7",
                                  style: TextStyle(
                                    color:  Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                ),
                                Icon(Icons.star,color: Colors.yellow,size: 11,)
                              ],
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined,size: 12,),
                            Text(" St Luke's Guarden, Liverpool",
                              style: TextStyle(
                                color:  Colors.black87,
                                fontSize: 9.5,
                              ),
                            ),
                          ],
                        )
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
