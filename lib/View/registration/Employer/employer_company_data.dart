import 'dart:io';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_hiring/View/employer_screens/nav_bar_employer/nav_bar_fab_employer.dart';
import 'package:medical_hiring/View/registration/cubit/cubit.dart';
import 'package:medical_hiring/View/registration/cubit/states.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/core/router/router.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EmployerCompanyData extends StatefulWidget {
  static String routeId = 'EmployerCompanyData';

  final String name, email, password, confirmPassword;
  const EmployerCompanyData({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
  });

  @override
  _EmployerCompanyDataState createState() => _EmployerCompanyDataState();
}

class _EmployerCompanyDataState extends State<EmployerCompanyData> {
  DateTime selectedDate = DateTime.now();

  TextEditingController websiteTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => AppRegisterCubit()
        ..getCountry()
        ..getBusiness()
        ..getEstablishment(),
      child: BlocConsumer<AppRegisterCubit, AppRegisterStates>(
        listener: (context, state) {
          if (state is EmployerRegisterSuccessState) {
            if (state.employerRegisterModel.status) {
              print(state.employerRegisterModel.message);
              print(state.employerRegisterModel.token);
              Fluttertoast.showToast(
                msg: state.employerRegisterModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: kSecondColor,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              MagicRouter.navigateAndFinish(NavBarFABEmployer());
            } else {
              print(state.employerRegisterModel.message);

              Fluttertoast.showToast(
                msg: state.employerRegisterModel.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: kSecondColor,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          }
        },
        builder: (context, state) {
          AppRegisterCubit cubit = AppRegisterCubit.get(context);

          return Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: state is EmployerRegisterLoadingState,
              color: kMainColor,
              opacity: 0.5,
              progressIndicator: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kSecondColor)),
              child: SingleChildScrollView(
                physics: PageScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.35,
                      child: Stack(
                        children: [
                          Container(
                            height: height * 0.25,
                            decoration: BoxDecoration(
                                color: kMainColor,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(50))),
                          ),
                          Positioned(
                            right: 0,
                            left: 0,
                            top: 0,
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.05),
                                Text(
                                  'Company Information',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                SizedBox(height: height * 0.03),
                                Stack(
                                  children: [
                                    Container(
                                      width: width * 0.43,
                                      height: height * 0.23,
                                      decoration: BoxDecoration(
                                          color: kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          boxShadow: [
                                            BoxShadow(
                                              color: kMainColor,
                                              spreadRadius: 0.5,
                                              offset: Offset(0, 0),
                                              blurRadius: 20,
                                            )
                                          ]),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: cubit.logoFile != null
                                            ? Image.file(
                                                cubit.logoFile,
                                                width: width * 0.4,
                                                height: height * 0.25,
                                                fit: BoxFit.cover,
                                              )
                                            : Icon(
                                                Icons.person,
                                                size: 150,
                                                color: Colors.black54,
                                              ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 20,
                                      child: InkWell(
                                        onTap: () async {
                                          alertDialogImagePicker(context);
                                          // cubit.getFileCV();

                                        },
                                        child: CircleAvatar(
                                          backgroundColor: kSecondColor,
                                          radius: 20,
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: height * 0.04,
                              left: 10,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: kWhiteColor,
                                  size: 30,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          /// country
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: DropdownButton(
                                    // isExpanded: true,
                                    dropdownColor: Colors.white,
                                    hint: Text('Country'),

                                    onChanged: (value) async {
                                      cubit.onChangeCountry(value);
                                    },
                                    value: cubit.selectedCountry,
                                    items: cubit.countryNameList
                                        .map((state) => DropdownMenuItem(
                                              child: Text(state),
                                              value: state,
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 5, color: Colors.black45),
                          SizedBox(height: height * 0.02),

                          /// City
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'City',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: DropdownButton(
                                    // isExpanded: true,
                                    dropdownColor: Colors.white,
                                    hint: Text('City'),

                                    onChanged: (value) {
                                      cubit.onChangeCity(value);
                                    },
                                    value: cubit.selectedCity,
                                    items: cubit.selectedCountry != null
                                        ? cubit.cityNameList
                                            .map(
                                              (city) => DropdownMenuItem(
                                                child: Text(city),
                                                value: city,
                                              ),
                                            )
                                            .toList()
                                        : [],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 10, color: Colors.black45),
                          SizedBox(height: height * 0.02),

                          ///Business
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Business',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: DropdownButton(
                                    // isExpanded: true,
                                    dropdownColor: Colors.white,
                                    hint: Text('Business'),

                                    // itemHeight: 300,

                                    items: cubit.listBusinessName
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      cubit.onChangeBusiness(value);
                                    },
                                    value: cubit.selectBusinessName,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 5, color: Colors.black45),
                          SizedBox(height: height * 0.02),

                          /// Established at
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Established at',
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    showDialogPickerYear(context);
                                  },
                                  child: Container(
                                    height: height * 0.05,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${selectedDate.year}  ',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: kMainColor,
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(height: 5, color: Colors.black45),
                          SizedBox(height: height * 0.02),

                          ///Establishment type
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Establishment Type',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                clipBehavior: Clip.antiAlias,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: DropdownButton(
                                    // isExpanded: true,
                                    dropdownColor: Colors.white,
                                    hint: Text('Establishment Type'),

                                    // itemHeight: 300,

                                    items: cubit.listEstablishmentName
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      cubit.onChangeEstablishment(value);
                                    },
                                    value: cubit.selectEstablishmentName,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          Divider(height: 5, color: Colors.black54),
                          SizedBox(height: height * 0.02),

                          /// Website
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Website',
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: height * 0.05,
                                  child: TextFormField(
                                    cursorColor: Colors.black45,
                                    cursorHeight: 25,
                                    controller: websiteTextController,
                                    decoration: InputDecoration(
                                      // helperMaxLines: 5,
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Website',
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintStyle:
                                          Theme.of(context).textTheme.headline2,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      ///
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      ///
                                      disabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      ///

                                      ///error border
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black54),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          Divider(height: 5, color: Colors.black54),
                          SizedBox(height: height * 0.02),

                          ConditionalBuilder(
                            condition: state is! EmployerRegisterLoadingState,
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                            builder: (context) => CustomButton(
                              onPressed: () async {
                                print(widget.email);
                                print(widget.password);
                                print(widget.confirmPassword);
                                print(widget.name);

                                print(selectedDate);
                                print(websiteTextController.text);

                                if (cubit.logoFile != null) {
                                  await cubit.employerRegister(
                                    email: widget.email,
                                    password: widget.password,
                                    password_confirmation:
                                        widget.confirmPassword,
                                    company_name: widget.name,
                                    country: cubit.selectedCountry,
                                    city: cubit.selectedCity,
                                    business: cubit.selectBusinessId,
                                    establishment_type_id:
                                        cubit.selectEstablishmentId,
                                    established_at: '${selectedDate.year}',
                                    website: websiteTextController.text,
                                  );
                                } else {
                                  print('select logo');
                                }
                              },
                              text: 'Finish',
                              backgroundColor: kSecondColor,
                              width: width * 0.5,
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
        },
      ),
    );
  }

  void showDialogPickerYear(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container(
            // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              selectedDate: selectedDate,
              onChanged: (DateTime dateTime) {
                setState(() {
                  selectedDate = dateTime;
                });
                print(selectedDate.year);
                Navigator.pop(context);
              },
              // currentDate: ,
            ),
          ),
        );
      },
    );
  }

  void alertDialogImagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (con) {
        return AlertDialog(
          title: Text('Choose Picture from : '),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  AppRegisterCubit.get(context).getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: kSecondColor,
                  child: Icon(
                    Icons.image_rounded,
                    color: kWhiteColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  AppRegisterCubit.get(context).getImage(ImageSource.camera);

                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: kSecondColor,
                  child: Icon(
                    Icons.camera_alt,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateToPage({@required String title, @required Widget child}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Center(child: child),
        ),
      ),
    );
  }
}
