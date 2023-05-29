import "cardholder.dart";
import "issuer.dart";
import "payment_method.dart";
import "security_code.dart";

class Card {
  final Cardholder? cardholder;
  final String? customerId;
  final DateTime? dateCreated;
  final String? dateLastUpdated;
  final int? expirationMonth;
  final int? expirationYear;
  final String? firstSixDigits;
  final String? id;
  final Issuer? issuer;
  final String? lastFourDigits;
  final PaymentMethod? paymentMethod;
  final String? cvv;
  final SecurityCode? securityCode;
  final String? userId;
  final String? cardNumber;
  final int? installments;
  final String? token;
  final bool? save;
  final String? email;
  final String? error;

  const Card({
    this.cardholder,
    this.customerId,
    this.dateCreated,
    this.dateLastUpdated,
    this.expirationMonth,
    this.expirationYear,
    this.firstSixDigits,
    this.id,
    this.issuer,
    this.lastFourDigits,
    this.paymentMethod,
    this.cvv,
    this.securityCode,
    this.userId,
    this.cardNumber,
    this.installments,
    this.token,
    this.save,
    this.email,
    this.error,
  });

  @override
  String toString() {
    return 'Cards(cardholder: $cardholder, customerId: $customerId, dateCreated: $dateCreated, dateLastUpdated: $dateLastUpdated, expirationMonth: $expirationMonth, expirationYear: $expirationYear, firstSixDigits: $firstSixDigits, id: $id, issuer: $issuer, lastFourDigits: $lastFourDigits, paymentMethod: $paymentMethod, securityCode: $securityCode, userId: $userId, token: $token, email $email, error $error)';
  }

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      cardholder: json['cardholder'] == null
          ? null
          : Cardholder.fromJson(json['cardholder'] as Map<String, dynamic>),
      customerId: json['customer_id'] as String?,
      dateCreated: json['date_created'] == null
          ? null
          : DateTime.parse(json['date_created'] as String),
      dateLastUpdated: json['date_last_updated'] as String?,
      expirationMonth: json['expiration_month'] as int?,
      expirationYear: json['expiration_year'] as int?,
      firstSixDigits: json['first_six_digits'] as String?,
      id: json['id'] as String?,
      issuer: json['issuer'] == null
          ? null
          : Issuer.fromJson(json['issuer'] as Map<String, dynamic>),
      lastFourDigits: json['last_four_digits'] as String?,
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      cvv: json['cvv'] != null ? json['cvv'] as String? : null,
      securityCode: json['security_code'] == null
          ? null
          : SecurityCode.fromJson(
              json['security_code'] as Map<String, dynamic>),
      userId: json['user_id'] as String?,
      cardNumber: json['cardNumber'] as String?,
      installments: json['installments'] as int?,
      token: json['token'] as String?,
      save: json['save'] != null ? json['save'] as bool : null,
      email: json['email'] != null ? json['email'] as String? : null,
      error: json['error'] != null ? json['error'] as String? : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cardholder': cardholder?.toJson(),
      'customer_id': customerId,
      'date_created': dateCreated?.toIso8601String(),
      'date_last_updated': dateLastUpdated,
      'expiration_month': expirationMonth,
      'expiration_year': expirationYear,
      'first_six_digits': firstSixDigits,
      'id': id,
      'issuer': issuer?.toJson(),
      'last_four_digits': lastFourDigits,
      'payment_method': paymentMethod?.toJson(),
      'cvv': cvv,
      'security_code': securityCode?.toJson(),
      'user_id': userId,
      'cardNumber': cardNumber,
      'installments': installments,
      'token': token,
      'save': save,
      'email': email,
      'error': error,
    };
  }

  Card copyWith({
    Cardholder? cardholder,
    String? customerId,
    DateTime? dateCreated,
    String? dateLastUpdated,
    int? expirationMonth,
    int? expirationYear,
    String? firstSixDigits,
    String? id,
    Issuer? issuer,
    String? lastFourDigits,
    PaymentMethod? paymentMethod,
    String? cvv,
    SecurityCode? securityCode,
    String? userId,
    String? cardNumber,
    int? installments,
    String? token,
    bool? save,
    String? email,
    String? error,
  }) {
    return Card(
      cardholder: cardholder ?? this.cardholder,
      customerId: customerId ?? this.customerId,
      dateCreated: dateCreated ?? this.dateCreated,
      dateLastUpdated: dateLastUpdated ?? this.dateLastUpdated,
      expirationMonth: expirationMonth ?? this.expirationMonth,
      expirationYear: expirationYear ?? this.expirationYear,
      firstSixDigits: firstSixDigits ?? this.firstSixDigits,
      id: id ?? this.id,
      issuer: issuer ?? this.issuer,
      lastFourDigits: lastFourDigits ?? this.lastFourDigits,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      cvv: cvv ?? this.cvv,
      securityCode: securityCode ?? this.securityCode,
      userId: userId ?? this.userId,
      cardNumber: cardNumber ?? this.cardNumber,
      installments: installments ?? this.installments,
      token: token ?? this.token,
      save: save ?? this.save,
      email: email ?? this.email,
      error: error ?? this.error,
    );
  }

  List<Object> get props {
    return [
      cardholder!,
      customerId!,
      dateCreated!,
      dateLastUpdated!,
      expirationMonth!,
      expirationYear!,
      firstSixDigits!,
      id!,
      issuer!,
      lastFourDigits!,
      paymentMethod!,
      cvv!,
      securityCode!,
      userId!,
      cardNumber!,
      installments!,
      token!,
      save!,
      email!,
      error!,
    ];
  }
}
