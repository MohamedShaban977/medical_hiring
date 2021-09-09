import 'package:medical_hiring/models/users/employee/employee_login_model.dart';
import 'package:medical_hiring/models/users/employer/employer_login_model.dart';
import 'package:medical_hiring/models/users/employer/employer_register_model.dart';

abstract class AppRegisterStates {}

class AppRegisterInitialState extends AppRegisterStates {}
class AppRegisterLoadingState extends AppRegisterStates {}

///_________________  Employer  _________________________________________________________
//
/// Employer Login
class EmployerLoginInitialState extends AppRegisterStates{}
class EmployerLoginLoadingState extends AppRegisterStates{}
class EmployerLoginSuccessState extends AppRegisterStates {
  final EmployerLoginModel  employerLoginModel;
  EmployerLoginSuccessState(this.employerLoginModel);
}
class EmployerLoginErrorState extends AppRegisterStates {
  final String error; EmployerLoginErrorState(this.error);
}

class PassVisibilityState extends AppRegisterStates {}


/// Employer Register
class EmployerRegisterInitialState extends AppRegisterStates {}
class EmployerRegisterLoadingState extends AppRegisterStates {}
class EmployerRegisterSuccessState extends AppRegisterStates {
  final EmployerRegisterModel employerRegisterModel;
  EmployerRegisterSuccessState(this.employerRegisterModel);
}
class EmployerRegisterErrorState extends AppRegisterStates {
  final String error;
  EmployerRegisterErrorState(this.error);
}

/// Business
class GetBusinessDataLoadingState extends AppRegisterStates{}
class GetBusinessDataSuccessState  extends AppRegisterStates{}
class GetBusinessDataErrorState extends AppRegisterStates{}
class ChangeBusinessDataState extends AppRegisterStates{}

/// Establishment
class GetEstablishmentDataLoadingState extends AppRegisterStates{}
class GetEstablishmentDataSuccessState  extends AppRegisterStates{}
class GetEstablishmentDataErrorState extends AppRegisterStates{}

class ChangeEstablishmentDataState extends AppRegisterStates{}

/// Country
class GetCountryDataLoadingState extends AppRegisterStates{}
class GetCountryDataSuccessState  extends AppRegisterStates{}
class GetCountryDataErrorState extends AppRegisterStates{}
class ChangeCountryDataState extends AppRegisterStates{}

/// City
class GetCityDataLoadingState extends AppRegisterStates{}
class GetCityDataSuccessState  extends AppRegisterStates{}
class GetCityDataErrorState extends AppRegisterStates{}
class ChangeCityDataState extends AppRegisterStates{}

/// Get Image
class GetImageSuccessState extends AppRegisterStates{}
class NoGetImageState extends AppRegisterStates{}

class GetFileCVSuccessState extends AppRegisterStates{}
class NoGetFileCVState extends AppRegisterStates{}

///_____________________________________________________________
/// Employee Login
class EmployeeLoginInitialState extends AppRegisterStates{}
class EmployeeLoginLoadingState extends AppRegisterStates{}
class EmployeeLoginSuccessState extends AppRegisterStates {
  final EmployeeLoginModel  employeeLoginModel;
  EmployeeLoginSuccessState(this.employeeLoginModel);
}
class EmployeeLoginErrorState extends AppRegisterStates {
  final String error; EmployeeLoginErrorState(this.error);
}


/// Employee Register
class EmployeeRegisterInitialState extends AppRegisterStates {}
class EmployeeRegisterLoadingState extends AppRegisterStates {}
class EmployeeRegisterSuccessState extends AppRegisterStates {
  // final EmployeeRegisterModel employeeRegisterModel;
  // EmployeeRegisterSuccessState(this.employeeRegisterModel);
}
class EmployeeRegisterErrorState extends AppRegisterStates {
  final String error;
  EmployeeRegisterErrorState(this.error);
}