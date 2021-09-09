
import 'package:flutter/material.dart';
import 'package:medical_hiring/View/employer_screens/home_employer_screen/home_employer%20_view.dart';
import 'package:medical_hiring/View/employer_screens/messages_employer/messages_employer.dart';
import 'package:medical_hiring/View/employer_screens/my_jobs/my_jobs_employer.dart';
import 'package:medical_hiring/View/employer_screens/new_meeting/add_new_job.dart';
import 'package:medical_hiring/View/employer_screens/notifications_employer/notifications_employer.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/core/cubit/cubit_nav_bar_employer/nav_bar_employer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarEmployerCubit extends Cubit<NavBarEmployerStates> {
  NavBarEmployerCubit() : super(NavBarEmployerInitial());

  static NavBarEmployerCubit get(context)=> BlocProvider.of(context);

  List<Widget> screens (){
    return [
      HomeEmployerView(),
      NotificationsEmployerView(),
      AddNewJob(),
      MessagesEmployer(),
      MyJobEmployer(),
    ]; }
  List<String> listTitleAppBar() {
    return [
      'Home',
      'Notification',
      'NEW JOB',
      'Messages',
      'My Jobs',
    ];
  }
  int currentTab = 0; // to keep track of active tab index

  Widget currentScreen = HomeEmployerView(); // Our first view in viewport
  String titleAppbar = 'Home';

  Color activeColor=kWhiteColor;
  Color inactiveColor=Colors.grey[500];

  void changeIndex(int index){
    currentTab =index;
    titleAppbar=listTitleAppBar()[currentTab];
    currentScreen=screens()[currentTab];
emit(NavBarEmployerChangeState());
  }

  Color changeColorIcon(int index){

    return currentTab ==index?activeColor:inactiveColor;
    emit(NavBarEmployerChangeState());

  }

}
