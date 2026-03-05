class ResumeContactEntity {
  final String name;
  final String profession;
  final String email;
  final String whatsapp;
  final String location;

  const ResumeContactEntity({
    required this.name,
    required this.profession,
    required this.email,
    required this.whatsapp,
    required this.location,
  });

  factory ResumeContactEntity.fromJson(Map<String, dynamic> json) {
    print(json);

    return ResumeContactEntity(
      name: json['name'] ?? '',
      profession: json['profession'] ?? '',
      email: json['email'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      location: json['location'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profession': profession,
      'email': email,
      'whatsapp': whatsapp,
      'location': location,
    };
  }
}
