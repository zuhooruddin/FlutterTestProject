class Holidays {
  final String date;
  final String localName;
  final String name;
  final String countryCode;
  final bool fixed;
  final bool global;
  final List<String>? counties;
  final int? launchYear;
  final String type;

  Holidays({
    required this.date,
    required this.localName,
    required this.name,
    required this.countryCode,
    required this.fixed,
    required this.global,
    this.counties,
    this.launchYear,
    required this.type,
  });

  factory Holidays.fromJson(Map<String, dynamic> json) {
    return Holidays(
      date: json['date'],
      localName: json['localName'],
      name: json['name'],
      countryCode: json['countryCode'],
      fixed: json['fixed'],
      global: json['global'],
      counties: List<String>.from(json['counties'] ?? []),
      launchYear: json['launchYear'],
      type: json['type'],
    );
  }
}
