import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medical_hiring/provider/edit_profile_provider.dart';

import '../../../constants.dart';
import '../../../widget/custom_text_form_field.dart';

class EmployerProfile extends StatelessWidget {
  static String routeId = 'EmployeeProfile';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: kWhiteColor, fontSize: 20),
        ),
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.32,
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
                    left: 0,
                    right: 0,
                    top: -40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
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
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://as1.ftcdn.net/v2/jpg/01/21/42/44/1000_F_121424481_OwtlvRwv95pemyGSKaKHRYQdPyZITpZh.jpg',
                                fit: BoxFit.cover,
                                height: height * 0.25,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 20,
                              child: CircleAvatar(
                                backgroundColor: kSecondColor,
                                radius: 20,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Stack(
            //   children: [
            //     Container(
            //       height: height * 1.2,
            //       child: Column(
            //         children: [
            //           Container(
            //             width: width,
            //             height: height * 0.23,
            //             decoration: BoxDecoration(
            //                 color: kMainColor,
            //                 borderRadius: BorderRadius.only(
            //                   bottomRight: Radius.circular(30),
            //                   bottomLeft: Radius.circular(30),
            //                 )),
            //             // child:
            //           ),
            //         ],
            //       ),
            //     ),
            //     Positioned(
            //       left: 0,
            //       right: 0,
            //       // bottom: 0,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           SizedBox(height: height * 0.05),
            //           Text(
            //             'Company Information',
            //             style: TextStyle(
            //                 fontSize: 25,
            //                 fontWeight: FontWeight.w700,
            //                 color: Colors.white),
            //           ),
            //           SizedBox(height: height * 0.03),
            //           Stack(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(100),
            //                 child: Image.network(
            //                   'https://as1.ftcdn.net/v2/jpg/01/21/42/44/1000_F_121424481_OwtlvRwv95pemyGSKaKHRYQdPyZITpZh.jpg',
            //                   fit: BoxFit.cover,
            //                   height: height * 0.25,
            //                 ),
            //               ),
            //               Positioned(
            //                 right: 10,
            //                 top: 20,
            //                 child: CircleAvatar(
            //                   backgroundColor: kSecondColor,
            //                   radius: 20,
            //                   child: Icon(
            //                     Icons.add,
            //                     color: Colors.white,
            //                     size: 30,
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

            ///
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  /// Company name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Company name',
                          style: TextStyle(
                            color: kMainColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Provider.of<EditProfileProvider>(context).isEdit
                          ? Expanded(
                              child: TextFieldSample(
                                initialValue: 'Algorithm',
                                colorBorder: Colors.black54,
                                onSaved: (value) {},
                                hint: 'Company name',
                                validator: (value) {},
                                obscureText: false,
                                keyboardType: TextInputType.multiline,
                              ),
                            )
                          : Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Algorithm',
                                    style: TextStyle(
                                      color: kMainColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  SizedBox(height: height * 0.03),

                  /// Country
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
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Egypt',
                            style: TextStyle(
                              color: kMainColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  SizedBox(height: height * 0.03),

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
                        width: 60,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Cairo',
                            style: TextStyle(
                              color: kMainColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  SizedBox(height: height * 0.03),

                  /// Business
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
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              children: [
                                Text(
                                  'Software',
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),

                  SizedBox(height: height * 0.03),

                  /// Website
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Website',
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'www.algo.com',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  SizedBox(height: height * 0.03),

                  /// button Login & edit
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.07,
                        width: width * 0.4,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: kSecondColor,
                        ),
                      ),
                      Container(
                        height: height * 0.07,
                        width: width * 0.4,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: RaisedButton(
                          onPressed: () {
                            Provider.of<EditProfileProvider>(context,
                                    listen: false)
                                .changeEdit();
                            // Navigator.pushNamed(
                            //     context, EmployerCompanyData.routeId);
                          },
                          child: Text(
                            'Edit',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: kSecondColor,
                        ),
                      ),
// Container(
//   height: height * 0.07,
//   clipBehavior: Clip.antiAlias,
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10)),
//   child: RaisedButton(
//     onPressed: () {},
//     child: Text(
//       'Next',
//       style: TextStyle(
//           color: Colors.white, fontSize: 20),
//     ),
//     color: kSecondColor,
//   ),
// ),
                    ],
                  ),
                ],
              ),
            ),

            ///
          ],
        ),
      ),
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
                  // getImage(ImageSource.gallery);
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
                  // getImage(ImageSource.camera);
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
}

///
// Padding(
// padding: const EdgeInsets.all(20),
// child: Column(
// children: [
// /// Company name
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Company name',
// style: TextStyle(
// color: kMainColor,
// fontWeight: FontWeight.w600,
// fontSize: 18,
// ),
// ),
// Container(
// height: 30,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)),
// child: Center(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Text(
// 'Algorithm',
// style: TextStyle(
// color: kMainColor,
// fontSize: 16,
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: height * 0.01),
// Divider(
// height: 10,
// color: Colors.black,
// ),
// SizedBox(height: height * 0.03),
//
// /// Country
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Country',
// style: TextStyle(
// color: kMainColor,
// fontWeight: FontWeight.w600,
// fontSize: 18,
// ),
// ),
// Container(
// width: 60,
// height: 30,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)),
// child: Center(
// child: Text(
// 'Egypt',
// style: TextStyle(
// color: kMainColor,
// fontSize: 16,
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: height * 0.01),
// Divider(
// height: 10,
// color: Colors.black,
// ),
// SizedBox(height: height * 0.03),
//
// /// City
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'City',
// style: TextStyle(
// color: kMainColor,
// fontWeight: FontWeight.w600,
// fontSize: 18,
// ),
// ),
// Container(
// width: 60,
// height: 30,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)),
// child: Center(
// child: Text(
// 'Cairo',
// style: TextStyle(
// color: kMainColor,
// fontSize: 16,
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: height * 0.01),
// Divider(
// height: 10,
// color: Colors.black,
// ),
// SizedBox(height: height * 0.03),
//
// /// Business
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Business',
// style: TextStyle(
// color: kMainColor,
// fontWeight: FontWeight.w600,
// fontSize: 18,
// ),
// ),
// Container(
// height: 30,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Center(
// child: Row(
// children: [
// Text(
// 'Software',
// style: TextStyle(
// color: kMainColor,
// fontSize: 16,
// ),
// ),
// Icon(Icons.keyboard_arrow_down),
// ],
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: height * 0.01),
// Divider(
// height: 10,
// color: Colors.black,
// ),
//
// SizedBox(height: height * 0.03),
//
// /// Website
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Website',
// style: TextStyle(
// color: kMainColor,
// fontWeight: FontWeight.w600,
// fontSize: 18,
// ),
// ),
// Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20)),
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Center(
// child: Text(
// 'www.algo.com',
// style: TextStyle(
// color: kMainColor,
// fontSize: 16,
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: height * 0.01),
// Divider(
// height: 10,
// color: Colors.black,
// ),
// SizedBox(height: height * 0.03),

/// button Login & edit
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: height * 0.07,
// width: width * 0.4,
// clipBehavior: Clip.antiAlias,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10)),
// child: RaisedButton(
// onPressed: () {},
// child: Text(
// 'Logout',
// style: TextStyle(
// color: Colors.white, fontSize: 20),
// ),
// color: kSecondColor,
// ),
// ),
// Container(
// height: height * 0.07,
// width: width * 0.4,
// clipBehavior: Clip.antiAlias,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10)),
// child: RaisedButton(
// onPressed: () {
// Navigator.pushNamed(
// context, EmployerCompanyData.routeId);
// },
// child: Text(
// 'Edit',
// style: TextStyle(
// color: Colors.white, fontSize: 20),
// ),
// color: kSecondColor,
// ),
// ),
// // Container(
// //   height: height * 0.07,
// //   clipBehavior: Clip.antiAlias,
// //   decoration: BoxDecoration(
// //       borderRadius: BorderRadius.circular(10)),
// //   child: RaisedButton(
// //     onPressed: () {},
// //     child: Text(
// //       'Next',
// //       style: TextStyle(
// //           color: Colors.white, fontSize: 20),
// //     ),
// //     color: kSecondColor,
// //   ),
// // ),
// ],
// ),
// ],
// ),
// ),
///
