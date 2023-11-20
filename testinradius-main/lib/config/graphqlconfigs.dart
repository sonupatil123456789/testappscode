import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:test/utils/seassion_manager.dart';

class GraphqlConfig {
  Future<ValueNotifier<GraphQLClient>> getClient() async{

     SeassionManager userSeassion =  SeassionManager();
     dynamic cookie = await userSeassion.getAccessToken("accessToken");


    try {
      final HttpLink httpLink = HttpLink(
        "https://dev-api.inradius.in/graphql",
        defaultHeaders: {
           "cookie":cookie  ?? "",
        },
        httpClient: http.Client(),
      );

      final AuthLink authLink = AuthLink(
        
        getToken: () async {
          return null;
        },
      );

      final WebSocketLink webSocketLink = WebSocketLink("wss://dev-api.inradius.in/graphql");

      final Link link = authLink.concat(httpLink).concat(webSocketLink);

      ValueNotifier<GraphQLClient> _client = ValueNotifier(GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ));
      return _client;
    } on SocketException  catch (e) {
      if (kDebugMode) {
        print("Error : === $e ");
      }
      throw " no internet";
    }
  }
}
