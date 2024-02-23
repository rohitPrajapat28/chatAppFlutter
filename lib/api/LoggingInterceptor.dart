import 'dart:developer';

import 'package:dartuif/screens/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';



import '../main.dart';
import '../utils/Constants.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
  //  print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode == 401) {
      if(NavigationService.navigatorKey.currentContext!=null) {
        access_token="";
        // PreferenceManager.clearSharedPref();
        // AppDelegate().reset();
        Navigator.pushAndRemoveUntil<dynamic>(
          NavigationService.navigatorKey.currentContext!,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const LoginPage(),
          ),
              (route) => false,
        );
      }
     // showToast("Token Expired!");
    }
    if (kDebugMode) {
      log(data.toString());
    }
    return data;
  }



}