import 'package:flutter/material.dart';

import '../utils/global.colors.dart';

class OptionsContainer extends StatelessWidget {
  const OptionsContainer({Key? key, required this.text, required this.subtext, required this.imagePath, required this.linkPage}) : super(key: key);

  final String imagePath;
  final String text;
  final String subtext;
  final Widget linkPage;


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>  linkPage),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            height: 68,
            decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.unactiveColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: GlobalColors.primaryColor,
                          borderRadius: BorderRadius.circular(50)),
                      child:  Image.asset(
                        imagePath,
                        color: Colors.white,
                        height: 18.67,
                        width: 18.67,
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          text,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15
                          ),
                        ),
                        Expanded(
                          child: Text(
                            subtext,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: GlobalColors.primaryColor.withOpacity(0.5),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined,size: 16,color: GlobalColors.primaryColor.withOpacity(0.5)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20,)
      ],
    );
  }
}