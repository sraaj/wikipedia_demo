import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wikipedia_demo_app/utils/ui_utils/show_toast.dart';

Future<Dio> getDio(BuildContext context, {isLoaderRequired = true}) async {
  var dio = new Dio();

  OverlayEntry loading = OverlayEntry(
      builder: (context) => AbsorbPointer(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                  child: SizedBox(child: new CircularProgressIndicator())),
            ),
          ));
  if (isLoaderRequired) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Overlay.of(context).insert(loading));
  }

  dio.options.connectTimeout = 100 * 1000;
  dio.options.receiveTimeout = 100 * 1000;

  String baseUrl = 'https://yourteacher.herokuapp.com/';
  dio.options.baseUrl = baseUrl;

  Map<String, dynamic> map = {
    'Content-Type': "application/json;charset=UTF-8",
  };
  dio.options.contentType = Headers.formUrlEncodedContentType;
  dio.options.headers = map;

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (RequestOptions options) {
      debugPrint("Request-------> " + options.data.toString());
      //  options.headers = map;

      // Do something before request is sent
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    },
    onResponse: (Response response) {
      debugPrint("Response-------> " + response.data.toString());
      if (isLoaderRequired) {
        if (loading != null) {
          loading.remove();
        }
      }
      return response; // continue
    },
    onError: (DioError e) {
      //debugPrint('e============'+e.toString());
      String errorMessage = 'Request cannot be processed';
      if (isLoaderRequired) {
        if (loading != null) {
          loading.remove();
        }
      }
      if (e.response != null &&
          e.response.statusCode != null &&
          e.response.statusCode == 401) {
        if (e.request.headers.containsKey('x-auth-token')) {
          ShowToast.showToast(context, '401 error');
        }
      } else {
        debugPrint('something is wrong--' + e.response.toString());
      }
      if (e.response != null) {
        if (e.response.statusCode == 401 &&
            e.response.data != "" &&
            e.response.data['message'] != null) {
          errorMessage = e.response.data['message'];
          ShowToast.showToast(context, 'Invalid Credentials');
        }
        if (e.response.statusCode == 500 &&
            e.response.data != "" &&
            e.response.data['message'] != null) {
          errorMessage = e.response.data['message'];
          ShowToast.showToast(context, '500 error');
        }
        if (e.response.statusCode == 400 &&
            e.response.data != "" &&
            e.response.data['message'] != null) {
          errorMessage = e.response.data['message'];
          ShowToast.showToast(context, '400 error');
        }
      }

      debugPrint("Alert Message-------> " + errorMessage);
      // Do something with response error
      return e; //continue
    },
  ));
  //Commented for ism
  dio.interceptors.add(LogInterceptor());

  return dio;
}
