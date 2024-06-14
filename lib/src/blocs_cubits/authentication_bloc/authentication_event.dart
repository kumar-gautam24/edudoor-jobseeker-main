part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class AuthenticationCheckEvent extends AuthenticationEvent {}

class AuthenticationSendOtpEvent extends AuthenticationEvent {
  final bool isWhatsapp;
  AuthenticationSendOtpEvent({this.isWhatsapp = false});
}

class AuthenticationResendOtpEvent extends AuthenticationEvent {
  final bool isWhatsapp;
  final String phone;
  AuthenticationResendOtpEvent({required this.isWhatsapp, required this.phone});
}

class AuthenticationVerifyOtpEvent extends AuthenticationEvent {
  final String phone;
  final String hash;
  final bool isWhatsapp;
  AuthenticationVerifyOtpEvent({required this.phone, required this.hash, required this.isWhatsapp});
}

abstract class AuthenticationUpdateEvent extends AuthenticationEvent {
  final bool onlyUpdate = true;
  Map<String, dynamic> toJson();
  FormData toFormData();
  bool isValid();
}

class AuthenticationUpdateBasicDetailsEvent extends AuthenticationUpdateEvent {
  @override
  final bool onlyUpdate;
  String? fullName;
  String? email;
  String? address;
  double? lat;
  double? lng;
  DateTime? dob;
  String? gender;

  @override
  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "address": address,
      "lat": lat,
      "lng": lng,
      "DOB": dob?.toIso8601String(),
      'gender': gender,
    };
  }

  @override
  bool isValid() {
    if (fullName == null || fullName!.isEmpty) {
      CustomGetSnackBar(title: "Full Name is required", subTitle: "Please enter your full name", backgroundGradient: AllGradient.errorGradient).show();
      return false;
    } else if (email == null || email!.isEmpty) {
      CustomGetSnackBar(title: "Email is required", subTitle: "Please enter your email", backgroundGradient: AllGradient.errorGradient).show();
      return false;
    } else if (address == null || address!.isEmpty) {
      CustomGetSnackBar(title: "Address is required", subTitle: "Please enter your address", backgroundGradient: AllGradient.errorGradient).show();
      return false;
    } else if (lat == null || lng == null) {
      CustomGetSnackBar(title: "Location is required", subTitle: "Please select your location", backgroundGradient: AllGradient.errorGradient).show();
      return false;
    } else if (dob == null) {
      CustomGetSnackBar(title: "Date of Birth is required", subTitle: "Please select your date of birth", backgroundGradient: AllGradient.errorGradient).show();
      return false;
    } else if (gender == null || gender!.isEmpty) {
      CustomGetSnackBar(title: "Gender is required", subTitle: "Please select your gender", backgroundGradient: AllGradient.errorGradient).show();
      return false;
    }
    return true;
  }

  AuthenticationUpdateBasicDetailsEvent(this.onlyUpdate, {this.fullName, this.email, this.address, this.lat, this.lng, this.dob, this.gender});

  @override
  FormData toFormData() {
    throw UnimplementedError();
  }
}

class AuthenticationEducationDetailsEvent extends AuthenticationUpdateEvent {
  @override
  final bool onlyUpdate;
  final EducationType educationType;
  bool? clear;
  String? fieldOfStudy;
  String? degreeName;
  String? degreeType;
  String? collegeUniversity;
  String? board;
  String? medium;
  String? address;
  double? lat;
  double? lng;
  String? passingYear;
  String? percentageORmarks;
  int? englishProficiency;
  List<String>? otherLanguage;
  List<String>? technicalDegrees;

  String getEducationKey() {
    switch (educationType) {
      case EducationType.tenth:
        return "10th";
      case EducationType.twelve:
        return '12th';
      case EducationType.diploma:
        return 'diploma';
      case EducationType.graduation:
        return 'graduate';
      case EducationType.pg:
        return 'pg';
      case EducationType.doctorate:
        return 'doctorate';
      case EducationType.english:
        return 'englishProficiency';
      case EducationType.othersLanguage:
        return 'otherLanguage';
      default:
        return 'technicalDegrees';
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final key = getEducationKey();
    if (educationType == EducationType.tenth || educationType == EducationType.twelve) {
      return {
        "education": {
          key: {
            "board": board,
            "medium": medium,
            "passingYear": passingYear != null ? int.parse(passingYear!) : null,
            "percentageORmarks": percentageORmarks != null ? int.parse(percentageORmarks!) : null,
          },
        },
      };
    } else if (educationType == EducationType.diploma || educationType == EducationType.graduation || educationType == EducationType.pg || educationType == EducationType.doctorate) {
      return {
        "education": {
          key: {
            "degreeName": degreeName,
            "fieldOfStudy": fieldOfStudy,
            "collegeORuniversity": collegeUniversity,
            'degreeType': degreeType,
            "address": address,
            "lat": lat,
            "lng": lng,
            "passingYear": passingYear != null ? int.parse(passingYear!) : null,
            "percentageORmarks": percentageORmarks != null ? int.parse(percentageORmarks!) : null,
          },
        }
      };
    } else if (educationType == EducationType.english || educationType == EducationType.othersLanguage) {
      return {
        "education": {
          "englishProficiency": englishProficiency,
          // "otherLanguages": otherLanguage,
        }
      };
    } else {
      return {
        "education": {
          key: technicalDegrees,
        }
      };
    }
  }

  @override
  bool isValid() {
    if (clear != null && clear == true) {
      return true;
    }
    if (educationType == EducationType.tenth || educationType == EducationType.twelve) {
      if (board == null || board!.isEmpty) {
        CustomGetSnackBar(title: "Board is required", subTitle: "Please select your board", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (medium == null || medium!.isEmpty) {
        CustomGetSnackBar(title: "Medium is required", subTitle: "Please select your medium", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (passingYear == null || passingYear!.isEmpty) {
        CustomGetSnackBar(title: "Passing Year is required", subTitle: "Please select your passing year", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (percentageORmarks == null || percentageORmarks!.isEmpty) {
        CustomGetSnackBar(title: "Percentage is required", subTitle: "Please enter your percentage", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      }
    } else if (educationType == EducationType.diploma || educationType == EducationType.graduation || educationType == EducationType.pg || educationType == EducationType.doctorate) {
      if (degreeName == null || degreeName!.isEmpty) {
        CustomGetSnackBar(title: "Degree Name is required", subTitle: "Please enter your degree name", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (fieldOfStudy == null || fieldOfStudy!.isEmpty) {
        CustomGetSnackBar(title: "Field of Study is required", subTitle: "Please enter your field of study", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (degreeType == null || degreeType!.isEmpty) {
        CustomGetSnackBar(title: "Degree Type is required", subTitle: "Please select your degree type", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (collegeUniversity == null || collegeUniversity!.isEmpty) {
        CustomGetSnackBar(title: "College/University is required", subTitle: "Please enter your college/university", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (address == null || address!.isEmpty) {
        CustomGetSnackBar(title: "Address is required", subTitle: "Please enter your address", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (lat == null || lng == null) {
        CustomGetSnackBar(title: "Location is required", subTitle: "Please select your location", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (passingYear == null || passingYear!.isEmpty) {
        CustomGetSnackBar(title: "Passing Year is required", subTitle: "Please select your passing year", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      } else if (percentageORmarks == null || percentageORmarks!.isEmpty) {
        CustomGetSnackBar(title: "Percentage is required", subTitle: "Please enter your percentage", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      }
    } else if (educationType == EducationType.english || educationType == EducationType.othersLanguage) {
      if (englishProficiency == null) {
        CustomGetSnackBar(title: "English Proficiency is required", subTitle: "Please select your english proficiency", backgroundGradient: AllGradient.errorGradient).show();
        return false;
      }
    }
    return true;
  }

  AuthenticationEducationDetailsEvent(this.onlyUpdate, this.educationType,
  {this.otherLanguage,this.technicalDegrees,
  this.englishProficiency,
      this.fieldOfStudy, this.degreeType, this.clear, this.board, this.degreeName, this.address, this.lat, this.lng, this.collegeUniversity, this.medium, this.passingYear, this.percentageORmarks});

  @override
  FormData toFormData() {
    throw UnimplementedError();
  }
}

class AuthenticationUploadEvent extends AuthenticationUpdateEvent {
  File? profilePicLink;
  File? resumeLink;

  AuthenticationUploadEvent({this.profilePicLink, this.resumeLink});

  @override
  bool isValid() {
    return profilePicLink == null && resumeLink == null ? false : true;
  }

  @override
  FormData toFormData() {
    final staticData = <String, dynamic>{};
    if (profilePicLink != null) {
      final filename = profilePicLink!.path.split('/').last;
      staticData["profilePicLink"] = MultipartFile.fromFileSync(profilePicLink!.path, filename: filename);
    }
    if (resumeLink != null) {
      final filename = resumeLink!.path.split('/').last;
      staticData["resumeLink"] = MultipartFile.fromFileSync(resumeLink!.path, filename: filename);
    }

    return FormData.fromMap(staticData);
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}

class AuthenticationLogoutEvent extends AuthenticationEvent {}

class AuthenticationClearEvent extends AuthenticationEvent {}

class AuthenticationSendEmailOtpEvent extends AuthenticationEvent {
  final String email;
  AuthenticationSendEmailOtpEvent({required this.email});
}

class AuthenticationVerifyEmailOtpEvent extends AuthenticationEvent {
  final String email;
  final String hash;
  final String otp;
  AuthenticationVerifyEmailOtpEvent({required this.email, required this.hash, required this.otp});
}
