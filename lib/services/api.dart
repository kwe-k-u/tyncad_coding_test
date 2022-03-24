// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:tyncad_test/models/feed.dart';
import 'package:tyncad_test/models/user.dart';


class Api extends BaseApi{


  Future<User?> createAccount({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
    required String phoneNumber
  }) async{
    User? user;
    Response response = await  POST(
        endpoint: "users/register/",
        body: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone_number": phoneNumber,
          "password": password
        }
    );


    if (response.statusCode == 200){
      user = User.fromJson(jsonDecode(response.body)["results"] as Map<String,dynamic>);
      // user = jsonDecode(response.body);
    }

    // print(response.body);
    return user;
  }

  Future<User?> login({required String email, required password}) async{
    User? user;
    Response response = await POST(endpoint: "users/login/",
      body: {
        "email": email,
        "password": password
      }
    );

    if (response.statusCode == 200){
      user = User.fromJson(jsonDecode(response.body)["results"] as Map<String,dynamic>);
    }


    return user;
  }

  Future<Map<String,dynamic>> getProfile(String token) async{
    Response response = await GET(endpoint: "users/me/", auth: token);
    Map<String,dynamic> map = jsonDecode(response.body)["results"];
    return map;

  }

  Future<List<Feed>> filterFeed({required String token, required String filter}) async {
    Response response = await POST(endpoint: "feeds/filter_my_feeds/", auth: token, body: {"search_text" : filter});
    List<Feed> feed = [];

    if (response.statusCode == 200){
      List<dynamic> _map = jsonDecode(response.body)["results"];
      feed = List.generate(_map.length, (index) => Feed.fromJson(_map[index]));
    }

    return feed;
  }

  Future<Feed> getFeedDetails({required String token, required int id}) async {
    Response response = await GET(endpoint: "feeds/$id/", auth: token);
    Feed feed = Feed.fromJson(jsonDecode(response.body));

    return feed;
  }
}






class BaseApi{
  final String _baseUrl = dotenv.env['BASE_URL']!;

  Future<Response> GET({required String endpoint, Map<String,String>? map, dynamic auth}) async {
    String url = map == null ? endpoint : endpoint + _genArgs(map);
    // print(url);
    // print(auth);
    var e = get(Uri.parse(_baseUrl + endpoint),
      headers: auth == null ? null : {HttpHeaders.authorizationHeader: "Token $auth"},
    );
    print((await e).body);
    return e;
  }

  String _genArgs (Map<String, String> map){
    String arg = "";

    //concatenate to get endpoint arguments
    map.forEach((key, value) {
      arg+= "&$key=$value";
    });


    arg = arg.substring(1); //removing first &


    return arg;
  }

  Future<Response> POST({required String endpoint, Map<String,dynamic>? body, String? auth}) async {
    return post(Uri.parse(_baseUrl+endpoint),
        headers: auth == null ? null : {HttpHeaders.authorizationHeader: "Token $auth"},
        body: body
    );
  }
}
