import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  final baseUrlApi = "https://api.themoviedb.org/3/movie/";
  final apiKey = "0a35960ce3cef209656656677c893e0f";

  Future<List> getMoviesList(page) async {
    final response = await http.get(
      Uri.parse('${baseUrlApi}upcoming?api_key=$apiKey&page=$page'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print(Uri.parse('${baseUrlApi}upcoming?api_key=$apiKey&page=$page'));

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return [true, jsonDecode(response.body)];
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      return [false, jsonDecode(response.body)];
    }
  }
}
