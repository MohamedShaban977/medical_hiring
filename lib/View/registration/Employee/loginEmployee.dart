import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/View/employee_Screens/nav_bar_employee/nav_bar_employee_view.dart';
import 'package:medical_hiring/View/registration/cubit/cubit.dart';
import 'package:medical_hiring/View/registration/cubit/states.dart';
import 'package:medical_hiring/core/router/router.dart';

import 'package:medical_hiring/widget/custom_button.dart';
import 'package:medical_hiring/widget/custom_text_form_field.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../who_are_you_register.dart';

class LoginEmployee extends StatefulWidget {
  static String routeId = 'LoginEmployee';

  @override
  _LoginEmployeeState createState() => _LoginEmployeeState();
}

class _LoginEmployeeState extends State<LoginEmployee> {
  String email, password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppRegisterCubit, AppRegisterStates>(
      listener: (context, state) {
        if (state is EmployeeLoginSuccessState) {
          if (state.employeeLoginModel.status) {
            print(state.employeeLoginModel.message);
            MagicRouter.navigateAndFinish(NavBarEmployee());
          } else {
            print(state.employeeLoginModel.message);
            showToast(
                message: state.employeeLoginModel.message,
                backgroundColor: kSecondColor);
          }
        } else if (state is EmployeeLoginErrorState) {
          showToast(message: state.error, backgroundColor: kSecondColor);
        }
      },
      builder: (context, state) {
        AppRegisterCubit cubit = AppRegisterCubit.get(context);

        return Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: state is EmployeeLoginLoadingState,
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
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: height * 0.05),
                              Image.asset(
                                'assets/images/registration/loginEmployee.png',
                                height: height * 0.2,
                              ),
                              SizedBox(height: height * 0.03),
                              Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: const Color(0xfffcfcfc),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 20),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: (String value) => value
                                                  .isEmpty
                                              ? 'Email is Empty'
                                              : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                      .hasMatch(value)
                                                  ? null
                                                  : 'Check your email',
                                          onSaved: (value) {
                                            email = value;
                                          },
                                          hint: 'Email',
                                          label: 'Email'),
                                      SizedBox(height: height * 0.03),
                                      CustomTextFormField(
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        validator: (String value) => value
                                                .isEmpty
                                            ? 'Password is Empty'
                                            : value.length + 1 <= 6
                                                ? 'Password is less than 6 items'
                                                : null,
                                        onSaved: (value) {
                                          password = value;
                                        },
                                        hint: 'Password',
                                        label: 'Password',
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
                              CustomButton(
                                  width: width * 0.6,
                                  onPressed: () async {
                                    _formKey.currentState.save();
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();

                                      await cubit.employeeLogin(
                                        email: email,
                                        password: password,
                                      );
                                    }
                                  },
                                  text: 'CONTINUE',
                                  backgroundColor: kSecondColor),
                              SizedBox(height: height * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Don’t have an account?',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: kWhiteColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, WhoAreYouRegister.routeId);
                                    },
                                    child: Text(
                                      'Create a new account',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: height * 0.01),
                            ],
                          ),
                        ),
                      ],
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
                  Positioned(
                    right: -40,
                    top: -40,
                    child: CircleAvatar(
                      backgroundColor: Colors.white12,
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
            ),
          ),
        );
      },
    );
  }
}
