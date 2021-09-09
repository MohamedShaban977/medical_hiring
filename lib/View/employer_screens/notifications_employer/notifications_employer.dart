import 'package:flutter/material.dart';

import '../../../constants.dart';


class NotificationsEmployerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                children: List.generate(
                    10,
                        (index) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: Container(
                            height: 100,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'iOS developer',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      'cairo , Egypt',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'You have been rejected',
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ],
                                ),
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn-Rme-Dwjyl29g2RtYjlwb2j_-q6lwbyXEw&usqp=CAU'),
                                  radius: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        Divider(
                          height: 10,
                          color: Colors.black87,
                          thickness: 0.5,
                        )
                      ],
                    )),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amr Tohamy',
                        style: TextStyle(fontSize: 20, color: kMainColor),
                      ),
                      Text(
                        'Please fill your profile',
                        style: TextStyle(fontSize: 20, color: kMainColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
