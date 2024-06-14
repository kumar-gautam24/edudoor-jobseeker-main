// To parse this JSON data, do
//
//     final jobseekerModel = jobseekerModelFromJson(jsonString);

import 'dart:convert';

JobseekerModel jobseekerModelFromJson(String str) => JobseekerModel.fromJson(json.decode(str));

String jobseekerModelToJson(JobseekerModel data) => json.encode(data.toJson());

class JobseekerModel {
  final String id;
  final String phone;
  final String? fullName;
  final String? email;
  final bool? isEmailVerified;
  final DateTime? dob;
  final String? gender;
  final double? lat;
  final double? lng;
  final String? address;
  final Education? education;
  final JobPreference? jobPreference;
  final LatestExperience? latestExperience;
  final String? resumeLink;
  final String? profilePicLink;
  final String? resumeLinkBlurHash;
  final String? profilePicLinkBlurHash;
  final String? aadharNo;
  final String? aadharFrontImage;
  final String? aadharBackImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  JobseekerModel({
    required this.id,
    required this.phone,
    this.fullName,
    this.email,
    this.isEmailVerified,
    this.dob,
    this.gender,
    this.lat,
    this.lng,
    this.address,
    this.education,
    this.jobPreference,
    this.latestExperience,
    this.resumeLink,
    this.profilePicLink,
    this.resumeLinkBlurHash,
    this.profilePicLinkBlurHash,
    this.aadharNo,
    this.aadharFrontImage,
    this.aadharBackImage,
    required this.createdAt,
    required this.updatedAt,
  });

  JobseekerModel copyWith({
    String? id,
    String? phone,
    String? fullName,
    String? email,
    bool? isEmailVerified,
    DateTime? dob,
    String? gender,
    double? lat,
    double? lng,
    String? address,
    Education? education,
    JobPreference? jobPreference,
    LatestExperience? latestExperience,
    String? resumeLink,
    String? profilePicLink,
    String? resumeLinkBlurHash,
    String? profilePicLinkBlurHash,
    String? aadharNo,
    String? aadharFrontImage,
    String? aadharBackImage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      JobseekerModel(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        address: address ?? this.address,
        education: education ?? this.education,
        jobPreference: jobPreference ?? this.jobPreference,
        latestExperience: latestExperience ?? this.latestExperience,
        resumeLink: resumeLink ?? this.resumeLink,
        profilePicLink: profilePicLink ?? this.profilePicLink,
        resumeLinkBlurHash: resumeLinkBlurHash ?? this.resumeLinkBlurHash,
        profilePicLinkBlurHash: profilePicLinkBlurHash ?? this.profilePicLinkBlurHash,
        aadharNo: aadharNo ?? this.aadharNo,
        aadharFrontImage: aadharFrontImage ?? this.aadharFrontImage,
        aadharBackImage: aadharBackImage ?? this.aadharBackImage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory JobseekerModel.fromJson(Map<String, dynamic> json) => JobseekerModel(
        id: json["_id"],
        phone: json["phone"],
        fullName: json["fullName"],
        email: json["email"],
        isEmailVerified: json["isEmailVerified"] ?? false,
        dob: json["DOB"] != null ? DateTime.parse(json["DOB"]) : null,
        gender: json["gender"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        address: json["address"],
        education: json["education"] != null ? Education.fromJson(json["education"]) : null,
        jobPreference: json["jobPreference"] != null ? JobPreference.fromJson(json["jobPreference"]) : null,
        latestExperience: json["latestExperience"] != null ? LatestExperience.fromJson(json["latestExperience"]) : null,
        resumeLink: json["resumeLink"],
        profilePicLink: json["profilePicLink"],
        resumeLinkBlurHash: json["resumeLinkBlurHash"],
        profilePicLinkBlurHash: json["profilePicLinkBlurHash"],
        aadharNo: json["aadharNo"],
        aadharFrontImage: json["aadharFrontImage"],
        aadharBackImage: json["aadharBackImage"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone": phone,
        "fullName": fullName,
        "email": email,
        "isEmailVerified": isEmailVerified,
        "DOB": dob?.toIso8601String(),
        "gender": gender,
        "lat": lat,
        "lng": lng,
        "address": address,
        "education": education?.toJson(),
        "jobPreference": jobPreference?.toJson(),
        "latestExperience": latestExperience?.toJson(),
        "resumeLink": resumeLink,
        "profilePicLink": profilePicLink,
        "resumeLinkBlurHash": resumeLinkBlurHash,
        "profilePicLinkBlurHash": profilePicLinkBlurHash,
        "aadharNo": aadharNo,
        "aadharFrontImage": aadharFrontImage,
        "aadharBackImage": aadharBackImage,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Education {
  final Th? the10Th;
  final Th? the12Th;
  final Diploma? diploma;
  final Diploma? graduate;
  final Diploma? pg;
  final Diploma? doctorate;
  final List<String>? technicalDegrees;
  final List<String>? otherLanguages;
  final int? englishProficiency;

  Education({
    this.the10Th,
    this.the12Th,
    this.diploma,
    this.graduate,
    this.pg,
    this.doctorate,
    this.technicalDegrees,
    this.otherLanguages,
    this.englishProficiency,
  });

  Education copyWith({
    Th? the10Th,
    Th? the12Th,
    Diploma? diploma,
    Diploma? graduate,
    Diploma? pg,
    Diploma? doctorate,
    List<String>? technicalDegrees,
    List<String>? otherLanguages,
    int? englishProficiency,
  }) =>
      Education(
        the10Th: the10Th ?? this.the10Th,
        the12Th: the12Th ?? this.the12Th,
        diploma: diploma ?? this.diploma,
        graduate: graduate ?? this.graduate,
        pg: pg ?? this.pg,
        doctorate: doctorate ?? this.doctorate,
        technicalDegrees: technicalDegrees ?? this.technicalDegrees,
        otherLanguages: otherLanguages ?? this.otherLanguages,
        englishProficiency: englishProficiency ?? this.englishProficiency,
      );

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        the10Th: json["10th"] != null ? Th.fromJson(json["10th"]) : null,
        the12Th: json["12th"] != null ? Th.fromJson(json["12th"]) : null,
        diploma: json["diploma"] != null ? Diploma.fromJson(json["diploma"]) : null,
        graduate: json["graduate"] != null ? Diploma.fromJson(json["graduate"]) : null,
        pg: json["pg"] != null ? Diploma.fromJson(json["pg"]) : null,
        doctorate: json["doctorate"] != null ? Diploma.fromJson(json["doctorate"]) : null,
        technicalDegrees: List<String>.from(json["technicalDegrees"]?.map((x) => x)),
        otherLanguages: List<String>.from(json["otherLanguages"]?.map((x) => x)),
        englishProficiency: json["englishProficiency"],
      );

  Map<String, dynamic> toJson() => {
        "10th": the10Th?.toJson(),
        "12th": the12Th?.toJson(),
        "diploma": diploma?.toJson(),
        "graduate": graduate?.toJson(),
        "pg": pg?.toJson(),
        "doctorate": doctorate?.toJson(),
        "technicalDegrees": List<String>.from(technicalDegrees?.map((x) => x) ?? []),
        "otherLanguages": List<String>.from(otherLanguages?.map((x) => x) ?? []),
        "englishProficiency": englishProficiency,
      };
}

class Diploma {
  final String? degreeName;
  final String? fieldOfStudy;
  final String? collegeORuniversity;
  final String? degreeType;
  final double? lat;
  final double? lng;
  final String? address;
  final int? passingYear;
  final int? percentageORmarks;

  Diploma({
    this.degreeName,
    this.fieldOfStudy,
    this.collegeORuniversity,
    this.degreeType,
    this.lat,
    this.lng,
    this.address,
    this.passingYear,
    this.percentageORmarks,
  });

  Diploma copyWith({
    String? degreeName,
    String? fieldOfStudy,
    String? collegeORuniversity,
    String? degreeType,
    double? lat,
    double? lng,
    String? address,
    int? passingYear,
    int? percentageORmarks,
  }) =>
      Diploma(
        degreeName: degreeName ?? this.degreeName,
        fieldOfStudy: fieldOfStudy ?? this.fieldOfStudy,
        collegeORuniversity: collegeORuniversity ?? this.collegeORuniversity,
        degreeType: degreeType ?? this.degreeType,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        address: address ?? this.address,
        passingYear: passingYear ?? this.passingYear,
        percentageORmarks: percentageORmarks ?? this.percentageORmarks,
      );

  factory Diploma.fromJson(Map<String, dynamic> json) => Diploma(
        degreeName: json["degreeName"],
        fieldOfStudy: json["fieldOfStudy"],
        collegeORuniversity: json["collegeORuniversity"],
        degreeType: json["degreeType"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        address: json["address"],
        passingYear: json["passingYear"],
        percentageORmarks: json["percentageORmarks"],
      );

  Map<String, dynamic> toJson() => {
        "degreeName": degreeName,
        "fieldOfStudy": fieldOfStudy,
        "collegeORuniversity": collegeORuniversity,
        "degreeType": degreeType,
        "lat": lat,
        "lng": lng,
        "address": address,
        "passingYear": passingYear,
        "percentageORmarks": percentageORmarks,
      };
}

class Th {
  final String? board;
  final String? medium;
  final int? passingYear;
  final int? percentageORmarks;

  Th({
    this.board,
    this.medium,
    this.passingYear,
    this.percentageORmarks,
  });

  Th copyWith({
    String? board,
    String? medium,
    int? passingYear,
    int? percentageORmarks,
  }) =>
      Th(
        board: board ?? this.board,
        medium: medium ?? this.medium,
        passingYear: passingYear ?? this.passingYear,
        percentageORmarks: percentageORmarks ?? this.percentageORmarks,
      );

  factory Th.fromJson(Map<String, dynamic> json) => Th(
        board: json["board"],
        medium: json["medium"],
        passingYear: json["passingYear"],
        percentageORmarks: json["percentageORmarks"],
      );

  Map<String, dynamic> toJson() => {
        "board": board,
        "medium": medium,
        "passingYear": passingYear,
        "percentageORmarks": percentageORmarks,
      };
}

class JobPreference {
  final bool? isExperienced;
  final String? jobTitle;
  final List<String>? teachingSubjects;
  final List<String>? teachingClasses;
  final bool? isPreferredLocation;
  final double? lat;
  final double? lng;
  final String? address;
  final String? desiredJobType;
  final int? minDesireSalary;
  final int? maxDesireSalary;
  final String? desireSalaryDuration;

  JobPreference({
    this.jobTitle,
    this.teachingSubjects,
    this.teachingClasses,
    this.isPreferredLocation,
    this.lat,
    this.lng,
    this.address,
    this.desiredJobType,
    this.minDesireSalary,
    this.maxDesireSalary,
    this.desireSalaryDuration,
    this.isExperienced
  });

  JobPreference copyWith({
    String? jobTitle,
    List<String>? teachingSubjects,
    List<String>? teachingClasses,
    bool? isPreferredLocation,
    double? lat,
    double? lng,
    String? address,
    String? desiredJobType,
    int? minDesireSalary,
    int? maxDesireSalary,
    String? desireSalaryDuration,
    bool? isExperienced
  }) =>
      JobPreference(
        jobTitle: jobTitle ?? this.jobTitle,
        teachingSubjects: teachingSubjects ?? this.teachingSubjects,
        teachingClasses: teachingClasses ?? this.teachingClasses,
        isPreferredLocation: isPreferredLocation ?? this.isPreferredLocation,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        address: address ?? this.address,
        desiredJobType: desiredJobType ?? this.desiredJobType,
        minDesireSalary: minDesireSalary ?? this.minDesireSalary,
        maxDesireSalary: maxDesireSalary ?? this.maxDesireSalary,
        desireSalaryDuration: desireSalaryDuration ?? this.desireSalaryDuration,
        isExperienced: isExperienced ?? this.isExperienced
      );

  factory JobPreference.fromJson(Map<String, dynamic> json) => JobPreference(
        jobTitle: json["jobTitle"],
        teachingSubjects: List<String>.from(json["teachingSubjects"].map((x) => x)),
        teachingClasses: List<String>.from(json["teachingClasses"].map((x) => x)),
        isPreferredLocation: json["isPreferredLocation"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        address: json["address"],
        desiredJobType: json["desiredJobType"],
        minDesireSalary: json["minDesireSalary"],
        maxDesireSalary: json["maxDesireSalary"],
        desireSalaryDuration: json["desireSalaryDuration"],
        isExperienced: json["isExperienced"]
      );

  Map<String, dynamic> toJson() => {
        "jobTitle": jobTitle,
        "teachingSubjects": List<String>.from(teachingSubjects?.map((x) => x) ?? []),
        "teachingClasses": List<String>.from(teachingClasses?.map((x) => x) ?? []),
        "isPreferredLocation": isPreferredLocation,
        "lat": lat,
        "lng": lng,
        "address": address,
        "desiredJobType": desiredJobType,
        "minDesireSalary": minDesireSalary,
        "maxDesireSalary": maxDesireSalary,
        "desireSalaryDuration": desireSalaryDuration,
        "isExperienced": isExperienced
      };
}

class LatestExperience {
  final bool? isExperienced;
  final String? experienceIn;
  final int? totalYearOfExperience;
  final String? latestJobTitle;
  final String? latestOrganization;
  final int? latestSalary;
  final String? latestSalaryDuration;
  final double? lat;
  final double? lng;
  final String? address;
  final DateTime? startDate;
  final bool? isPresentWorking;
  final DateTime? endDate;
  final String? noticePeriod;

  LatestExperience({
    this.isExperienced,
    this.experienceIn,
    this.totalYearOfExperience,
    this.latestJobTitle,
    this.latestOrganization,
    this.latestSalary,
    this.latestSalaryDuration,
    this.lat,
    this.lng,
    this.address,
    this.startDate,
    this.isPresentWorking,
    this.endDate,
    this.noticePeriod,
  });

  LatestExperience copyWith({
    bool? isExperienced,
    String? experienceIn,
    int? totalYearOfExperience,
    String? latestJobTitle,
    String? latestOrganization,
    int? latestSalary,
    String? latestSalaryDuration,
    double? lat,
    double? lng,
    String? address,
    DateTime? startDate,
    bool? isPresentWorking,
    DateTime? endDate,
    String? noticePeriod,
  }) =>
      LatestExperience(
        isExperienced: isExperienced ?? this.isExperienced,
        experienceIn: experienceIn ?? this.experienceIn,
        totalYearOfExperience: totalYearOfExperience ?? this.totalYearOfExperience,
        latestJobTitle: latestJobTitle ?? this.latestJobTitle,
        latestOrganization: latestOrganization ?? this.latestOrganization,
        latestSalary: latestSalary ?? this.latestSalary,
        latestSalaryDuration: latestSalaryDuration ?? this.latestSalaryDuration,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        address: address ?? this.address,
        startDate: startDate ?? this.startDate,
        isPresentWorking: isPresentWorking ?? this.isPresentWorking,
        endDate: endDate ?? this.endDate,
        noticePeriod: noticePeriod ?? this.noticePeriod,
      );

  factory LatestExperience.fromJson(Map<String, dynamic> json) => LatestExperience(
        isExperienced: json["isExperienced"],
        experienceIn: json["experienceIn"],
        totalYearOfExperience: json["totalYearOfExperience"],
        latestJobTitle: json["latestJobTitle"],
        latestOrganization: json["latestOrganization"],
        latestSalary: json["latestSalary"],
        latestSalaryDuration: json["latestSalaryDuration"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        address: json["address"],
        startDate: json["startDate"] != null ? DateTime.parse(json["startDate"]) : null,
        isPresentWorking: json["isPresentWorking"],
        endDate: json["endDate"] != null ? DateTime.parse(json["endDate"]) : null,
        noticePeriod: json["noticePeriod"],
      );

  Map<String, dynamic> toJson() => {
        "isExperienced": isExperienced,
        "experienceIn": experienceIn,
        "totalYearOfExperience": totalYearOfExperience,
        "latestJobTitle": latestJobTitle,
        "latestOrganization": latestOrganization,
        "latestSalary": latestSalary,
        "latestSalaryDuration": latestSalaryDuration,
        "lat": lat,
        "lng": lng,
        "address": address,
        "startDate": startDate?.toIso8601String(),
        "isPresentWorking": isPresentWorking,
        "endDate": endDate?.toIso8601String(),
        "noticePeriod": noticePeriod,
      };
}
