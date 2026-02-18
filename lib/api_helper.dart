import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper{
  getData() async {
    var uri = Uri.parse("https://dummyjson.com/users");
    var response = await http.get(uri);

    Map data = jsonDecode(response.body);
    return data["users"];
  }
}