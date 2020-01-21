import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:http/http.dart' as http;


class APIs{

  final String accessToken;
  final String scope;
  final String tokenType;
  final String refreshToken;
  final int expirationTime;

  //何これ？
  APIs({this.accessToken, this.scope, this.tokenType, this.refreshToken, this.expirationTime});

  // ?factory
  factory APIs.formJson(Map<String, dynamic> json) {
    return APIs(
      accessToken: json['access_token'],
      expirationTime: json['expires_in'],
      refreshToken: json['refresh_token']
    );
}






}