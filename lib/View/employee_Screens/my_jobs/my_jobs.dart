import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_hiring/View/employee_Screens/home_employee_screen/job_title_employee.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/provider/filter_my_job.dart';
import 'package:medical_hiring/provider/model_hud.dart';
import 'package:medical_hiring/widget/custom_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class MyJobsEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allJobProvider = Provider.of<FilterMyJob>(context).all;
    final acceptedJobProvider = Provider.of<FilterMyJob>(context).accepted;
    final underProgressJobProvider =
        Provider.of<FilterMyJob>(context).underProgress;
    final rejectedJobProvider = Provider.of<FilterMyJob>(context).rejected;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Column(
            children: [
              Container(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CustomButton(
                          onPressed: () async {
                            await loadingFunction(context);

                            Provider.of<FilterMyJob>(context, listen: false)
                                .changeIsAll(true);
                          },
                          text: 'All',
                          width: 100,
                          backgroundColor:
                              allJobProvider ? kSecondColor : kWhiteColor,
                          textColor:
                              allJobProvider ? kWhiteColor : kSecondColor,
                        ),
                        SizedBox(width: 20),
                        CustomButton(
                          onPressed: () async {
                            await loadingFunction(context);

                            Provider.of<FilterMyJob>(context, listen: false)
                                .changeIsAccepted(true);
                          },
                          text: 'Accepted',
                          backgroundColor:
                              acceptedJobProvider ? kSecondColor : kWhiteColor,
                          textColor:
                              acceptedJobProvider ? kWhiteColor : kSecondColor,
                          width: 100,
                        ),
                        SizedBox(width: 20),
                        CustomButton(
                          onPressed: () async {
                            await loadingFunction(context);

                            Provider.of<FilterMyJob>(context, listen: false)
                                .changeIsUnderProgress(true);
                          },
                          text: 'Under progress',
                          backgroundColor: underProgressJobProvider
                              ? kSecondColor
                              : kWhiteColor,
                          textColor: underProgressJobProvider
                              ? kWhiteColor
                              : kSecondColor,
                          width: 100,
                        ),
                        SizedBox(width: 20),
                        CustomButton(
                          onPressed: () async {
                            await loadingFunction(context);

                            Provider.of<FilterMyJob>(context, listen: false)
                                .changeIsRejected(true);
                          },
                          text: 'Rejected',
                          backgroundColor:
                              rejectedJobProvider ? kSecondColor : kWhiteColor,
                          textColor:
                              rejectedJobProvider ? kWhiteColor : kSecondColor,
                          width: 100,
                        ),
                      ],
                    ),
                  )

                  // ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemBuilder: (context, index) {
                  //     return Text(
                  //       'data$index',
                  //       style: TextStyle(fontSize: 50),
                  //     );
                  //   },
                  //   itemCount: 3,
                  // ),
                  ),
              ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: PageScrollPhysics(),
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, JobTitleEmployeeView.routeId,
                          arguments: false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(5, 5),
                                  spreadRadius: 2)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'El-Madina hospital',
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  Container(
                                    height: 30,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: !acceptedJobProvider
                                            ? Colors.blueGrey.withOpacity(0.5)
                                            : kSecondColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        acceptedJobProvider
                                            ? 'Accepted'
                                            : rejectedJobProvider
                                                ? 'Rejected'
                                                : underProgressJobProvider
                                                    ? 'Under Progress'
                                                    : 'All',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: kWhiteColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Nursing Support',
                                style: TextStyle(
                                    color: kMainColor,
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Full-Time',
                                style: TextStyle(
                                    color: kMainColor,
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '21-21-2021',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 18),
                                  ),
                                  Icon(FontAwesomeIcons.city),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future loadingFunction(BuildContext context ,) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeIsLoading(true);
    await Future.delayed(Duration(seconds: 2), () {
      modelHud.changeIsLoading(true);
      modelHud.changeIsLoading(false);
    });
  }
}
