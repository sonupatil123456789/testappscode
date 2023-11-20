class GetAllJobIndustryModel {
  List<AllIndustries>? allIndustries;

  GetAllJobIndustryModel({this.allIndustries});

  GetAllJobIndustryModel.fromJson(Map<String, dynamic> json) {
    if (json['allIndustries'] != null) {
      allIndustries = <AllIndustries>[];
      json['allIndustries'].forEach((v) {
        allIndustries!.add(new AllIndustries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allIndustries != null) {
      data['allIndustries'] =
          this.allIndustries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllIndustries {
  String? sId;
  String? industry;
  String? desc;

  AllIndustries({this.sId, this.industry, this.desc});

  AllIndustries.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    industry = json['industry'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['industry'] = this.industry;
    data['desc'] = this.desc;
    return data;
  }
}