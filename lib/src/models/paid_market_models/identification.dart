class Identification {
  final String? number;
  final String? type;

  const Identification({
    this.number,
    this.type,
  });

  @override
  String toString() {
    return 'Identification(number: $number, type: $type)';
  }

  factory Identification.fromJson(Map<String, dynamic> json) {
    return Identification(
      number: json['number'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'type': type,
    };
  }

  Identification copyWith({
    String? number,
    String? type,
  }) {
    return Identification(
      number: number ?? this.number,
      type: type ?? this.type,
    );
  }

  List<Object> get props => [
        number!,
        type!,
      ];
}
