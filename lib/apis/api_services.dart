import 'dart:convert';
import 'package:flutter_demo_02/model/apartment.dart';
import 'package:flutter_demo_02/model/request.dart';
import 'package:http/http.dart' as http;

import '../components/get_list_response.dart';
import '../components/raise_request.dart';
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
    LocalStorageHelper.setValue("token", token);
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

    final token = LocalStorageHelper.getValue("token");
    if (token == null) {
      throw Exception("Token not available");
    }

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
      if (response.statusCode == 401) {
        throw Exception("Unauthorized"); // Token hết hạn hoặc không hợp lệ
      } else if (response.statusCode == 500) {
        throw Exception("Server error");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }

  //GET: /api/package/:id
  //get package by id
  Future<Package> getPackage(int id) async {
    var url = Uri.parse('$_url/package/$id');

    final token = LocalStorageHelper.getValue("token");
    if (token == null) {
      throw Exception("Token not available");
    }
    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Package package = Package.fromJson(jsonResponse);
      return package;
    } else {
      // Xử lý lỗi HTTP cụ thể, ví dụ:
      if (response.statusCode == 401) {
        throw Exception("Unauthorized"); // Token hết hạn hoặc không hợp lệ
      } else if (response.statusCode == 500) {
        throw Exception("Server error");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }

  //GET: ../request/staff/:id
  //get all request of staff by staffId
  Future<List<Request>> getStaffRequest(int staffid, int page) async {
    var url = Uri.parse('$_url/request/staffs/$staffid');
    var queryParameters = {
      'page': '$page',
      'pageSize': '10',
      'sortOrder': 'desc'
    };

    url = url.replace(queryParameters: queryParameters);
    final token = LocalStorageHelper.getValue("token");
    if (token == null) {
      throw Exception("Token not available");
    }

    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      final List<dynamic> request = jsonResponse["data"];
      final List<Request> requestList =
          request.map((e) => Request.fromJson(e)).toList();
      // final int totalPage = jsonResponse["totalPage"] ?? 1;
      // GetListResponse getResponse = GetListResponse(requestList, totalPage);
      return requestList;
    } else {
      // Xử lý lỗi HTTP cụ thể, ví dụ:
      if (response.statusCode == 401) {
        throw Exception("Unauthorized"); // Token hết hạn hoặc không hợp lệ
      } else if (response.statusCode == 500) {
        throw Exception("Server error");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }

  //GET: ../requests/owners/:ownerId
  //get all request of owner by ownerId
  Future<List<Request>> getOwnerRequest(int ownerId) async {
    var url = Uri.parse('$_url/requests/owners/$ownerId');

    final token = LocalStorageHelper.getValue("token");
    if (token == null) {
      throw Exception("Token not available");
    }

    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      final List<dynamic> request = jsonResponse["data"];
      final List<Request> requestList =
          request.map((e) => Request.fromJson(e)).toList();
      // final int totalPage = jsonResponse["totalPage"] ?? 1;
      // GetListResponse getResponse = GetListResponse(requestList, totalPage);
      return requestList;
    } else {
      // Xử lý lỗi HTTP cụ thể, ví dụ:
      if (response.statusCode == 401) {
        throw Exception("Unauthorized"); // Token hết hạn hoặc không hợp lệ
      } else if (response.statusCode == 500) {
        throw Exception("Server error");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }

  //Get: ../owner/:ownerId
  Future<List<Apartment>> getApartmentList(int accId) async {
    var url =
        Uri.parse('https://apartment-mangement.azurewebsites.net/owner/$accId');

    final token = LocalStorageHelper.getValue("token");
    if (token == null) {
      throw Exception("Token not available");
    }

    http.Response response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      final List<dynamic> apartment = jsonResponse["data"];
      final List<Apartment> apartmentList =
          apartment.map((e) => Apartment.fromJson(e)).toList();
      return apartmentList;
    } else {
      // Xử lý lỗi HTTP cụ thể, ví dụ:
      if (response.statusCode == 401) {
        throw Exception("Unauthorized"); // Token hết hạn hoặc không hợp lệ
      } else if (response.statusCode == 500) {
        throw Exception("Server error");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }

  //POST: ../request
  Future<dynamic> raiseNewRequest(RaiseRequest request) async {
    final url = Uri.parse('$_url/requests');
    final body = jsonEncode(request.toJson());

    final token = LocalStorageHelper.getValue("token");
    if (token == null) {
      throw Exception("Token not available");
    }

    final response = await http.post(
      url,
      body: body,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final data = jsonResponse["data"];
      // final Request request = Request.fromJson(data);
      return data; // Trả về dữ liệu từ phản hồi
    } else {
      // Xử lý lỗi HTTP cụ thể, ví dụ:
      if (response.statusCode == 401) {
        throw Exception("Unauthorized"); // Token hết hạn hoặc không hợp lệ
      } else if (response.statusCode == 500) {
        throw Exception("Server error");
      } else {
        throw Exception("Something went wrong");
      }
    }
  }
}
