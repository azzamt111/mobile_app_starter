import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

class ResponseInterceptor implements Interceptor {
  ResponseInterceptor();
  
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    final response = await chain.proceed(chain.request);
    debugPrint("from ResponseInterceptor: ${response.toString()}");
    return response;
  }
}