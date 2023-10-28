import 'dart:convert';
import 'package:http/http.dart' as http;

import '../core/helpers/local_storage_helper.dart';
import '../model/login.dart';

class CallApi {
  final String _url = 'https://apartment-mangement.azurewebsites.net/api';
  final String _imgUrl = 'gs://apartee-620a4.appspot.com';
  String token = "";

  getImage() {
    return _imgUrl;
  }

  //GET
  Future<dynamic> getArticleData(String apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        // Phân tích dữ liệu JSON và trả về kết quả
        return json.decode(response.body);
      } else {
        // Trả về 'failed' nếu có lỗi trong yêu cầu API
        return 'failed';
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      // Trả về 'failed' nếu có lỗi trong quá trình xử lý yêu cầu
      return 'failed';
    }
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
      return account.role;
    } else {
      // Login thất bại
      throw Exception(response.statusCode + message);
    }
  }
}
