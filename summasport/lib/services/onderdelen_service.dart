import 'dart:convert';
import 'package:summasport/models/oefeningen.dart';
import 'package:summasport/models/onderdelen.dart';
import 'package:http/http.dart' as http;

class OnderdelenService {
  Future<List<Onderdelen>> getAll() async {
    final response =
    await http.get(Uri.parse('http://127.0.0.1:8000/api/exercise'));
    final List<dynamic> jsoncomponents = jsonDecode(response.body);

    List<Onderdelen> onderdelen =
    jsoncomponents.map((jsonOnderdelen) => Onderdelen.fromJson(jsonOnderdelen)).toList();

    if (response.statusCode != 200) {
      throw Exception(
          'Fout bij het ophalen van alle components (${response.statusCode}).');
    }

    return onderdelen;
  }

  Future<List<Onderdelen>> getAllWithOefeningen() async {
    List<Onderdelen> onderdelen = [];

    final response =
    await http.get(Uri.parse('https://flutapi.summaict.nl/api/components'));
    if (response.statusCode != 200) {
      throw Exception(
          'Fout bij het ophalen van alle components (${response.statusCode}).');
    }

    final List<dynamic> jsononderdelen = jsonDecode(response.body);

    for (int i = 0; i < jsononderdelen.length; i++) {
      Map<String, dynamic> jsonOnderdelen = jsononderdelen[i];

      final onderdeel = Onderdelen(
        id: jsonOnderdelen['id'],
        name: jsonOnderdelen['naam'],
        oefeningen: [],
      );

      List<dynamic> jsonoefeningen = jsonOnderdelen['oefeningen'];
      for (int j = 0; j < jsonoefeningen.length; j++) {
        Map<String, dynamic> jsonOefeningen = jsonoefeningen[j];

        onderdeel.oefeningen!.add(
          Oefeningen(
            id: jsonOefeningen['id'],
            name: jsonOefeningen['naam'],
            description: jsonOefeningen['description'],
          ),
        );
      }

      onderdelen.add(onderdeel);
    }
    return onderdelen;
  }

  Future<Onderdelen> post(Onderdelen onderdeel) async {
    final response =
    await http.post(Uri.parse('http://127.0.0.1:8000/api/exercise'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'naam': onderdeel.name,
        }));

    if (response.statusCode != 201) {
      throw Exception('Het is niet gelukt om de onderdelen toe te voegen');
    }

    final result = jsonDecode(response.body);
    return Onderdelen(id: result['id'], name: result['naam']);
  }

  Future<Onderdelen> put(int id, Onderdelen onderdeel) async {
    final response =
    await http.put(Uri.parse('http://127.0.0.1:8000/api/exercise/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': onderdeel.id,
          'naam': onderdeel.name,
        }));

    if (response.statusCode != 200) {
      throw Exception('Het is niet gelukt om de onderdelen te wijzigen');
    }

    final result = jsonDecode(response.body);
    return Onderdelen(id: result['id'], name: result['naam']);
  }

  Future<bool> delete(int componentsId) async {
    final response = await http
        .delete(Uri.parse('http://127.0.0.1:8000/api/exercise/$componentsId'));

    return response.statusCode == 200;
  }
}
