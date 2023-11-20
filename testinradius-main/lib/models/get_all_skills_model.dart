class GetAllSkillsModel {
  List<AllSkills>? allSkills;

  GetAllSkillsModel({this.allSkills});

  GetAllSkillsModel.fromJson(Map<String, dynamic> json) {
    if (json['allSkills'] != null) {
      allSkills = <AllSkills>[];
      json['allSkills'].forEach((v) {
        allSkills!.add(new AllSkills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allSkills != null) {
      data['allSkills'] = this.allSkills!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllSkills {
  String? sId;
  String? skill;
  String? sTypename;

  AllSkills({this.sId, this.skill, this.sTypename});

  AllSkills.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    skill = json['skill'];
    sTypename = json['__typename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['skill'] = this.skill;
    data['__typename'] = this.sTypename;
    return data;
  }
}