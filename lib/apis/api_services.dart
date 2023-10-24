import 'dart:convert';

import 'package:flutter_demo_02/apis/api_doing.dart';
import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'http://10.0.2.2:5159/api/';
  final String _imgUrl = 'http://10.0.2.2:5159/uploads/';

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

    var url = Uri.parse(ApiEndpoint.LOGIN);
    var body = jsonEncode(request.toJson());

    http.Response response = await http
        .post(url, body: body, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      // Login thành công
      return 'success';
    } else {
      // Login thất bại
      return 'error';
    }
  }
}
