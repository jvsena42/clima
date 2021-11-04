import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {

  final Uri url;

  NetworkHelper(this.url);

  Future getData() async {

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      print(response.statusCode);
    }
  }
}