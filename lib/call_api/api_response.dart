// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/book/book.dart';

class CallApi {
   static Future<List<Book>> getData() async {
    var url = Uri.parse("http://10.0.2.2/test_for_flutter/index.php");
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
  }




}