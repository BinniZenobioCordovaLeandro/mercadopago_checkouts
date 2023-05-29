class UserModel {
  final String firstName;
  final String? idCountriesCodes;
  final String? idCountriesDocumentsTypes;
  final String document;
  final String phoneCode;
  final String phoneNumber;
  final String lastName;
  final String email;

  const UserModel({
    required this.firstName,
    this.idCountriesCodes,
    this.idCountriesDocumentsTypes,
    required this.document,
    required this.phoneCode,
    required this.phoneNumber,
    required this.lastName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'] != null ? json['first_name'] : null,
      idCountriesCodes: json['id_countries_codes'] != null
          ? json['id_countries_codes'].toString()
          : null,
      idCountriesDocumentsTypes: json['id_countries_documents_types'] != null
          ? json['id_countries_documents_types'].toString()
          : null,
      document: json['document'] != null ? json['document'] : null,
      phoneCode: json['phone_code'] != null ? json['phone_code'] : null,
      phoneNumber: json['phone_number'] != null ? json['phone_number'] : null,
      lastName: json['last_name'] != null ? json['last_name'] : null,
      email: json['email'] != null ? json['email'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'id_countries_codes': idCountriesCodes,
      'id_countries_documents_types': idCountriesDocumentsTypes,
      'document': document,
      'phone_code': phoneCode,
      'phone_number': phoneNumber,
      'last_name': lastName,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'firstName $firstName, idCountriesCodes $idCountriesCodes, idCountriesDocumentsTypes $idCountriesDocumentsTypes, document $document, phoneCode $phoneCode, phoneNumber $phoneNumber, lastName $lastName, email $email';
  }

  UserModel copyWith({
    String? firstName,
    String? idCountriesCodes,
    String? idCountriesDocumentsTypes,
    String? name,
    String? document,
    String? phoneCode,
    String? phoneNumber,
    String? lastName,
    String? email,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      idCountriesCodes: idCountriesCodes ?? this.idCountriesCodes,
      idCountriesDocumentsTypes:
          idCountriesDocumentsTypes ?? this.idCountriesDocumentsTypes,
      document: document ?? this.document,
      phoneCode: phoneCode ?? this.phoneCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }

  bool? get stringify => true;

  List<Object> get props {
    return [
      firstName,
      idCountriesCodes!,
      idCountriesDocumentsTypes!,
      document,
      phoneCode,
      phoneNumber,
      lastName,
      email,
    ];
  }
}
