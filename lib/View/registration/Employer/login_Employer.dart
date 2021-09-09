import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medical_hiring/View/registration/cubit/states.dart';
import 'package:medical_hiring/View/registration/cubit/cubit.dart';

import 'package:medical_hiring/core/router/router.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../../../constants.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_form_field.dart';
import '../../employer_screens/nav_bar_employer/nav_bar_fab_employer.dart';

import '../who_are_you_register.dart';

class LoginEmployer extends StatefulWidget {
  static String routeId = 'LoginEmployer';

  @override
  _LoginEmployerState createState() => _LoginEmployerState();
}

class _LoginEmployerState extends State<LoginEmployer> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state) {
      if (state is EmployerLoginSuccessState) {
        if (state.employerLoginModel.status) {
          print(state.employerLoginModel.message);
          MagicRouter.navigateAndFinish( NavBarFABEmployer());
        }
        else {
          print(state.employerLoginModel.message);
          showToast(
              message: state.employerLoginModel.message,
              backgroundColor: kSecondColor);
        }
      }else if(state is EmployerLoginErrorState) {

      showToast(
          message: state.error,
          backgroundColor: kSecondColor);}
    }, builder: (context, state) {
      AppRegisterCubit cubit = AppRegisterCubit.get(context);

      return Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: state is EmployerLoginLoadingState,
          color: kWhiteColor,
          opacity: 0.5,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: height,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(40),
                            bottomLeft: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height * 0.05),
                            Image.asset(
                              'assets/images/registration/EmployerLogin.png',
                              height: height * 0.2,
                            ),
                            SizedBox(height: height * 0.03),
                            Text(
                              'Login',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20, left: 20),
                              child: Form(
                                key: _globalKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: height * 0.03),
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
                                    SizedBox(height: height * 0.03),
                                    CustomTextFormField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validator: (String value) => value.isEmpty
                                          ? 'Password is Empty'
                                          : value.length + 1 <= 6
                                              ? 'Password is less than 6 items'
                                              : null,
                                      label: 'Password',
                                      hint: 'Password',
                                      onSaved: (value) {
                                        password = value;
                                      },
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
                            SizedBox(height: height * 0.05),
                            ConditionalBuilder(
                              condition: state is! EmployerLoginLoadingState,
                              builder: (context) => CustomButton(
                                  width: width * 0.5,
                                  text: 'CONTINUE',
                                  backgroundColor: kSecondColor,
                                  onPressed: () async {
                                    _globalKey.currentState.save();
                                    if (_globalKey.currentState.validate()) {
                                      _globalKey.currentState.save();
                                      print(email);
                                      print(password);

                                      cubit.employerLogin(
                                        email: email,
                                        password: password,
                                      );
                                      // MagicRouter.navigateAndFinish(NavBarFABEmployer());
                                    }
                                  }),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(height: height * 0.02),

                            /// create a new account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kWhiteColor.withOpacity(0.8),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                SizedBox(width: width * 0.04),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, WhoAreYouRegister.routeId);
                                  },
                                  child: Text(
                                    'Create a new account',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: const Color(0xffffffff),
                                      fontWeight: FontWeight.w500,
                                      height: 1.2,
                                    ),
                                    textHeightBehavior: TextHeightBehavior(
                                        applyHeightToFirstAscent: false),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(height: height * 0.02),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -40,
                  top: -40,
                  child: CircleAvatar(
                    backgroundColor: Colors.white12,
                    radius: 60,
                  ),
                ),
                Positioned(
                  left: -40,
                  bottom: -40,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff45C5BD).withOpacity(0.5),
                    radius: 55,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 30,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
