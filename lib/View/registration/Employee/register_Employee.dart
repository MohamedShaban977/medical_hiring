import 'package:flutter/material.dart';
import 'package:medical_hiring/View/registration/Employee/employee_job_dateEntry.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:medical_hiring/widget/custom_text_form_field.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegisterEmployee extends StatefulWidget {
  static String routeId = 'RegisterEmployee';
  @override
  _RegisterEmployeeState createState() => _RegisterEmployeeState();
}

class _RegisterEmployeeState extends State<RegisterEmployee> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  ///Text field
  String usrName, email, password, confirmPassword, currentAddress;

  ///drop Down
  String selectCountry;
  String selectGender;
  String selectCity;
  List<String> country = [
    'Egypt',
    'Bahrain',
    'Iraq',
    'Jordan',
    'Kuwait',
    'Lebanon',
    'Libya',
    'Morocco',
    'Oman',
    'Palestine',
    'Qatar',
    'Saudi Arabia',
    'Syria',
    'Tunisia',
    'United Arab Emirates',
    'Yemen'
  ];

  List<String> city = [
    'Cairo',
    'Giza',
    'Alexandria',
    'Luxor',
    'Port Said',
    'Suez',
    'Tanta',
    'Asyut',
    'Fayoum',
    'Damanhur',
    'Khusus',
    'Zagazig',
    'Ismailia',
    'Aswan',
    'El-Minya',
    'Damietta'
  ];

  List<String> gender = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: height * 0.04),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 25,
                            color: kBlackColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      // height: height * 0.88,
                      width: width,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.04),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Form(
                              key: _globalKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// User Name
                                  CustomTextFormField(
                                      validator: (String value) => value.isEmpty
                                          ? 'User Name is Empty'
                                          : null,
                                      onSaved: (value) => usrName = value,
                                      hint: 'User Name',
                                      label: 'User Name'),
                                  SizedBox(height: height * 0.02),

                                  /// Email
                                  CustomTextFormField(
                                      validator: (String value) => value.isEmpty
                                          ? 'Email is Empty'
                                          : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)
                                              ? null
                                              : 'Check your email',
                                      onSaved: (value) => email = value,
                                      hint: 'Email',
                                      label: 'Email'),
                                  SizedBox(height: height * 0.02),

                                  ///  Password
                                  CustomTextFormField(
                                      validator: (String value) => value.isEmpty
                                          ? 'Password is Empty'
                                          : value.length + 1 <= 6
                                              ? 'Password is less than 6 items'
                                              : null,
                                      onSaved: (value) => password = value,
                                      hint: 'Password',
                                      label: 'Password'),
                                  SizedBox(height: height * 0.02),

                                  /// Confirm Password
                                  CustomTextFormField(
                                      validator: (String value) => value.isEmpty
                                          ? 'Confirm Password is Empty'
                                          : confirmPassword != password
                                              ? 'Confirm Password not equal password'
                                              : null,
                                      onSaved: (value) =>
                                          confirmPassword = value,
                                      hint: 'Confirm Password',
                                      label: 'Confirm Password'),

                                  SizedBox(height: height * 0.02),

                                  /// Gender
                                  CustomDropDownButton(
                                    validator: (value) =>
                                        value == null ? 'field required' : null,
                                    hint: 'Gender',
                                    label: 'Gender',
                                    items: gender,
                                    selectValue: selectGender,
                                    onChanged: (value) {
                                      setState(() {
                                        selectGender = value;
                                      });
                                    },
                                  ),

                                  SizedBox(height: height * 0.02),

                                  /// Country

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: CustomDropDownButton(
                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,
                                          hint: 'Country',
                                          label: 'Country',
                                          items: country,
                                          selectValue: selectCountry,
                                          onChanged: (value) {
                                            setState(() {
                                              selectCountry = value;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Expanded(
                                        flex: 1,
                                        child: CustomDropDownButton(
                                          validator: (value) => value == null
                                              ? 'field required'
                                              : null,

                                          hint: 'City',
                                          label: 'City',
                                          onChanged: (value) {
                                            setState(() {
                                              selectCity = value;
                                            });
                                          },
                                          selectValue: selectCity,
                                          items: city,
                                          // width: width * 0.35,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: height * 0.02),

                                  CustomTextFormField(
                                      validator: (value) => value.isEmpty
                                          ? 'Current Address is Empty'
                                          : null,
                                      // width: width * 0.5,
                                      onSaved: (value) {},
                                      hint: 'Current Address',
                                      label: 'Current Address'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          CustomButton(
                              onPressed: () async {
                                _globalKey.currentState.save();
                                if (_globalKey.currentState.validate()) {}

                                // final modelHud = Provider.of<ModelHud>(context,
                                //     listen: false);
                                // modelHud.changeIsLoading(true);
                                // await Future.delayed(Duration(seconds: 2),
                                //     () async {
                                //   modelHud.changeIsLoading(true);
                                //   modelHud.changeIsLoading(false);
                                // });

                                Navigator.pushNamed(
                                    context, EmployeeJobDataEntry.routeId);
                              },
                              text: 'Next',
                              width: width * 0.4,
                              backgroundColor: kSecondColor),
                          SizedBox(height: height * 0.02),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 20,
                  top: 30,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: kBlackColor,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  right: -40,
                  top: -40,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff45C5BD).withOpacity(0.5),
                    radius: 60,
                  ),
                ),
                Positioned(
                  left: -40,
                  bottom: -40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white12,
                    radius: 60,
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //     height: height * 0.07,
            //     width: width * 0.4,
            //     clipBehavior: Clip.antiAlias,
            //     decoration:
            //         BoxDecoration(borderRadius: BorderRadius.circular(10)),
            //     child: RaisedButton(
            //       onPressed: () {},
            //       child: Text(
            //         'Next',
            //         style: TextStyle(color: Colors.white),
            //       ),
            //       color: Color(0xff45C5BD),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class CustomDropDownButton extends StatelessWidget {
  final String hint, label;
  final Function onChanged, validator;
  final selectValue;
  final List<String> items;
  final width;
  final Color colorLabel;

  CustomDropDownButton(
      {@required this.hint,
      @required this.label,
      @required this.onChanged,
      @required this.selectValue,
      @required this.items,
      this.width,
      this.colorLabel = kWhiteColor,
      @required this.validator});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: colorLabel,
          ),
        ),
        SizedBox(height: height * 0.01),
        Container(
          width: width,
          // height: height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: DropdownButtonFormField(
              validator: validator,
              isExpanded: true,
              dropdownColor: Colors.white,
              hint: Text(hint),
              style: TextStyle(fontSize: 20, color: Colors.black),
              items: items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,

              //     (value) {
              //   setState(() {
              //     selectCountry = value;
              //   });
              // },
              value: selectValue,
            ),
          ),
        ),
      ],
    );
  }
}
