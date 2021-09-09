import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/View/registration/Employee/employee_job_dateEntry.dart';
import 'package:medical_hiring/View/registration/who_are_you_login_view.dart';
import 'package:medical_hiring/constants.dart';
import 'file:///F:/Android/algorithm/medical_hiring/medical_hiring/lib/provider/model_hud.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class EmployeeSettings extends StatefulWidget {
  static String routeId = 'EmployeeSettings';
  @override
  _EmployeeSettingsState createState() => _EmployeeSettingsState();
}

class _EmployeeSettingsState extends State<EmployeeSettings> {
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
          child: Stack(
            children: [
              Container(
                height: height,
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          )),
                      // child:
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                // bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.02),
                    Text(
                      'Amr Eltohamy',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    SizedBox(height: height * 0.03),
                    Image.asset(
                      'assets/images/Path.png',
                      fit: BoxFit.cover,
                      height: height * 0.25,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                  width: width * 0.4,
                                  onPressed: () async {
                                    final modelHud = Provider.of<ModelHud>(
                                        context,
                                        listen: false);
                                    modelHud.changeIsLoading(true);
                                    await Future.delayed(Duration(seconds: 2),
                                        () async {
                                      modelHud.changeIsLoading(true);
                                      modelHud.changeIsLoading(false);
                                    });

                                    Navigator.pushNamed(
                                        context, EmployeeJobDataEntry.routeId);
                                  },
                                  text: 'Edit Profile',
                                  backgroundColor: kSecondColor),
                              CustomButton(
                                  width: width * 0.4,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, WhoAreYouView.routeId);
                                  },
                                  text: 'Logout',
                                  backgroundColor: kSecondColor),
                            ],
                          ),
                        ],
                      ),
                    ),
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
