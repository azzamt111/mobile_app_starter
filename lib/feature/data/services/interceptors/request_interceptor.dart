import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

class RequestInterceptor implements Interceptor {
  
  RequestInterceptor();
  
  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) async {
    final request = applyHeader(chain.request, 'auth_token', 'Bearer no token');
    debugPrint("from RequestInterceptor: ${request.toString()}");
    return chain.proceed(request);
  }
}