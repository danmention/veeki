import 'package:flutter/material.dart';

import '../HomePage.dart';
import '../Profile.dart';
import '../utils/global.colors.dart';
import '../widgets/back.button.global.dart';
import '../widgets/options_container.dart';

class FundWallet extends StatelessWidget {
  const FundWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    BackButtonGlobal(
                      widget: HomePage(),
                     // widget: bottomNav(index: 0,),
                    ),
                    Text(
                      "Fund wallet",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(height: 30,),

                Container(
                  padding: const EdgeInsets.all(15),
                  height: 172,
                  decoration: BoxDecoration(
                    border: Border.all(color: GlobalColors.unactiveColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>  HomePage()),
                          );
                        },
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
                                    "assets/BankIcon.png",
                                    color: Colors.white,
                                    height: 18.67,
                                    width: 18.67,
                                  ),
                                ),
                                const SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Bank Transfer",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "Fund your wallet from any Nigerian bank",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: GlobalColors.unactiveColor.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios_outlined,size: 16,color: GlobalColors.primaryColor.withOpacity(0.5)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      const Divider(thickness: 1,),
                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vine Account number",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,fontSize: 14,
                                  color: GlobalColors.unactiveColor.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                "0013075689",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(left: 10),
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.copy,size: 16,),
                                Text("Copy",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400),)
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20,),
                OptionsContainer(linkPage: Profile(),imagePath: "assets/cardIcon.png", text: "Bank Card/Account", subtext: "Fund your bank card or account"),
                OptionsContainer(linkPage: Profile(),imagePath: "assets/cardIcon.png", text: "Cash Deposit", subtext: "Fund account with nearby merchants"),
                OptionsContainer(linkPage: Profile(),imagePath: "assets/USSDIcon.png", text: "USSD", subtext: "Use your other bank's USSD code"),
                OptionsContainer(linkPage: Profile(),imagePath: "assets/receiveMoneyIcon.png", text: "Receive money", subtext: "Share your account and ask for transfer"),

              ],
            ),
          ),
        ),
      ),
    );
  }
}