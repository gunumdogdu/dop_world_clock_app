import 'dart:convert';

import 'package:http/http.dart' as http;

class TimeController {
  Future<Map<String, dynamic>> getTime(String timezone) async {
    String url = 'http://worldtimeapi.org/api/timezone/$timezone';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load time');
    }
  }
}

void main() {
  TimeController().getTime('Europe/Berlin').then((result) {
    print(result);
  }).catchError((error) {
    print(error);
  });
}
