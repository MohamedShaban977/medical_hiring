import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_hiring/View/employee_Screens/nav_bar_employee/nav_bar_employee_view.dart';
import 'package:medical_hiring/provider/model_hud.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:medical_hiring/widget/custom_text_form_field.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class EmployeeJobDataEntry extends StatefulWidget {
  static String routeId = 'EmployeeJobDataEntry';

  @override
  _EmployeeJobDataEntryState createState() => _EmployeeJobDataEntryState();
}

class _EmployeeJobDataEntryState extends State<EmployeeJobDataEntry> {
  bool checkBox = false;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: kMainColor,
        elevation: 0,
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: height,
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.14,
                      decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          )),
                      // child:
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// image and name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/Path.png',
                              fit: BoxFit.cover,
                              height: height * 0.2,
                            ),
                            Positioned(
                                top: 10,
                                left: 10,
                                child: CircleAvatar(
                                  backgroundColor: kSecondColor,
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: kWhiteColor,
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(width: width * 0.03),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                // height: 1.7333333333333334,
                              ),
                              // textHeightBehavior: TextHeightBehavior(
                              //     applyHeightToFirstAscent: false),
                              // textAlign: TextAlign.left,
                            ),
                            Text(
                              'San Francisco, CA',
                              style: TextStyle(
                                // fontSize: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Job Title',
                            style: TextStyle(
                              fontSize: 18,
                              color: kSecondColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: height * 0.03),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(

                                  child: Text(
                                    'Current Title',
                                    style: TextStyle(
                                      color: kMainColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                    flex: 2,
                                    child: TextFieldSample(
                                      validator: (value) {},
                                      colorBorder: Colors.black54,
                                      hint: '',
                                      onSaved: (value) {},
                                      initialValue: '',
                                      obscureText: false,
                                      keyboardType: TextInputType.multiline,
                                    ))

                                // DropdownButton(
                                //   items: ['fgfdg', 'dsfdsf']
                                //       .map(
                                //         (item) => DropdownMenuItem(
                                //           value: item,
                                //           child: Text(item),
                                //         ),
                                //       )
                                //       .toList(),
                                // ),
                              ]),
                          SizedBox(height: height * 0.01),

                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Filed',
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Text(
                                      'Nursing',
                                      style: TextStyle(
                                        color: kMainColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kMainColor,
                                    )
                                  ],
                                )
                                // DropdownButton(
                                //   items: ['fgfdg', 'dsfdsf']
                                //       .map(
                                //         (item) => DropdownMenuItem(
                                //           value: item,
                                //           child: Text(item),
                                //         ),
                                //       )
                                //       .toList(),
                                // ),
                              ]),
                          SizedBox(height: height * 0.01),

                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Spicalest',
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                  ),
                                ),

                                Row(
                                  children: [
                                    Text(
                                      'Chief Nurse',
                                      style: TextStyle(
                                        color: kMainColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: kMainColor,
                                    )
                                  ],
                                )
                                // DropdownButton(
                                //   items: ['fgfdg', 'dsfdsf']
                                //       .map(
                                //         (item) => DropdownMenuItem(
                                //           value: item,
                                //           child: Text(item),
                                //         ),
                                //       )
                                //       .toList(),
                                // ),
                              ]),
                          SizedBox(height: height * 0.01),

                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),

                          ///  EDUCATION
                          Text(
                            'EDUCATION',
                            style: TextStyle(
                              fontSize: 18,
                              color: kSecondColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          ///
                          SizedBox(height: height * 0.03),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: kSecondColor),
                                child: Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      checkColor: Colors.white,
                                      activeColor: kSecondColor,
                                      hoverColor: Colors.white,
                                      value: checkBox,
                                      onChanged: (value) {
                                        setState(() {
                                          checkBox = value;
                                        });
                                      }),
                                ),
                              ),
                              CustomTextFormField(
                                width: width * 0.6,
                                onSaved: (value) {},
                                hint: 'Faculty of nursing',
                                label: 'Bachelor',
                                colorLabel: kMainColor,
                              ),
                              InkWell(
                                onTap: () {
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
                                            firstDate: DateTime(
                                                DateTime.now().year - 100, 1),
                                            lastDate: DateTime(
                                                DateTime.now().year + 100, 1),
                                            initialDate: DateTime.now(),
                                            // save the selected date to _selectedDate DateTime variable.
                                            // It's used to set the previous selected date when
                                            // re-showing the dialog.
                                            selectedDate: selectedDate,
                                            onChanged: (DateTime dateTime) {
                                              setState(() {
                                                selectedDate = dateTime;
                                              });
                                              // close the dialog when year is selected.
                                              Navigator.pop(context);

                                              // Do something with the dateTime selected.
                                              // Remember that you need to use dateTime.year to get the year
                                            },
                                            // currentDate: ,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Year',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: kMainColor,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          selectedDate.year.toString(),
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: kMainColor,
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),

                          ///
                          SizedBox(height: height * 0.03),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: kSecondColor),
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        checkColor: Colors.white,
                                        activeColor: kSecondColor,
                                        hoverColor: Colors.white,
                                        value: checkBox,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBox = value;
                                          });
                                        }),
                                  ),
                                ),
                                CustomTextFormField(
                                  width: width * 0.6,
                                  onSaved: (value) {},
                                  hint: 'Nursing',
                                  label: 'Excellent',
                                  colorLabel: kMainColor,
                                ),
                                InkWell(
                                  onTap: () {
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
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100, 1),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 100, 1),
                                              initialDate: DateTime.now(),
                                              // save the selected date to _selectedDate DateTime variable.
                                              // It's used to set the previous selected date when
                                              // re-showing the dialog.
                                              selectedDate: selectedDate,
                                              onChanged: (DateTime dateTime) {
                                                setState(() {
                                                  selectedDate = dateTime;
                                                });
                                                // close the dialog when year is selected.
                                                Navigator.pop(context);

                                                // Do something with the dateTime selected.
                                                // Remember that you need to use dateTime.year to get the year
                                              },
                                              // currentDate: ,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Year',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: kMainColor,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            selectedDate.year.toString(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: kMainColor,
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),

                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),

                          ///
                          SizedBox(height: height * 0.03),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: kSecondColor),
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        checkColor: Colors.white,
                                        activeColor: kSecondColor,
                                        hoverColor: Colors.white,
                                        value: checkBox,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBox = value;
                                          });
                                        }),
                                  ),
                                ),
                                CustomTextFormField(
                                  width: width * 0.6,
                                  onSaved: (value) {},
                                  hint: 'Chief Nurse',
                                  label: 'M.A',
                                  colorLabel: kMainColor,
                                ),
                                InkWell(
                                  onTap: () {
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
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100, 1),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 100, 1),
                                              initialDate: DateTime.now(),
                                              // save the selected date to _selectedDate DateTime variable.
                                              // It's used to set the previous selected date when
                                              // re-showing the dialog.
                                              selectedDate: selectedDate,
                                              onChanged: (DateTime dateTime) {
                                                setState(() {
                                                  selectedDate = dateTime;
                                                });
                                                // close the dialog when year is selected.
                                                Navigator.pop(context);

                                                // Do something with the dateTime selected.
                                                // Remember that you need to use dateTime.year to get the year
                                              },
                                              // currentDate: ,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Year',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: kMainColor,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            selectedDate.year.toString(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: kMainColor,
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),

                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),

                          ///
                          SizedBox(height: height * 0.03),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: kSecondColor),
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        checkColor: Colors.white,
                                        activeColor: kSecondColor,
                                        hoverColor: Colors.white,
                                        value: checkBox,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBox = value;
                                          });
                                        }),
                                  ),
                                ),
                                CustomTextFormField(
                                  width: width * 0.6,
                                  onSaved: (value) {},
                                  hint: 'British',
                                  label: 'fellowship',
                                  colorLabel: kMainColor,
                                ),
                                InkWell(
                                  onTap: () {
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
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100, 1),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 100, 1),
                                              initialDate: DateTime.now(),
                                              // save the selected date to _selectedDate DateTime variable.
                                              // It's used to set the previous selected date when
                                              // re-showing the dialog.
                                              selectedDate: selectedDate,
                                              onChanged: (DateTime dateTime) {
                                                setState(() {
                                                  selectedDate = dateTime;
                                                });
                                                // close the dialog when year is selected.
                                                Navigator.pop(context);

                                                // Do something with the dateTime selected.
                                                // Remember that you need to use dateTime.year to get the year
                                              },
                                              // currentDate: ,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Year',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: kMainColor,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            selectedDate.year.toString(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: kMainColor,
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),

                          ///
                          SizedBox(height: height * 0.03),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor: kSecondColor),
                                  child: Transform.scale(
                                    scale: 1.2,
                                    child: Checkbox(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        checkColor: Colors.white,
                                        activeColor: kSecondColor,
                                        hoverColor: Colors.white,
                                        value: checkBox,
                                        onChanged: (value) {
                                          setState(() {
                                            checkBox = value;
                                          });
                                        }),
                                  ),
                                ),
                                CustomTextFormField(
                                  width: width * 0.6,
                                  onSaved: (value) {},
                                  hint: 'Nursing',
                                  label: 'PHD',
                                  colorLabel: kMainColor,
                                ),
                                InkWell(
                                  onTap: () {
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
                                              firstDate: DateTime(
                                                  DateTime.now().year - 100, 1),
                                              lastDate: DateTime(
                                                  DateTime.now().year + 100, 1),
                                              initialDate: DateTime.now(),
                                              // save the selected date to _selectedDate DateTime variable.
                                              // It's used to set the previous selected date when
                                              // re-showing the dialog.
                                              selectedDate: selectedDate,
                                              onChanged: (DateTime dateTime) {
                                                setState(() {
                                                  selectedDate = dateTime;
                                                });
                                                // close the dialog when year is selected.
                                                Navigator.pop(context);

                                                // Do something with the dateTime selected.
                                                // Remember that you need to use dateTime.year to get the year
                                              },
                                              // currentDate: ,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Year',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: kMainColor,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            selectedDate.year.toString(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: kMainColor,
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down)
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),

                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),

                          ///  Job 1 Seeking for
                          Text(
                            'Job 1 Seeking for',
                            style: TextStyle(
                              fontSize: 18,
                              color: kSecondColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          ///
                          SizedBox(height: height * 0.03),

                          ///
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: kSecondColor),
                            child: CheckboxListTile(
                              onChanged: (value) {},
                              value: checkBox,
                              title: Text('لوكم'),
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),

                          ///
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: kSecondColor),
                            child: CheckboxListTile(
                              onChanged: (value) {},
                              value: checkBox,
                              title: Text('ترخيص'),
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),

                          ///
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: kSecondColor),
                            child: CheckboxListTile(
                              onChanged: (value) {},
                              value: checkBox,
                              title: Text('استخدام عمل'),
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),

                          ///
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: kSecondColor),
                            child: CheckboxListTile(
                              onChanged: (value) {},
                              value: checkBox,
                              title: Text('اعارة'),
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),

                          ///
                          Theme(
                            data:
                                ThemeData(unselectedWidgetColor: kSecondColor),
                            child: CheckboxListTile(
                              onChanged: (value) {},
                              value: checkBox,
                              title: Text('عمل دائم(نقل كفالة)'),
                            ),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                          SizedBox(height: height * 0.03),

                          ///  DOCUMENTS
                          Text(
                            'DOCUMENTS',
                            style: TextStyle(
                              fontSize: 18,
                              color: kSecondColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          ///
                          SizedBox(height: height * 0.03),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.drive_file_move,
                                    color: Colors.black54,
                                    size: 30,
                                  ),
                                  SizedBox(width: width * 0.04),
                                  Text(
                                    'Upload CV',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: kMainColor,
                                    ),
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.03),

                          /// button DONE
                          CustomButton(
                            onPressed: () async {
                              final modelHud =
                                  Provider.of<ModelHud>(context, listen: false);
                              modelHud.changeIsLoading(true);
                              await Future.delayed(Duration(seconds: 2),
                                  () async {
                                modelHud.changeIsLoading(true);
                                modelHud.changeIsLoading(false);
                              });

                              Navigator.pushNamed(
                                  context, NavBarEmployee.routeId);
                            },
                            backgroundColor: kSecondColor,
                            text: 'DONE',
                            width: width,
                          ),
                        ],
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
  }
}
