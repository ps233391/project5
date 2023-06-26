import 'onderdelen.dart';

class Oefeningen {
  final int id;
  final String name;
  final String description;
  final List<Onderdelen>? onderdelen;

  Oefeningen({
    required this.id,
    required this.name,
    required this.description,
    this.onderdelen,
  });

  factory Oefeningen.fromJson(Map<String, dynamic> json) {
    return Oefeningen(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}