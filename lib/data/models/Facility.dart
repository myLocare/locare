class Facility {
  String name;
  String description;
  String icon;

  Facility({
    required this.name,
    required this.description,
    required this.icon,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      name: json['name'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'icon': icon,
      };
}
