import 'dart:convert';
import 'package:http/http.dart' as http;

import '../components/get_list_response.dart';
import '../core/helpers/local_storage_helper.dart';
import '../model/login.dart';
import '../model/package.dart';

class CallApi {
  final String _url = 'https://apartment-mangement.azurewebsites.net/api';
  final String _imgUrl = 'gs://apartee-620a4.appspot.com';
  String token = "";

  getImage() {
    return _imgUrl;
  }

  //LOGIN
  Future<String> login(String email, String password) async {
    LoginRequest request = LoginRequest(email: email, password: password);

    var url = Uri.parse('$_url/authentication/login');
    var body = jsonEncode(request.toJson());

    http.Response response = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});

    final responseBody = jsonDecode(response.body);
    final data = responseBody["data"];
    final message = responseBody["message"];
    token = responseBody["token"];
    LoginResponse account = LoginResponse.fromJson(data);

    if (response.statusCode == 200) {
      // Login thành công
      LoginAccount.saveLoginAccount(account);
      LocalStorageHelper.setValue("account", data);
      return account.role;
    } else {
      // Login thất bại
      throw Exception(response.statusCode + message);
    }
  }

  //LOGOUT
  Future<void> logout() async {
    try {
      var url = Uri.parse('$_url/authentication/logout');
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
      );

      if (response.statusCode == 200) {
        token = "";
        LoginAccount.clearLoginAccount();
      } else {
        throw 'Logout failed with status: ${response.statusCode}';
      }
    } catch (error) {
      throw Exception("Something wrong try again!");
    }
  }

  //GET: ../package
  //get all packages
  Future<GetListResponse> getPackages(int page) async {
    var url = Uri.parse('$_url/package');
    url = url.replace(queryParameters: {'page': '$page'});

    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      final List<dynamic> package = jsonResponse["data"];
      final List<Package> packageList =
          package.map((e) => Package.fromJson(e)).toList();
      final int totalPage = jsonResponse["totalPage"];
      GetListResponse getResponse = GetListResponse(packageList, totalPage);
      return getResponse;
    } else {
      throw Exception("Something wrong!");
    }
  }
}
