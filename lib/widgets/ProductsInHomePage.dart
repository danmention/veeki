import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spa/utils/global.colors.dart';

class ProductsInHomePage extends StatefulWidget {
  ProductsInHomePage({Key? key}) : super(key: key);
  _ProductsInHomePageInHomePageState createState() => _ProductsInHomePageInHomePageState();
}

class _ProductsInHomePageInHomePageState extends State<ProductsInHomePage> {

  var list = ['Growing Oil','Cut Shampoo','Perfume Shampoo','Mani Shampoo','Silky Shampoo','Hair Dryer','Black Gel'];
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
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    // alignment: Alignment.center,
                    height: 220,
                    width:  100,
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
                            child: Image.asset("Images/Products.png",
                            ),
                          ),
                        ),
                        SizedBox(height:8,),
                        Text(
                          list[index],
                          style: TextStyle(
                            color:  Colors.black87,
                            fontSize: 10.5,
                          ),
                            ),
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
