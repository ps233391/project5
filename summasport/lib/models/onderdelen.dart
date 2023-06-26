import 'oefeningen.dart';

class Onderdelen  {
  final int id;
  final String name;
  final List<Oefeningen>? oefeningen;

  Onderdelen({
    required this.id,
    required this.name,
    this.oefeningen,
  });

  factory Onderdelen.fromJson(Map<String, dynamic> json) {
    return Onderdelen(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (other is Onderdelen) {
      return other.id == id;
    } else {
      return false;
    }
  }

  @override
  // TODO: implement hashCode
  int get hashCode => '$name $id'.hashCode;
}