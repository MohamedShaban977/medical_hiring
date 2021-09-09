import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/View/registration/Employer/employer_company_data.dart';
import 'package:medical_hiring/View/registration/cubit/cubit.dart';
import 'package:medical_hiring/View/registration/cubit/states.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/core/router/router.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:medical_hiring/widget/custom_text_form_field.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterEmployer extends StatelessWidget {
  static String routeId = 'RegisterEmployer';

  String companyName, email, password, confirmPassword;
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppRegisterCubit cubit = AppRegisterCubit.get(context);
        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: false,
            color: kMainColor,
            opacity: 0.5,
            progressIndicator: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kSecondColor)),
            child: SingleChildScrollView(
              child: Stack(
                // fit: StackFit.passthrough,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 1,
                        width: width,
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.02),
                            Image.asset(
                              'assets/images/registration/registerEmployer.png',
                              height: height * 0.19,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // SizedBox(height: height * 0.01),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.03),
                          Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: Form(
                              key: _globalKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///
                                  CustomTextFormField(
                                    validator: (String value) =>
                                        value.isEmpty ? 'Name is Empty' : null,
                                    onSaved: (value) => companyName = value,
                                    hint: 'Company Name',
                                    label: 'Company Name',
                                    keyboardType: TextInputType.name,
                                  ),
                                  SizedBox(height: height * 0.02),

                                  ///
                                  CustomTextFormField(
                                    validator: (String value) => value.isEmpty
                                        ? 'Email is Empty'
                                        : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(value)
                                            ? null
                                            : 'Check your email',
                                    onSaved: (value) => email = value,
                                    hint: 'Email',
                                    label: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  SizedBox(height: height * 0.02),

                                  ///
                                  CustomTextFormField(
                                    validator: (String value) => value.isEmpty
                                        ? 'Password is Empty'
                                        : value.length + 1 <= 6
                                            ? 'Password is less than 6 items'
                                            : null,
                                    onSaved: (value) => password = value,
                                    hint: 'Password',
                                    label: 'Password',
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: cubit.isPassword,
                                    icon: IconButton(
                                      icon: Icon(
                                        cubit.suffix,
                                        color: Colors.black45,
                                      ),
                                      onPressed: () =>
                                          cubit.changePassVisibility(),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),

                                  ///
                                  CustomTextFormField(
                                    onSaved: (value) => confirmPassword = value,
                                    validator: (String value) => value.isEmpty
                                        ? 'Confirm Password is Empty'
                                        : confirmPassword != password
                                            ? 'Confirm Password not equal password'
                                            : null,
                                    hint: 'Confirm Password',
                                    label: 'Confirm Password',
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: cubit.isPassword,
                                    icon: IconButton(
                                      icon: Icon(
                                        cubit.suffix,
                                        color: Colors.black45,
                                      ),
                                      onPressed: () =>
                                          cubit.changePassVisibility(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          CustomButton(
                            onPressed: () async {
                              _globalKey.currentState.save();

                              if (_globalKey.currentState.validate()) {
                                _globalKey.currentState.save();

                                print(companyName);
                                print(email);
                                print(password);
                                MagicRouter.navigateTo(EmployerCompanyData(
                                  name: companyName,
                                  email: email,
                                  password: password,
                                  confirmPassword: confirmPassword,
                                ));
                              }
                            },
                            text: 'Next',
                            backgroundColor: kSecondColor,
                            width: width * 0.5,
                          ),
                          SizedBox(height: height * 0.02),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -40,
                    top: -40,
                    child: CircleAvatar(
                      backgroundColor: kSecondColor.withOpacity(0.5),
                      radius: 70,
                    ),
                  ),
                  Positioned(
                      left: 20,
                      top: 30,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      )),
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
            ),
          ),
        );
      },
    );
  }
}
