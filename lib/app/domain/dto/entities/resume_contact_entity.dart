class ResumeContactEntity {
  final String name;
  final String email;
  final String whatsapp;
  final String location;

  const ResumeContactEntity({
    required this.name,
    required this.email,
    required this.whatsapp,
    required this.location,
  });

  factory ResumeContactEntity.fromJson(Map<String, dynamic> json) {
    return ResumeContactEntity(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      whatsapp: json['whatsapp'] ?? '',
      location: json['location'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'whatsapp': whatsapp,
      'location': location,
    };
  }
}
