class SecurityCode {
  final int? length;
  final String? cardLocation;

  const SecurityCode({
    this.length,
    this.cardLocation,
  });

  @override
  String toString() {
    return 'SecurityCode(length: $length, cardLocation: $cardLocation)';
  }

  factory SecurityCode.fromJson(Map<String, dynamic> json) {
    return SecurityCode(
      length: json['length'] as int?,
      cardLocation: json['card_location'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'card_location': cardLocation,
    };
  }

  SecurityCode copyWith({
    int? length,
    String? cardLocation,
  }) {
    return SecurityCode(
      length: length ?? this.length,
      cardLocation: cardLocation ?? this.cardLocation,
    );
  }

  List<Object> get props => [
        length!,
        cardLocation!,
      ];
}
