import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/View/registration/who_are_you_login_view.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/provider/model_hud.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class EmployerSettings extends StatefulWidget {
  static String routeId = 'EmployerSettings';
  @override
  _EmployerSettingsState createState() => _EmployerSettingsState();
}

class _EmployerSettingsState extends State<EmployerSettings> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHud>(context).isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          backgroundColor: kMainColor,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.25,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(50)),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Column(
                        children: [
                          Text(
                            'Medical Company',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          SizedBox(height: height * 0.03),
                          Container(
                            height: height * 0.18,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: Image.network(
                              'https://as2.ftcdn.net/v2/jpg/03/00/78/15/1000_F_300781571_Ias0VZMXYsxJJdlV5WfdmqwQk5Ctsoa1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark mode',
                          style: TextStyle(
                            color: kMainColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        CupertinoSwitch(
                            activeColor: kMainColor,
                            // activeTrackColor: kMainColor,
                            trackColor: Colors.grey[300],
                            value: isDarkMode,
                            onChanged: (value) {
                              setState(() {
                                isDarkMode = value;
                              });
                            }),
                      ],
                    ),
                    Divider(
                      height: 10,
                      color: Colors.black,
                    ),
                    SizedBox(height: height * 0.03),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Language',
                            style: TextStyle(
                              color: kMainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: kMainColor,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Divider(
                      height: 10,
                      color: Colors.black,
                    ),
                    SizedBox(height: height * 0.1),
                    CustomButton(
                        width: width * 0.4,
                        onPressed: () {
                          Navigator.pushNamed(context, WhoAreYouView.routeId);
                        },
                        text: 'Logout',
                        backgroundColor: kSecondColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
