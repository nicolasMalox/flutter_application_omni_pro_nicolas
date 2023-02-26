import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album.dart';

class AlbumService {
  Future<List<Album>> getListalbums() async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      dynamic rawData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return (rawData as List<dynamic>)
            .map((empresa) => Album.fromJson(empresa))
            .toList();
      } else {
        throw Exception('Error al leer la API');
      }
    } catch (e) {
      return throw Exception('Error al leer la API');
    }
  }
}
