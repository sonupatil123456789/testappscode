class GetAllDepartmentModel {
  List<AllDomains>? allDomains;

  GetAllDepartmentModel({this.allDomains});

  GetAllDepartmentModel.fromJson(Map<String, dynamic> json) {
    if (json['allDomains'] != null) {
      allDomains = <AllDomains>[];
      json['allDomains'].forEach((v) {
        allDomains!.add(new AllDomains.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allDomains != null) {
      data['allDomains'] = this.allDomains!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllDomains {
  String? sId;
  String? domain;
  String? sTypename;

  AllDomains({this.sId, this.domain, this.sTypename});

  AllDomains.fromJson(Map<String, dynamic> json) {
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