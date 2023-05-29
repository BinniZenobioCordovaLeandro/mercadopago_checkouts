class Address {
  final dynamic id;
  final dynamic zipCode;
  final dynamic streetName;
  final dynamic streetNumber;

  const Address({
    this.id,
    this.zipCode,
    this.streetName,
    this.streetNumber,
  });

  @override
  String toString() {
    return 'Address(id: $id, zipCode: $zipCode, streetName: $streetName, streetNumber: $streetNumber)';
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as dynamic,
      zipCode: json['zip_code'] as dynamic,
      streetName: json['street_name'] as dynamic,
      streetNumber: json['street_number'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'zip_code': zipCode,
      'street_name': streetName,
      'street_number': streetNumber,
    };
  }

  Address copyWith({
    dynamic id,
    dynamic zipCode,
    dynamic streetName,
    dynamic streetNumber,
  }) {
    return Address(
      id: id ?? this.id,
      zipCode: zipCode ?? this.zipCode,
      streetName: streetName ?? this.streetName,
      streetNumber: streetNumber ?? this.streetNumber,
    );
  }

  List<Object> get props => [
        id,
        zipCode,
        streetName,
        streetNumber,
      ];
}
