import 'package:app_tv/services/infor/infor.service.dart';
import 'package:app_tv/utils/exception.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InforRepositories {
  Future<bool> resetPass(Map<String, dynamic> params) async {
    final response = await InforService.resetPass(params);
    print(response);
    if (response.statusCode == 200 && response.data["message"] == "Thành công") {
      Fluttertoast.showToast(
        msg: "Thành công",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return (response.statusCode == 200 && response.data["message"] == "Thành công" ) ? true : throw NetworkException;
  }
}