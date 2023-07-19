class UserModel {
  final String firstName;
  final String lastName;
  final String? idCountriesCodes;
  final String? idCountriesDocumentsTypes;
  final String document;
  final String phoneCode;
  final String phoneNumber;
  final String email;

  const UserModel({
    required this.firstName,
    required this.lastName,
    this.idCountriesCodes,
    this.idCountriesDocumentsTypes,
    required this.document,
    required this.phoneCode,
    required this.phoneNumber,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      idCountriesCodes: json['id_countries_codes'] as String?,
      idCountriesDocumentsTypes:
          json['id_countries_documents_types'] as String?,
      document: json['document'],
      phoneCode: json['phone_code'],
      phoneNumber: json['phone_number'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'id_countries_codes': idCountriesCodes,
      'id_countries_documents_types': idCountriesDocumentsTypes,
      'document': document,
      'phone_code': phoneCode,
      'phone_number': phoneNumber,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'firstName $firstName, lastName $lastName, idCountriesCodes $idCountriesCodes, idCountriesDocumentsTypes $idCountriesDocumentsTypes, document $document, phoneCode $phoneCode, phoneNumber $phoneNumber, email $email';
  }

  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? idCountriesCodes,
    String? idCountriesDocumentsTypes,
    String? name,
    String? document,
    String? phoneCode,
    String? phoneNumber,
    String? email,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      idCountriesCodes: idCountriesCodes ?? this.idCountriesCodes,
      idCountriesDocumentsTypes:
          idCountriesDocumentsTypes ?? this.idCountriesDocumentsTypes,
      document: document ?? this.document,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  bool? get stringify => true;

  List<Object> get props {
    return [
      firstName,
      lastName,
      idCountriesCodes!,
      idCountriesDocumentsTypes!,
      document,
      phoneCode,
      phoneNumber,
      email,
    ];
  }
}
