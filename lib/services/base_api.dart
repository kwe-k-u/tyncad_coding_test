// import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';


class Api extends BaseApi{


  Future<Response> createAccount({
    required String firstName,
    required String lastName,
    required String password,
    required String email,
    required String phoneNumber
  }) async{
    return POST(
        endpoint: "users/register/",
        body: {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "phone_number": phoneNumber,
          "password": password
        }

    );
  }

  Future<Response> login({required String email, required password}) async{
    return POST(endpoint: "users/login/",
      body: {
        "email": email,
        "password": password
      }
    );
  }

  Future<Response> getProfile(String token) async{
    return GET(endpoint: "users/me/", auth: token);
  }

  Future<Response> filterFeed({required String token, required String filter}) async {
    return GET(endpoint: "feeds/filter_my_feeds", auth: token, map: {"search_text" : filter});
  }

  Future<void> getFeedDetails({required String token, required String id}) async {
    GET(endpoint: "feeds/$id/", auth: token);
  }
}






class BaseApi{
  final String _baseUrl = dotenv.env['base_url']!;

  Future<Response> GET({required String endpoint, Map<String,String>? map, String? auth}) async {
    String url = map == null ? endpoint : endpoint + _genArgs(map);
    return get(Uri.parse(_baseUrl+endpoint),
      headers:  auth == null ? null :
      {"Authorisation" : auth},
    );
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
        headers: auth == null ? null : {"Authorisation" : auth},
        body: body
    );
  }
}
