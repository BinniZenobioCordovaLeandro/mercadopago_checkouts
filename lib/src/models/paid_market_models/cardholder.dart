import "identification.dart";

class Cardholder {
  final String? name;
  final Identification? identification;

  const Cardholder({
    this.name,
    this.identification,
  });

  @override
  String toString() {
    return 'Cardholder(name: $name, identification: $identification)';
  }

  factory Cardholder.fromJson(Map<String, dynamic> json) {
    return Cardholder(
      name: json['name'] as String?,
      identification: json['identification'] == null
          ? null
          : Identification.fromJson(
              json['identification'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'identification': identification?.toJson(),
    };
  }

  Cardholder copyWith({
    String? name,
    Identification? identification,
  }) {
    return Cardholder(
      name: name ?? this.name,
      identification: identification ?? this.identification,
    );
  }

  List<Object> get props => [
        name!,
        identification!,
      ];
}
