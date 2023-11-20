class GetAllQualificationsModel {
  List<AllQualifications>? allQualifications;

  GetAllQualificationsModel({this.allQualifications});

  GetAllQualificationsModel.fromJson(Map<String, dynamic> json) {
    if (json['allQualifications'] != null) {
      allQualifications = <AllQualifications>[];
      json['allQualifications'].forEach((v) {
        allQualifications!.add(new AllQualifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allQualifications != null) {
      data['allQualifications'] =
          this.allQualifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllQualifications {
  String? sId;
  String? qualification;

  AllQualifications({this.sId, this.qualification});

  AllQualifications.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    qualification = json['qualification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['qualification'] = this.qualification;
    return data;
  }
}