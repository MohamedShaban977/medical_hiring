import 'package:flutter/material.dart';

import 'chat_view.dart';

class MessagesEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, inbox) {
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, ChatEmployeeView.routeId),
              child: Card(
                color: Colors.white,
                child: Container(
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn-Rme-Dwjyl29g2RtYjlwb2j_-q6lwbyXEw&usqp=CAU',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Johan Dee',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'San Francisco, CA',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
