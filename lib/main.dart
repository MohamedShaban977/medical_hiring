import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_hiring/View/employee_Screens/nav_bar_employee/nav_bar_employee_view.dart';
import 'package:medical_hiring/View/employer_screens/messages_employer/chat_employer_view.dart';
import 'package:medical_hiring/View/employer_screens/nav_bar_employer/nav_bar_fab_employer.dart';
import 'package:medical_hiring/View/registration/Employer/employer_company_data.dart';
import 'package:medical_hiring/View/registration/Employer/login_Employer.dart';
import 'package:medical_hiring/View/registration/Employer/register_Employer.dart';
import 'package:medical_hiring/View/registration/cubit/cubit.dart';
import 'package:medical_hiring/core/bloc_observer/bloc_observer.dart';
import 'package:medical_hiring/core/cache_helper_sharedPref/cache_helper.dart';
import 'package:medical_hiring/core/dio_helper/dio_helper.dart';
import 'package:medical_hiring/core/router/router.dart';
import 'package:medical_hiring/provider/filter_my_job.dart';
import 'package:medical_hiring/provider/image_picker/image_picker_provider.dart';
import 'package:medical_hiring/provider/model_hud.dart';
import 'package:medical_hiring/provider/dropdown_provider.dart';
import 'package:medical_hiring/provider/edit_profile_provider.dart';

import 'package:provider/provider.dart';

import 'View/employee_Screens/home_employee_screen/job_title_employee.dart';
import 'View/employee_Screens/messages_screens/chat_view.dart';
import 'View/employee_Screens/savedemployee/saved_employee_view.dart';
import 'View/employee_Screens/settings/employee_settings.dart';
import 'View/employer_screens/my_jobs/all_jobs.dart';
import 'View/employer_screens/my_jobs/candidates.dart';
import 'View/employer_screens/my_jobs/edit_my job.dart';
import 'View/employer_screens/my_jobs/my_jobs_employer.dart';
import 'View/employer_screens/my_jobs/title_job_details.dart';
import 'View/employer_screens/my_jobs/title_jobs_others.dart';
import 'View/employer_screens/new_meeting/add_new_job.dart';
import 'View/employer_screens/profile/profile_employee_accept.dart';
import 'View/employer_screens/settings/employer_settings.dart';
import 'View/introductiom_screen/intro_screen.dart';
import 'View/registration/Employee/loginEmployee.dart';
import 'View/registration/Employee/register_Employee.dart';
import 'View/registration/who_are_you_login_view.dart';
import 'View/registration/Employee/employee_job_dateEntry.dart';
import 'View/employer_screens/profile/employer_profile.dart';
import 'View/registration/who_are_you_register.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  onBoarding = CacheHelper.getData(key: 'onBoard');
  tokenEmployer = CacheHelper.getData(key: 'tokenEmployer');
  print('tokenEmployer :$tokenEmployer');


  Widget page;
  if (onBoarding == null || onBoarding == false)
  {
    page = IntroScreen();
  } else {
    if((tokenEmployer==''||tokenEmployer==null)&&(tokenEmployee==''||tokenEmployee==null))
    {
      page = WhoAreYouView();
    }
    else if(tokenEmployer!=null&&(tokenEmployee==''||tokenEmployee==null))
    {
      page = NavBarFABEmployer();
    }else if(tokenEmployee!=null&&(tokenEmployer==''||tokenEmployer==null))
      {
        page =NavBarEmployee();
      }
    else{
      page =WhoAreYouView();
    }

  }
  print('MainWidget :$page');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AppRegisterCubit>(create: (context) => AppRegisterCubit()),
    ],
    child: MyApp(
      homePage: page,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final Widget homePage;

  const MyApp({this.homePage});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        AppRegisterCubit();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Medical Hiring',
        theme: theme,
        navigatorKey: navigatorKey,
        // Add the locale here

        onGenerateRoute: onGenerateRoute,
        // home: EmployerCompanyData(),
        home: homePage,
        // NavBarFABEmployer(),
        // onBoarding ? WhoAreYouView() : IntroScreen(),

        // initialRoute: ChatView.routeId,
        // builder: (BuildContext context,NavBarApp()),
        // initialRoute:
        //     // NavBarEmployee.routeId,
        //     isViewed != 0 ? IntroScreen.routeId : WhoAreYouView.routeId,
        routes: {
          /// IntroScreen
          // IntroScreen.routeId: (context) => IntroScreen(),

          /// WhoAreYou Screen
          WhoAreYouView.routeId: (context) => WhoAreYouView(),
          WhoAreYouRegister.routeId: (context) => WhoAreYouRegister(),

          /// RegisterEmployer
          RegisterEmployer.routeId: (context) => RegisterEmployer(),
          EmployerCompanyData.routeId: (context) => EmployerCompanyData(),
          LoginEmployer.routeId: (context) => LoginEmployer(),

          /// Screens Employer
          JobDetails.routeId: (context) => JobDetails(),
          EditMyJob.routeId: (context) => EditMyJob(),
          AddNewJob.routeId: (context) => AddNewJob(),
          AllJobs.routeId: (context) => AllJobs(),
          ChatEmployerView.routeId: (context) => ChatEmployerView(),
          TitleJobsOthers.routeId: (context) => TitleJobsOthers(),
          EmployerSettings.routeId: (context) => EmployerSettings(),
          EmployerProfile.routeId: (context) => EmployerProfile(),
          Candidates.routeId: (context) => Candidates(),
          ProfileEmployeeAccept.routeId: (context) => ProfileEmployeeAccept(),
          MyJobEmployer.routeId: (context) => MyJobEmployer(),

          ///Register Employee
          RegisterEmployee.routeId: (context) => RegisterEmployee(),
          EmployeeJobDataEntry.routeId: (context) => EmployeeJobDataEntry(),

          /// Login Employee
          LoginEmployee.routeId: (context) => LoginEmployee(),

          /// Home Employee
          NavBarEmployee.routeId: (context) => NavBarEmployee(),
          EmployeeSettings.routeId: (context) => EmployeeSettings(),
          SavedEmployeeView.routeId: (context) => SavedEmployeeView(),
          JobTitleEmployeeView.routeId: (context) => JobTitleEmployeeView(),
          ChatEmployeeView.routeId: (context) => ChatEmployeeView(),

          // HomeView.routeId: (context) => HomeView(),
          // NavBarApp.routeId: (context) => NavBarApp(),
        },
      ),
    );
  }
}
