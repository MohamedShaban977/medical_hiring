import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medical_hiring/View/registration/who_are_you_login_view.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/core/cache_helper_sharedPref/cache_helper.dart';
import 'package:medical_hiring/core/router/router.dart';
import 'package:medical_hiring/widget/custom_button.dart';

class IntroScreen extends StatefulWidget {
  // static String routeId = 'IntroScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<PageViewModel> pages = [
    PageViewModel(
      title: '',
      body:
          'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
      image: Image.asset(
        'assets/images/splash/splash2.png',
        // fit: BoxFit.contain,
      ),
      decoration: PageDecoration(
        // titlePadding: EdgeInsets.all(0),
        bodyTextStyle: TextStyle(
          fontSize: 18,
          color: kMainColor,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
      ),
    ),
    PageViewModel(
      title: '',
      body:
          'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
      image: Image.asset(
        'assets/images/splash/splash3.png',
        fit: BoxFit.cover,
      ),
      decoration: PageDecoration(
        // titlePadding: EdgeInsets.all(0),
        bodyTextStyle: TextStyle(
          fontSize: 18,
          color: kMainColor,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
      ),
    ),
    PageViewModel(
      title: '',
      body:
          'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
      image: Image.asset(
        'assets/images/splash/splash4.png',
        fit: BoxFit.cover,
      ),
      decoration: PageDecoration(
        // titlePadding: EdgeInsets.all(0),
        bodyTextStyle: TextStyle(
          fontSize: 18,
          color: kMainColor,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 100),
              Expanded(
                flex: 1,
                child: IntroductionScreen(
                  pages: pages,
                  next: Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 18,
                      color: kMainColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  skip: Text(
                    'SKIP',
                    style: TextStyle(
                      fontSize: 18,
                      color: kMainColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  onSkip: () => storeOnBoardInfo(),
                  showSkipButton: true,
                  showDoneButton: false,
                  dotsDecorator: DotsDecorator(
                    size: const Size.square(10.0),
                    activeSize: const Size(20.0, 10),
                    activeColor: kMainColor,
                    color: Colors.black26,
                    spacing: const EdgeInsets.symmetric(horizontal: 10),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                  ),
                ),
              ),
              Expanded(
                  flex: 0,
                  child: CustomButton(
                    onPressed: () => storeOnBoardInfo(),
                    backgroundColor: kMainColor,
                    borderColor: kMainColor,
                    width: width * 0.6,
                    text: 'Get Stared',
                  )),
              SizedBox(height: 100),
            ],
          ),
          Positioned(
            right: -40,
            top: -40,
            child: CircleAvatar(
              backgroundColor: kMainColor.withOpacity(0.4),
              radius: 70,
            ),
          ),
          Positioned(
            left: -40,
            bottom: -40,
            child: CircleAvatar(
              backgroundColor: Color(0xff45C5BD).withOpacity(0.5),
              radius: 60,
            ),
          ),
        ],
      ),
    );
  }

  void storeOnBoardInfo() {
    CacheHelper.saveData(
      key: 'onBoard',
      value: true,
    ).then((value) {
      if (value) {
       MagicRouter.navigateAndFinish( WhoAreYouView());
      }
    });

    print("Shared pref called");
  }
}
