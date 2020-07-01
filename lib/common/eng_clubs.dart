class EngClubs{
  String key;
  String name;
  String code;

  EngClubs({this.key, this.name, this.code});

  factory EngClubs.fromJson(Map<String, dynamic> parsedJson) {
    return EngClubs(
      key: parsedJson['key'] as String,
      name: parsedJson['name'] as String,
      code: parsedJson['code'] as String,
    );
  }
}