import 'package:flutter/material.dart';
import 'package:veeki/utils/constant.dart';
import 'package:veeki/widgets/BottomNavBar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About us'),),
      bottomNavigationBar: Container(
          height: 60,
          child: BottomNavBar(id: "about",)
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
            child: Column(
              children: [

                Image.asset('assets/tera.jpg'),
                SizedBox(height: 30,),
                Text(about, style: TextStyle(fontSize: 16),),
                SizedBox(height: 30,),
                Text(whychoose),

                SizedBox(height: 20,),
                Text(works),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
