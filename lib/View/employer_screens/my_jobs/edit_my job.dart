import 'package:flutter/material.dart';
import 'package:medical_hiring/View/registration/Employee/register_Employee.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:medical_hiring/widget/custom_text_form_field.dart';

import '../../../constants.dart';

class EditMyJob extends StatelessWidget {
  static String routeId = 'EditMyJob';
  List<String> genderList = ['Male', 'Female'];
  String selectGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(
            titleAppbar: 'Edit Job',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0.5,
                          offset: Offset(5, 5.0),
                          blurRadius: 5.0,
                        )
                      ]),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About job Title',
                          style: TextStyle(
                              color: kSecondColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),

                        ///Job title
                        CustomTextFormField(
                          onSaved: (value) {},
                          hint: 'ex.IOS Developer',
                          label: 'Job Title',
                          colorLabel: kMainColor,
                          colorBorder: kSecondColor,
                        ),
                        SizedBox(height: 20),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 20),

                        /// Job Field
                        CustomTextFormField(
                          onSaved: (value) {},
                          hint: 'ex. Software',
                          label: 'Job Field',
                          colorLabel: kMainColor,
                          colorBorder: kSecondColor,
                        ),
                        SizedBox(height: 20),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 20),

                        /// Job Details
                        CustomTextFormField(
                          onSaved: (value) {},
                          hint: 'ex. Software',
                          label: 'Details',
                          colorLabel: kMainColor,
                          colorBorder: kSecondColor,
                        ),
                        SizedBox(height: 20),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 20),

                        ///Salary
                        CustomTextFormField(
                          onSaved: (value) {},
                          hint: 'ex. 10.00',
                          label: 'Salary',
                          colorLabel: kMainColor,
                          colorBorder: kSecondColor,
                        ),
                        SizedBox(height: 20),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 20),

                        /// Gender
                        CustomDropDownButton(
                            hint: 'ex. Male',
                            label: 'Gender',
                            colorLabel: kMainColor,
                            onChanged: (value) {},
                            selectValue: selectGender,
                            items: genderList),
                        SizedBox(height: 20),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 20),

                        /// Experience
                        CustomTextFormField(
                          onSaved: (value) {},
                          hint: 'ex. 5 years',
                          label: 'Experience',
                          colorLabel: kMainColor,
                          colorBorder: kSecondColor,
                        ),
                        SizedBox(height: 20),
                        Divider(height: 10, thickness: 1),
                        SizedBox(height: 20),

                        /// Qualification
                        CustomTextFormField(
                          onSaved: (value) {},
                          hint: 'ex. Bachelors Degree',
                          label: 'Qualification',
                          colorLabel: kMainColor,
                          colorBorder: kSecondColor,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                onPressed: () {},
                text: 'Edit',
                backgroundColor: kSecondColor,
                width: MediaQuery.of(context).size.width * 0.5,
              ),
              SizedBox(height: 50),
            ],
          ),
        ));
  }
}
