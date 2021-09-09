class EmployeeRegisterModel {
  bool status;
  String message;
  Employee employee;
  String token;

  EmployeeRegisterModel({this.status, this.message, this.employee, this.token});

  EmployeeRegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Employee {
  String username;
  String email;
  String country;
  String city;
  String currentAddress;
  String jobTitle;
  String jobFiled;
  String jobSpecialist;
  String educationBachelor;
  String educationBachelorYear;
  String educationExcellent;
  String educationExcellentYear;
  String educationMa;
  String educationMaYear;
  String educationFellowship;
  String educationFellowshipYear;
  String educationPhd;
  String educationPhdYear;
  String jobPunch;
  String jobLicense;
  String jobUseWork;
  String jobLoan;
  String jobPermanentWork;
  String gender;
  dynamic cv;
  dynamic image;

  Employee(
      {this.username,
        this.email,
        this.country,
        this.city,
        this.currentAddress,
        this.jobTitle,
        this.jobFiled,
        this.jobSpecialist,
        this.educationBachelor,
        this.educationBachelorYear,
        this.educationExcellent,
        this.educationExcellentYear,
        this.educationMa,
        this.educationMaYear,
        this.educationFellowship,
        this.educationFellowshipYear,
        this.educationPhd,
        this.educationPhdYear,
        this.jobPunch,
        this.jobLicense,
        this.jobUseWork,
        this.jobLoan,
        this.jobPermanentWork,
        this.gender,
        this.cv,
        this.image});

  Employee.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    country = json['country'];
    city = json['city'];
    currentAddress = json['current_address'];
    jobTitle = json['job_title'];
    jobFiled = json['job_filed'];
    jobSpecialist = json['job_specialist'];
    educationBachelor = json['education_bachelor'];
    educationBachelorYear = json['education_bachelor_year'];
    educationExcellent = json['education_excellent'];
    educationExcellentYear = json['education_excellent_year'];
    educationMa = json['education_ma'];
    educationMaYear = json['education_ma_year'];
    educationFellowship = json['education_fellowship'];
    educationFellowshipYear = json['education_fellowship_year'];
    educationPhd = json['education_phd'];
    educationPhdYear = json['education_phd_year'];
    jobPunch = json['job_punch'];
    jobLicense = json['job_license'];
    jobUseWork = json['job_use_work'];
    jobLoan = json['job_loan'];
    jobPermanentWork = json['job_permanent_work'];
    gender = json['gender'];
    cv = json['cv'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['country'] = this.country;
    data['city'] = this.city;
    data['current_address'] = this.currentAddress;
    data['job_title'] = this.jobTitle;
    data['job_filed'] = this.jobFiled;
    data['job_specialist'] = this.jobSpecialist;
    data['education_bachelor'] = this.educationBachelor;
    data['education_bachelor_year'] = this.educationBachelorYear;
    data['education_excellent'] = this.educationExcellent;
    data['education_excellent_year'] = this.educationExcellentYear;
    data['education_ma'] = this.educationMa;
    data['education_ma_year'] = this.educationMaYear;
    data['education_fellowship'] = this.educationFellowship;
    data['education_fellowship_year'] = this.educationFellowshipYear;
    data['education_phd'] = this.educationPhd;
    data['education_phd_year'] = this.educationPhdYear;
    data['job_punch'] = this.jobPunch;
    data['job_license'] = this.jobLicense;
    data['job_use_work'] = this.jobUseWork;
    data['job_loan'] = this.jobLoan;
    data['job_permanent_work'] = this.jobPermanentWork;
    data['gender'] = this.gender;
    data['cv'] = this.cv;
    data['image'] = this.image;
    return data;
  }
}