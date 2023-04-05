import 'package:http/http.dart' as http;

Future<http.Response?> generalGet({required String url}) async {
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return response;
  } else {
    return null;
  }
}

