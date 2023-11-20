class UserFlowModel {
  UserPrifferences? userPrifferences;

  UserFlowModel({this.userPrifferences});

  UserFlowModel.fromJson(Map<String, dynamic> json) {
    userPrifferences = json['userPrifferences'] != null
        ? new UserPrifferences.fromJson(json['userPrifferences'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (userPrifferences != null) {
      data['userPrifferences'] = userPrifferences!.toJson();
    }
    return data;
  }
}

class UserPrifferences {
  bool? openToRelocate;
  PrifferedCity? prifferedCity;
  JobRadiusLocation? jobRadiusLocation;
  List<YourThreeQualifacation>? yourThreeQualifacation;
  PrifferedJobIndustry? prifferedJobIndustry;
  PrifferedDepartment? prifferedDepartment;
  List<PrifferedSubdepartment>? prifferedSubdepartment;
  List<PrifferedFiveSkills>? prifferedFiveSkills;
  YourExperince? yourExperince;
  Prifferedsallery? prifferedsallery;
  JoiningStatus? joiningStatus;
  String? coverLetter;

  UserPrifferences(
      {
      this.openToRelocate,
      this.prifferedCity,
      this.jobRadiusLocation,
      this.yourThreeQualifacation,
      this.prifferedJobIndustry,
      this.prifferedDepartment,
      this.prifferedSubdepartment,
      this.prifferedFiveSkills,
      this.yourExperince,
      this.prifferedsallery,
      this.joiningStatus,
      this.coverLetter});

  UserPrifferences.fromJson(Map<String, dynamic> json) {
    openToRelocate = json['openToRelocate'];
    prifferedCity = json['prifferedCity'] != null
        ? PrifferedCity.fromJson(json['prifferedCity'])
        : null;
    jobRadiusLocation = json['jobRadiusLocation'] != null
        ? JobRadiusLocation.fromJson(json['jobRadiusLocation'])
        : null;
    if (json['yourThreeQualifacation'] != null) {
      yourThreeQualifacation = <YourThreeQualifacation>[];
      json['yourThreeQualifacation'].forEach((v) {
        yourThreeQualifacation!.add(YourThreeQualifacation.fromJson(v));
      });
    }
    prifferedJobIndustry = json['prifferedJobIndustry'] != null
        ? new PrifferedJobIndustry.fromJson(json['prifferedJobIndustry'])
        : null;
    prifferedDepartment = json['prifferedDepartment'] != null
        ? new PrifferedDepartment.fromJson(json['prifferedDepartment'])
        : null;
    if (json['prifferedSubdepartment'] != null) {
      prifferedSubdepartment = <PrifferedSubdepartment>[];
      json['prifferedSubdepartment'].forEach((v) {
        prifferedSubdepartment!.add(new PrifferedSubdepartment.fromJson(v));
      });
    }
    if (json['PrifferedFiveSkills'] != null) {
      prifferedFiveSkills = <PrifferedFiveSkills>[];
      json['PrifferedFiveSkills'].forEach((v) {
        prifferedFiveSkills!.add(new PrifferedFiveSkills.fromJson(v));
      });
    }
    yourExperince = json['yourExperince'] != null
        ? new YourExperince.fromJson(json['yourExperince'])
        : null;
    prifferedsallery = json['prifferedsallery'] != null
        ? new Prifferedsallery.fromJson(json['prifferedsallery'])
        : null;
    joiningStatus = json['joiningStatus'] != null
        ? new JoiningStatus.fromJson(json['joiningStatus'])
        : null;
    coverLetter = json['CoverLetter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['openToRelocate'] = openToRelocate;
    if (prifferedCity != null) {
      data['prifferedCity'] = prifferedCity!.toJson();
    }
    if (jobRadiusLocation != null) {
      data['jobRadiusLocation'] = jobRadiusLocation!.toJson();
    }
    if (yourThreeQualifacation != null) {
      data['yourThreeQualifacation'] =
          yourThreeQualifacation!.map((v) => v.toJson()).toList();
    }
    if (prifferedJobIndustry != null) {
      data['prifferedJobIndustry'] = prifferedJobIndustry!.toJson();
    }
    if (prifferedDepartment != null) {
      data['prifferedDepartment'] = prifferedDepartment!.toJson();
    }
    if (prifferedSubdepartment != null) {
      data['prifferedSubdepartment'] =
          prifferedSubdepartment!.map((v) => v.toJson()).toList();
    }
    if (prifferedFiveSkills != null) {
      data['PrifferedFiveSkills'] =
          prifferedFiveSkills!.map((v) => v.toJson()).toList();
    }
    if (yourExperince != null) {
      data['yourExperince'] = yourExperince!.toJson();
    }
    if (prifferedsallery != null) {
      data['prifferedsallery'] = prifferedsallery!.toJson();
    }
    if (joiningStatus != null) {
      data['joiningStatus'] = joiningStatus!.toJson();
    }
    data['CoverLetter'] = coverLetter;
    return data;
  }
}

class PrifferedCity {
  int? id;
  String? cityName;

  PrifferedCity({this.id, this.cityName});

  PrifferedCity.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = id;
    data['cityName'] = cityName;
    return data;
  }
}

class JobRadiusLocation {
  int? latitude;
  int? longitude;
  num? radious;

  JobRadiusLocation({this.latitude, this.longitude, this.radious});

  JobRadiusLocation.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    radious = json['radious'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['radious'] = radious;
    return data;
  }
}

class YourThreeQualifacation {
  int? qualifacationId;
  String? qualifacatioName;

  YourThreeQualifacation({this.qualifacationId, this.qualifacatioName});

  YourThreeQualifacation.fromJson(Map<String, dynamic> json) {
    qualifacationId = json['qualifacationId'];
    qualifacatioName = json['qualifacatioName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qualifacationId'] = qualifacationId;
    data['qualifacatioName'] = qualifacatioName;
    return data;
  }
}

class PrifferedJobIndustry {
  int? industryId;
  String? industryName;

  PrifferedJobIndustry({this.industryId, this.industryName});

  PrifferedJobIndustry.fromJson(Map<String, dynamic> json) {
    industryId = json['industryId'];
    industryName = json['industryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['industryId'] = industryId;
    data['industryName'] = industryName;
    return data;
  }
}

class PrifferedDepartment {
  int? departmentId;
  String? departmentName;

  PrifferedDepartment({this.departmentId, this.departmentName});

  PrifferedDepartment.fromJson(Map<String, dynamic> json) {
    departmentId = json['departmentId'];
    departmentName = json['departmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['departmentId'] = departmentId;
    data['departmentName'] = departmentName;
    return data;
  }
}

class PrifferedSubdepartment {
  int? subDepartmentId;
  String? subDepartmentName;

  PrifferedSubdepartment({this.subDepartmentId, this.subDepartmentName});

  PrifferedSubdepartment.fromJson(Map<String, dynamic> json) {
    subDepartmentId = json['subDepartmentId'];
    subDepartmentName = json['subDepartmentName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subDepartmentId'] = subDepartmentId;
    data['subDepartmentName'] = subDepartmentName;
    return data;
  }
}

class PrifferedFiveSkills {
  int? skillId;
  String? skillName;

  PrifferedFiveSkills({this.skillId, this.skillName});

  PrifferedFiveSkills.fromJson(Map<String, dynamic> json) {
    skillId = json['skillId'];
    skillName = json['skillName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skillId'] = skillId;
    data['skillName'] = skillName;
    return data;
  }
}

class YourExperince {
  bool? fresher;
  int? year;
  int? month;

  YourExperince({this.fresher, this.year, this.month});

  YourExperince.fromJson(Map<String, dynamic> json) {
    fresher = json['fresher'];
    year = json['year'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fresher'] = fresher;
    data['year'] = year;
    data['month'] = month;
    return data;
  }
}

class Prifferedsallery {
  int? currentCtc;
  int? expectedCtc;

  Prifferedsallery({this.currentCtc, this.expectedCtc});

  Prifferedsallery.fromJson(Map<String, dynamic> json) {
    currentCtc = json['currentCtc'];
    expectedCtc = json['ExpectedCtc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentCtc'] = currentCtc;
    data['ExpectedCtc'] = expectedCtc;
    return data;
  }
}

class JoiningStatus {
  String? status;
  int? workingDays;
  String? lastWorkingDate;

  JoiningStatus({this.status, this.workingDays, this.lastWorkingDate});

  JoiningStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    workingDays = json['workingDays'];
    lastWorkingDate = json['lastWorkingDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['workingDays'] = workingDays;
    data['lastWorkingDate'] = lastWorkingDate;
    return data;
  }
}




