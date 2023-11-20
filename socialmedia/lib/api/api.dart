import 'dart:convert';

import 'package:http/http.dart' as http;

class getVideo {
  dynamic response;
  // String Url;
  dynamic mapresponse;
  List videolistdata = [];

  // getVideo();

  Future getallvideoes(url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        mapresponse = jsonDecode(response.body);
        videolistdata = mapresponse["posts"];
        // print(videolistdata);
        return videolistdata;
      } else {
        mapresponse = jsonDecode(response.body);
        // print(mapresponse);
        return mapresponse;
      }
      // return videolistdata;
    } catch (e) {
      print(e);
    }
  }
}
