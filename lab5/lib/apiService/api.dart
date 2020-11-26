import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:lab5/model/model.dart';
// import 'package:flutter/material.dart';

Future<List<Model>> fetchModel(http.Client client) async {
  final response = 
      await client.get('https://velmm.com/apis/volley_array.json');
    return compute(parseModel,response.body);
}

List<Model> parseModel(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Model>((json) => Model.fromJson(json)).toList();
}