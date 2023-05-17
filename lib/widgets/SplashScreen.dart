import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:spa/HomePage.dart';
import 'package:spa/utils/global.colors.dart';
import 'package:spa/widgets/BottomNavBar.dart';
import 'package:spa/widgets/Profile.Buttons.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscreenImage(String assetName,) {
    return Image.asset(
      'Images/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('Images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

     const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            //child: _buildImage('HomepageBannerImage.png', 100),
          ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [

        PageViewModel(
          title: "Find Barber Shop Nearby",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus.",
          image: _buildFullscreenImage('Barbershop.png'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 3,
            safeArea: 100,
            titleTextStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
        PageViewModel(
          title: "Professional Barber Specialists",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus.",

          image: _buildFullscreenImage('barber.png'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 3,
            safeArea: 100,
            titleTextStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
        PageViewModel(
          title: "Get Reward Points & Promotions",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus.",
          image: _buildFullscreenImage('barbing.png'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 3,
            safeArea: 100,
            titleTextStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
        PageViewModel(
          title: "Full Screen Page",
          body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus.",
          image: _buildFullscreenImage('barber.png'),
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 0,
            imageFlex: 3,
            safeArea: 100,
            titleTextStyle: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),

      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      //showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFF1E0909),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}


