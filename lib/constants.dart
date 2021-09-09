import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const kMainColor = Color(0xff000080);
const kSecondColor = Color(0xff45C5BD);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;


bool onBoarding ;

String tokenEmployer ;
String tokenEmployee ;


String lang = 'en';

bool isEmployee= false;
bool isEmployer= false;

bool isGuest = false;

ThemeData theme = ThemeData(
    platform: TargetPlatform.android,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorLight: Colors.white,
    // cardColor: kLogoColorLight,
    // accentColor: kAccentColor,

    // cursorColor: kPrimaryColor,
    // canvasColor: Colors.white.,
    // fontFamily: 'gr/eta',

    appBarTheme: AppBarTheme(
      backgroundColor: kMainColor,
      iconTheme: IconThemeData(color: Colors.white),
      // actionsIconTheme: IconThemeData(color: Colors.black,size: ),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white, fontSize: 25),
        // headline3: TextStyle(color: Colors.black, fontSize: 30)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              kSecondColor,
            ), //button color
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            // textStyle: MaterialStateProperty.all<TextStyle>(
            //     TextStyle(color: Colors.white, fontSize: 25)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              // side: BorderSide(color: Colors.red)
            ))) //text (and icon)
        ),

    //   textButtonTheme: TextButtonThemeData(
    //
    //   style: ButtonStyle(
    //     // foregroundColor: MaterialStateProperty.all(Colors.white),
    //
    //     backgroundColor: MaterialStateProperty.all(kPrimaryColor),
    //   ),
    // ),

    textTheme: TextTheme(
      /// style titleTextFormField
      headline1: TextStyle(
          color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.w600),

      /// style Hint TextFormField
      headline2: TextStyle(
        color: Colors.black54,
        fontSize: 18,
      ),

      /// style  TextFormField

      headline3: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      headline4: TextStyle(
          color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.w600),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.black38,
      thickness: 2,
    ));


void showToast ({String message ,Color backgroundColor})=> Fluttertoast.showToast(
msg: message,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
backgroundColor: backgroundColor,
textColor: Colors.white,
fontSize: 16.0,
);
//
// navigatTo(context,widget){
//
//   Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
// }
//
// navigatAndFinish(context,widget){
//
//   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>widget));
// }
