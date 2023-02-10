import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class RemoteServices {
  static var client = http.Client();

  Future<http.Response> getRequest(
      String path, String token, bool isAuth ,Map<String, String>? qParams ) async {

    qParams ??= <String, String>{};

    // var uri = Uri(
    //   scheme: 'https',
    //   host: ApiConstants.Url,
    //   path: path,
    //   fragment: 'baz',
    //   queryParameters: qParams,
    // );

    var response = await RemoteServices.client
        .get(Uri.parse("https://fluxstore.spinnertechltd.com/api$path"),
        // headers: {
        // "Content-Type": "application/json",
        // }
        );

    debugPrint(response.body.toString());



    return response;
  }

  Future<http.Response> putRequest(
      String path, String body, bool isAuth) async {
  //  var token = "";


    //  var token =  await Helper.getUserData(Constants.TOKEN);



    var response = await RemoteServices.client
        .post(Uri.parse('https://fluxstore.spinnertechltd.com/api$path'),
        body: body);

    print(response.headers.toString());


    return response;
  }

}
