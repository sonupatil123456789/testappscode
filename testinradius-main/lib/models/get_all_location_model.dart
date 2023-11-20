class GetAllLocationModel {
  List<AllLocations>? allLocations;

  GetAllLocationModel({this.allLocations});

  GetAllLocationModel.fromJson(Map<String, dynamic> json) {
    if (json['allLocations'] != null) {
      allLocations = <AllLocations>[];
      json['allLocations'].forEach((v) {
        allLocations!.add(new AllLocations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allLocations != null) {
      data['allLocations'] = this.allLocations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllLocations {
  String? sId;
  String? location;

  AllLocations({this.sId, this.location});

  AllLocations.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['location'] = this.location;
    return data;
  }
}