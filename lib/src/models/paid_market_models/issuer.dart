class Issuer {
  final int? id;
  final String? name;

  const Issuer({
    this.id,
    this.name,
  });

  @override
  String toString() => 'Issuer(id: $id, name: $name)';

  factory Issuer.fromJson(Map<String, dynamic> json) {
    return Issuer(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Issuer copyWith({
    int? id,
    String? name,
  }) {
    return Issuer(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  List<Object> get props => [
        id!,
        name!,
      ];
}
