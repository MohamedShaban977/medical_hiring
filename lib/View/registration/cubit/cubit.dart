import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_hiring/View/registration/cubit/states.dart';
import 'package:medical_hiring/constants.dart';
import 'package:medical_hiring/core/cache_helper_sharedPref/cache_helper.dart';
import 'package:medical_hiring/core/dio_helper/dio_helper.dart';
import 'package:medical_hiring/core/dio_helper/end_points.dart';
import 'package:medical_hiring/models/users/employee/employee_login_model.dart';
import 'package:medical_hiring/models/users/employer/business_model.dart';
import 'package:medical_hiring/models/users/employer/employer_login_model.dart';
import 'package:medical_hiring/models/users/employer/employer_register_model.dart';
import 'package:medical_hiring/models/users/employer/establishment_model.dart';
import 'package:medical_hiring/models/users/location_user/city_model.dart';
import 'package:medical_hiring/models/users/location_user/country_model.dart';

class AppRegisterCubit extends Cubit<AppRegisterStates> {
  AppRegisterCubit() : super(AppRegisterInitialState());

  static AppRegisterCubit get(context) => BlocProvider.of(context);

  ///___________________________________________________________________
  ///  Country

  CountryModel countryModel = CountryModel();
  Response responseCountry;
  List<CountryModel> countryList = [];
  List<String> countryNameList = [];
  List<String> city = [];
  String selectedCountry;
  String selectedCity;

  Future<void> getCountry() async {
    countryNameList.clear();
    countryList.clear();

    emit(GetCountryDataLoadingState());

    responseCountry = await DioHelper.dio
        .get(
      COUNTRY_API,
      options: Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        contentType: Headers.jsonContentType,
        headers: {
          'Authorization': AUTH_TOKEN_COUNTRY,
          'Accept': 'application/json',
        },
      ),
    )
        .then((value) {
      countryList = value.data
          .map<CountryModel>((item) => CountryModel.fromJson(item))
          .toList();
      print('___________________________________________');
      for (var index in countryList) {
        countryNameList.add(index.countryName);
      }
      print(countryNameList.toString());
      print('___________________________________________');

      emit(GetCountryDataSuccessState());
    }).catchError((onError) {
      print('onError Data :$onError');

      emit(GetCountryDataErrorState());
    });
  }

  Future<void> onChangeCountry(value) async {
    selectedCountry = value;
    selectedCity = null;
    city.clear();
    await getCity(selectCountryName: value);
    print('selectCountryName   ' + selectedCountry);
    emit(ChangeCountryDataState());
  }

  ///__________________________________________________________
  /// City
  CityModel cityModel = CityModel();
  Response responseCity;
  List<CityModel> cityList = [];
  List<String> cityNameList = [];

  Future<void> getCity({String selectCountryName}) async {
    cityList.clear();
    cityNameList.clear();
    emit(GetCityDataLoadingState());

    responseCity = await DioHelper.dio
        .get(
      CITY_API + selectCountryName,
      options: Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        contentType: Headers.jsonContentType,
        headers: {
          'Authorization': AUTH_TOKEN_COUNTRY,
          'Accept': 'application/json',
        },
      ),
    )
        .then((value) {
      cityList = value.data
          .map<CityModel>((item) => CityModel.fromJson(item))
          .toList();

      print('___________________________________________');
      for (var index in cityList) {
        cityNameList.add(index.stateName);
      }

      print(cityNameList.toString());
      print('___________________________________________');

      emit(GetCityDataSuccessState());
    }).catchError((onError) {
      print('onError Data :$onError');

      emit(GetCityDataErrorState());
    });
  }

  onChangeCity(value) {
    selectedCity = value;

    print('selectCityName   ' + selectedCity);
    emit(ChangeCityDataState());
  }

  ///___________________________________________________
  /// Business
  BusinessModel businessModel = BusinessModel();
  List<Business> listBusiness = [];
  List<String> listBusinessName = [];

  Future<void> getBusiness() async {
    listBusiness.clear();
    listBusinessName.clear();
    emit(GetBusinessDataLoadingState());
    DioHelper.getData(url: EMPLOYER_BUSINESS).then((value) async {
      print('getBusiness Data :${value.data}');
      businessModel = BusinessModel.fromJson(value.data);

      for (var i in businessModel.business) {
        listBusiness.add(i);

        for (var n in listBusiness) {
          print(n.name);
          listBusinessName.add(n.name);
        }
      }

      emit(GetBusinessDataSuccessState());
    }).catchError((onError) {
      print('onError Data :$onError');

      emit(GetBusinessDataErrorState());
    });
  }

  String selectBusinessName;
  int selectBusinessId;
  onChangeBusiness(value) {
    for (int i = 0; i <= listBusinessName.length; i++) {
      selectBusinessId = i;
    }

    selectBusinessName = value;
    print('selectBusinessId   ' + selectBusinessId.toString());
    print('selectBusinessName   ' + selectBusinessName);
    emit(ChangeBusinessDataState());
  }

  ///_________________________________________________________________
  /// Establishment Type
  EstablishmentTypeModel establishmentTypeModel = EstablishmentTypeModel();
  List<EstablishmentType> listEstablishment = [];
  List<String> listEstablishmentName = [];
  Future<void> getEstablishment() async {
    listEstablishment.clear();
    listEstablishmentName.clear();
    emit(GetEstablishmentDataLoadingState());
    DioHelper.getData(url: EMPLOYER_ESTABLISHMENT).then((value) async {
      print('getEstablishment Data :${value.data}');

      establishmentTypeModel = EstablishmentTypeModel.fromJson(value.data);

      for (var i in establishmentTypeModel.establishmentType) {
        listEstablishment.add(i);
        for (var n in listEstablishment) {
          listEstablishmentName.add(n.name);
        }
      }
      emit(GetEstablishmentDataSuccessState());
    }).catchError((onError) {
      print('onError Data :$onError');

      emit(GetEstablishmentDataErrorState());
    });
  }

  String selectEstablishmentName;
  int selectEstablishmentId;
  onChangeEstablishment(value) {
    for (int i = 0; i <= listEstablishmentName.length; i++) {
      selectEstablishmentId = i;
    }
    selectEstablishmentName = value;
    print('selectEstablishmentId   ' + selectEstablishmentId.toString());
    print('selectEstablishmentName   ' + selectEstablishmentName.toString());
    emit(ChangeEstablishmentDataState());
  }

  ///________________________________________________________
  /// Pass Visibility
  IconData suffix = Icons.remove_red_eye;
  bool isPassword = true;
  void changePassVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.remove_red_eye : Icons.visibility_off_outlined;
    emit(PassVisibilityState());
  }

  ///______________________________________________________________________
  /// get image
  final imagePicker = ImagePicker();
  File logoFile;
  String fileLogo;
  Future<void> getImage(ImageSource src) async {
    final pickedFile = await imagePicker.getImage(source: src);

    if (pickedFile != null) {
      logoFile = File(pickedFile.path);
      fileLogo = logoFile.path.split('/').last;
      emit(GetImageSuccessState());
    } else {
      showToast(backgroundColor: kMainColor, message: 'No Image Selected ...');
      print('No Image Selected ...');
      emit(NoGetImageState());
    }
  }

  File fileCv;
  String cv;
  getFileCV() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        allowedExtensions: ['pdf', 'doc'], type: FileType.custom);

    if (result != null) {
      fileCv = File(result.files.single.path);
      cv = fileCv.path.split('/').last;

      print('fileCv' + fileCv.path.toString());
      print('fileCv' + cv.toString());

      emit(GetFileCVSuccessState());
    } else {
      // User canceled the picker
      showToast(backgroundColor: kMainColor, message: 'No CV Selected ...');
      print('CV Image Selected ...');
      emit(NoGetFileCVState());
    }

  }

  ///____________________________________________________________________________
  /// Employer Login
  EmployerLoginModel employerLoginModel;
  void employerLogin({@required String email, @required String password}) {
    emit(EmployerLoginLoadingState());
    DioHelper.postData(
      url: LOGIN_EMPLOYER,
      data: {'email': email, 'password': password},
    ).then((value) {
      if (value.data['status']) {
        print(value.data.toString());
        tokenEmployer = value.data['token'];
        employerLoginModel = EmployerLoginModel.fromJson(value.data);
        CacheHelper.saveData(key: 'tokenEmployer', value: tokenEmployer);

        print(employeeLoginModel.token.toString());
        emit(EmployerLoginSuccessState(employerLoginModel));
      } else {
        employerLoginModel = EmployerLoginModel.fromJson(value.data);
        print(employerLoginModel.message);

        emit(EmployerLoginErrorState(employerLoginModel.message));
      }
    }).catchError((onError) {
      print(onError);

      emit(EmployerLoginErrorState(onError.toString()));
    });
  }

  ///_________________________________________________________________
  /// Employer Register
  EmployerRegisterModel employerRegisterModel = EmployerRegisterModel();
  Response responseEmployer;
  Future<void> employerRegister({
    @required String email,
    @required String password,
    @required String password_confirmation,
    @required String company_name,
    @required String country,
    @required String city,
    @required int business,
    @required int establishment_type_id,
    @required String established_at,
    @required String website,
  }) async {
    emit(EmployerRegisterLoadingState());

    FormData formData = FormData.fromMap({
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
      'company_name': company_name,
      'country': country,
      'city': city,
      'business': business,
      'establishment_type_id': establishment_type_id,
      'established_at': established_at,
      'website': website,
      'image': await MultipartFile.fromFile(
        logoFile.path,
        filename: fileLogo,
        contentType: MediaType('image', 'jpg'),
      )
    });

    try {
      responseEmployer = await DioHelper.dio
          .post(
        'http://algorithm.demo.carmartapp.com/Hiring-Medical/public/api/employer/register',
        data: formData,
        options: Options(
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      )
          .then((value) {
        print(value.data);
        employerRegisterModel = EmployerRegisterModel.fromJson(value.data);
        tokenEmployer = employerRegisterModel.token;
        CacheHelper.saveData(key: 'tokenEmployer', value: tokenEmployer);
        print('Employer token :$tokenEmployer');

        emit(EmployerRegisterSuccessState(employerRegisterModel));
      }).catchError((onError) {
        print(onError);
        emit(EmployerRegisterErrorState(onError.toString()));
      });
    } catch (ex) {
      print('ex  $ex');
    }
  }

  /// Employee Login
  EmployeeLoginModel employeeLoginModel;
  Future<void> employeeLogin(
      {@required String email, @required String password}) async {
    emit(EmployeeLoginLoadingState());
    await DioHelper.postData(
      url: LOGIN_EMPLOYEE,
      data: {'email': email, 'password': password},
    ).then((value) {
      if (value.data['status']) {
        print(value.data);
        tokenEmployer = value.data['token'];
        employeeLoginModel = EmployeeLoginModel.fromJson(value.data);
        tokenEmployee = employeeLoginModel.token;
        CacheHelper.saveData(key: 'tokenEmployee', value: tokenEmployee);

        print(employeeLoginModel.token);
        emit(EmployeeLoginSuccessState(employeeLoginModel));
      } else {
        employeeLoginModel = EmployeeLoginModel.fromJson(value.data);
        print(employeeLoginModel.message);

        emit(EmployeeLoginErrorState(employeeLoginModel.message));
      }
    }).catchError((onError) {
      print(onError);

      emit(EmployeeLoginErrorState(onError.toString()));
    });
  }
}
