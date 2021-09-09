import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/widget/custom_app_bar.dart';

class ChatEmployeeView extends StatelessWidget {
  static String routeId = 'ChatEmployeeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CustomAppBar(
          titleAppbar: 'JOHN DOE',
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back)),
        ),
      ),
      body: WillPopScope(
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              itemCount: 12,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    /// resved user
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: kSecondColor,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 40),

                    /// Send User
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
                                style: TextStyle(fontSize: 18),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: kMainColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            height: 90,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,

                        spreadRadius: 2.0,

                        offset: Offset(1.0, 5.0),

                        // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            child: TextField(
                              // expands: true,
                              maxLines: 5,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                disabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                errorBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    )),
                                hintText: 'Say something..',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: kMainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: <Widget>[
          //
          //
          //     ///
          //     // ListView(
          //     //   children: [
          //     //     Padding(
          //     //       padding: const EdgeInsets.all(15),
          //     //       child: Column(
          //     //         children: [
          //     //           /// resved user
          //     //           Row(
          //     //             children: [
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               Expanded(
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Expanded(
          //     //                     child: Padding(
          //     //                       padding: const EdgeInsets.all(15),
          //     //                       child: Text(
          //     //                         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                         style: TextStyle(fontSize: 18),
          //     //                         overflow: TextOverflow.fade,
          //     //                       ),
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               )
          //     //             ],
          //     //           ),
          //     //           SizedBox(height: 40),
          //     //
          //     //           /// Send User
          //     //           Row(
          //     //             children: [
          //     //               Expanded(
          //     //                 flex: 1,
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Padding(
          //     //                     padding: const EdgeInsets.all(15),
          //     //                     child: Text(
          //     //                       'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                       style: TextStyle(fontSize: 18),
          //     //                       overflow: TextOverflow.visible,
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //             ],
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.all(15),
          //     //       child: Column(
          //     //         children: [
          //     //           /// resved user
          //     //           Row(
          //     //             children: [
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               Expanded(
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Expanded(
          //     //                     child: Padding(
          //     //                       padding: const EdgeInsets.all(15),
          //     //                       child: Text(
          //     //                         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                         style: TextStyle(fontSize: 18),
          //     //                         overflow: TextOverflow.fade,
          //     //                       ),
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               )
          //     //             ],
          //     //           ),
          //     //           SizedBox(height: 40),
          //     //
          //     //           /// Send User
          //     //           Row(
          //     //             children: [
          //     //               Expanded(
          //     //                 flex: 1,
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Padding(
          //     //                     padding: const EdgeInsets.all(15),
          //     //                     child: Text(
          //     //                       'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                       style: TextStyle(fontSize: 18),
          //     //                       overflow: TextOverflow.visible,
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //             ],
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.all(15),
          //     //       child: Column(
          //     //         children: [
          //     //           /// resved user
          //     //           Row(
          //     //             children: [
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               Expanded(
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Expanded(
          //     //                     child: Padding(
          //     //                       padding: const EdgeInsets.all(15),
          //     //                       child: Text(
          //     //                         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                         style: TextStyle(fontSize: 18),
          //     //                         overflow: TextOverflow.fade,
          //     //                       ),
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               )
          //     //             ],
          //     //           ),
          //     //           SizedBox(height: 40),
          //     //
          //     //           /// Send User
          //     //           Row(
          //     //             children: [
          //     //               Expanded(
          //     //                 flex: 1,
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Padding(
          //     //                     padding: const EdgeInsets.all(15),
          //     //                     child: Text(
          //     //                       'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                       style: TextStyle(fontSize: 18),
          //     //                       overflow: TextOverflow.visible,
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //             ],
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.all(15),
          //     //       child: Column(
          //     //         children: [
          //     //           /// resved user
          //     //           Row(
          //     //             children: [
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               Expanded(
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Expanded(
          //     //                     child: Padding(
          //     //                       padding: const EdgeInsets.all(15),
          //     //                       child: Text(
          //     //                         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                         style: TextStyle(fontSize: 18),
          //     //                         overflow: TextOverflow.fade,
          //     //                       ),
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               )
          //     //             ],
          //     //           ),
          //     //           SizedBox(height: 40),
          //     //
          //     //           /// Send User
          //     //           Row(
          //     //             children: [
          //     //               Expanded(
          //     //                 flex: 1,
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Padding(
          //     //                     padding: const EdgeInsets.all(15),
          //     //                     child: Text(
          //     //                       'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                       style: TextStyle(fontSize: 18),
          //     //                       overflow: TextOverflow.visible,
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //             ],
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     Padding(
          //     //       padding: const EdgeInsets.all(15),
          //     //       child: Column(
          //     //         children: [
          //     //           /// resved user
          //     //           Row(
          //     //             children: [
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               Expanded(
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Expanded(
          //     //                     child: Padding(
          //     //                       padding: const EdgeInsets.all(15),
          //     //                       child: Text(
          //     //                         'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                         style: TextStyle(fontSize: 18),
          //     //                         overflow: TextOverflow.fade,
          //     //                       ),
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               )
          //     //             ],
          //     //           ),
          //     //           SizedBox(height: 40),
          //     //
          //     //           /// Send User
          //     //           Row(
          //     //             children: [
          //     //               Expanded(
          //     //                 flex: 1,
          //     //                 child: Container(
          //     //                   decoration: BoxDecoration(
          //     //                       borderRadius: BorderRadius.circular(20),
          //     //                       color: Colors.white),
          //     //                   child: Padding(
          //     //                     padding: const EdgeInsets.all(15),
          //     //                     child: Text(
          //     //                       'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.',
          //     //                       style: TextStyle(fontSize: 18),
          //     //                       overflow: TextOverflow.visible,
          //     //                     ),
          //     //                   ),
          //     //                 ),
          //     //               ),
          //     //               SizedBox(
          //     //                 width: 20,
          //     //               ),
          //     //               CircleAvatar(
          //     //                 radius: 30,
          //     //               ),
          //     //             ],
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //   ],
          //     // ),
          //     ///
          //     // buildInput(),
          //   ],
          // ),
        ]),
      ),
    );
  }
}
