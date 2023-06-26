import 'dart:convert';
import 'package:summasport/models/oefeningen.dart';
import 'package:summasport/models/onderdelen.dart';
import 'package:http/http.dart' as http;

class OefeningenService {

  Future<List<Oefeningen>> getAll() async {
    List<Oefeningen> oefeningen = [];

    final response =
    await http.get(Uri.parse('http://127.0.0.1:8000/api/exercise'));
    if (response.statusCode != 200) {
      throw Exception(
          'Fout bij het ophalen van alle oefeningen (${response.statusCode}).');
    }

    final List<dynamic> data = jsonDecode(response.body);

    for (int i = 0; i < data.length; i++) {
      final oefeningen = Oefeningen(
          id: data[i]['id'],
          name: data[i]['name'],
          description: data[i]['description'],
          onderdelen: []);

      final List<dynamic> onderdelen = data[i]['Onderdelen'];
      for (int j = 0; j < onderdelen.length; j++) {
        final onderdeel = Onderdelen(
            id: onderdelen[j]['id'], name: onderdelen[j]['name'], oefeningen: []);
        oefeningen.onderdelen!.add(onderdeel);
      }
      //oefeningen.add(oefeningen);
    }

    return oefeningen;
  }

  Future<Oefeningen> post(Oefeningen oefeningen) async {
    final response =
    await http.post(Uri.parse('http://127.0.0.1:8000/api/exercise'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'naam': oefeningen.name,
          'description': oefeningen.description,
        }));

    if (response.statusCode != 201) {
      throw Exception('Het is niet gelukt om de oefening toe te voegen');
    }

    final result = jsonDecode(response.body);
    return Oefeningen(
        id: result['id'], name: result['naam'], description: result['description']);
  }

  Future<Oefeningen> put(int id, Oefeningen oefeningen) async {
    final response =
    await http.put(Uri.parse('http://127.0.0.1:8000/api/exercise/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': oefeningen.id,
          'name': oefeningen.name,
          'description': oefeningen.description,
        }));

    if (response.statusCode != 200) {
      throw Exception('Het is niet gelukt om de oefening toe te voegen');
    }

    final result = jsonDecode(response.body);
    return Oefeningen(
        id: result['id'], name: result['naam'], description: result['description']);
  }

  Future<bool> delete(int oefeningenId) async {
    final response = await http.delete(
        Uri.parse('http://127.0.0.1:8000/api/exercise/${oefeningenId}'));

    return response.statusCode == 200;
  }


  Future<bool> addOnderdelenToOefeningen(int oefeningenID, int componentsId) async {
    final response =
    await http.post(Uri.parse(
      'http://127.0.0.1:8000/api/exercise/${oefeningenID}/components/${componentsId}'));

    return response.statusCode == 200;
  }

  Future<bool> deleteOnderdelenFromOefeningen(int oefeningenID, int componentsId) async {
    final response =
    await http.delete(Uri.parse(
        'http://127.0.0.1:8000/api/exercise/${oefeningenID}/components/${componentsId}'));

    return response.statusCode == 200;
  }

}
