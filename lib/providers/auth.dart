import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:scm_app/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session/flutter_session.dart';

import 'package:scm_app/utils/http_exception.dart';

class Auth with ChangeNotifier {
  var MainUrl = Api.authUrl;

  Future<void> Authentication(String email, String password) async {
    try {
      final url = '${MainUrl}/login';
      final form = new Map<String, dynamic>();
      form['email'] = email;
      form['password'] = password;

      final response = await http.post(
        Uri.parse('${url}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      final responseData = json.decode(response.body);
      print(responseData);
      if (response.statusCode != 200) {
        throw HttpException('Akun Tidak Ditemukan');
      } else {
        await FlutterSession().set("token", responseData['acccess_token']);
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> login(String email, String password) {
    return Authentication(email, password);
  }
}
