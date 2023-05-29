class Phone {
  final String? areaCode;
  final String? number;

  const Phone({
    this.areaCode,
    this.number,
  });

  @override
  String toString() {
    return 'Phone(areaCode: $areaCode, number: $number)';
  }

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      areaCode: json['area_code'] as String?,
      number: json['number'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'area_code': areaCode,
      'number': number,
    };
  }

  Phone copyWith({
    String? areaCode,
    String? number,
  }) {
    return Phone(
      areaCode: areaCode ?? this.areaCode,
      number: number ?? this.number,
    );
  }

  List<Object> get props => [
        areaCode!,
        number!,
      ];
}
