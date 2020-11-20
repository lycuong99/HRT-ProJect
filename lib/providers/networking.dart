import 'dart:convert';
import 'package:http/http.dart' as http;

class NetWorkHelper {
  final String url;
  NetWorkHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }

  Future postData(dynamic body, Map<String, String> headers) async {
    http.Response response = await http.post(url, body: body, headers: headers);
    print('Code Response:${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
