class GetAllSubDepartmentModel {
  List<AllSubDomains>? allSubDomains;

  GetAllSubDepartmentModel({this.allSubDomains});

  GetAllSubDepartmentModel.fromJson(Map<String, dynamic> json) {
    if (json['allSubDomains'] != null) {
      allSubDomains = <AllSubDomains>[];
      json['allSubDomains'].forEach((v) {
        allSubDomains!.add(new AllSubDomains.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allSubDomains != null) {
      data['allSubDomains'] =
          this.allSubDomains!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSubDomains {
  String? sId;
  String? subDomain;
  Domain? domain;
  String? sTypename;

  AllSubDomains({this.sId, this.subDomain, this.domain, this.sTypename});

  AllSubDomains.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subDomain = json['subDomain'];
    domain =
        json['domain'] != null ? new Domain.fromJson(json['domain']) : null;
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['subDomain'] = this.subDomain;
    if (this.domain != null) {
      data['domain'] = this.domain!.toJson();
    }
    data['__typename'] = this.sTypename;
    return data;
  }
}

class Domain {
  String? sId;
  String? domain;
  String? sTypename;

  Domain({this.sId, this.domain, this.sTypename});

  Domain.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    domain = json['domain'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['domain'] = this.domain;
    data['__typename'] = this.sTypename;
    return data;
  }
}