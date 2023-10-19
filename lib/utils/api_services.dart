import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'http://localhost:5159/api/';
  final String _imgUrl = 'http://localhost:5159/uploads/';

  getImage() {
    return _imgUrl;
  }

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
      print(e);
      // Trả về 'failed' nếu có lỗi trong quá trình xử lý yêu cầu
      return 'failed';
    }
  }
}
