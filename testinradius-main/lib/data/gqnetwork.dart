import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test/config/graphqlconfigs.dart';
import 'package:test/data/gqbase.dart';
import 'package:test/mvc/authantication/auth_screen/auth_scheema.dart';
import 'package:test/utils/listners_utils.dart';

class GqNetwork extends GqBase {
  GraphqlConfig _client = GraphqlConfig();
  GraphqlConfig get cliant => _client;

  late ValueNotifier<GraphQLClient> _getGraphData;

  @override
  getGraphApiRequest(scheemaQuery, fetchPolicy, data, context) async {
    if (kDebugMode) {
        print("Queries is :<<<<< $scheemaQuery >>>>");
  }
    try {
      _getGraphData =await  _client.getClient();
      QueryResult result = await _getGraphData.value.query(
        QueryOptions(
          document: gql(scheemaQuery),
          fetchPolicy: fetchPolicy,
        ),
      );
      if (result.hasException) {
        if (result.exception!.graphqlErrors.isEmpty) {
          ListnersUtils.showFlushbarMessage(
              "Please Try After Some Time ",
              Colors.redAccent,
              Colors.white,
              "No Internet Connection",
              Icons.error,
              context);
          if (kDebugMode) {
            print("No Internet Connection");
          }
        } else {
          ListnersUtils.showFlushbarMessage(
              result.exception!.graphqlErrors[0].message.toString(),
              Colors.redAccent,
              Colors.white,
              "Error",
              Icons.error,
              context);
          if (kDebugMode) {
            print("No Internet Connection");
          }
        }
      }

      if (result.data != null) {
        return result;
      }
    } catch (e) {
      if (kDebugMode) {
        print("ErrorHttp : === $e ");
      }
    }
  }

  @override
  postGraphApiRequest(scheemaQuery, fetchPolicy, mutation, context) async {
  if (kDebugMode) {
        print("Queries is :<<<<< $scheemaQuery >>>>");
  }
    try {
      _getGraphData = await _client.getClient();
      QueryResult result = await _getGraphData.value.mutate(
          MutationOptions(document: gql(scheemaQuery), variables: mutation));

      if (result.hasException) {
        if (result.exception!.graphqlErrors.isEmpty) {
          ListnersUtils.showFlushbarMessage(
              "Please Try After Some Time ",
              Colors.redAccent,
              Colors.white,
              "No Internet Connection",
              Icons.error,
              context);
          if (kDebugMode) {
            print("No Internet Connection ${result.exception}");
          }
        } else {
          ListnersUtils.showFlushbarMessage(
              result.exception!.graphqlErrors[0].message.toString(),
              Colors.redAccent,
              Colors.white,
              "Error",
              Icons.error,
              context);
          if (kDebugMode) {
            print(result.exception!.graphqlErrors[0].message.toString());
          }
        }
      }

      if (result.data != null) {
        return result;
      }
    } catch (e) {
      if (kDebugMode) {
        print("ErrorHttp : === $e ");
      }
    }
  }
}



    //                 String cookie = result.context
    //                     .entry<HttpLinkResponseContext>()
    //                     ?.headers?['Via']
    //                     .toString() ??
    //                 "";


    //  print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww${cookie}");