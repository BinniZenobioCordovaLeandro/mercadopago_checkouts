class PaymentMethod {
  final String? id;
  final String? name;
  final String? paymentTypeId;
  final String? thumbnail;
  final String? secureThumbnail;

  const PaymentMethod({
    this.id,
    this.name,
    this.paymentTypeId,
    this.thumbnail,
    this.secureThumbnail,
  });

  @override
  String toString() {
    return 'PaymentMethod(id: $id, name: $name, paymentTypeId: $paymentTypeId, thumbnail: $thumbnail, secureThumbnail: $secureThumbnail)';
  }

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String?,
      name: json['name'] as String?,
      paymentTypeId: json['payment_type_id'] as String?,
      thumbnail: json['thumbnail'] as String?,
      secureThumbnail: json['secure_thumbnail'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'payment_type_id': paymentTypeId,
      'thumbnail': thumbnail,
      'secure_thumbnail': secureThumbnail,
    };
  }

  PaymentMethod copyWith({
    String? id,
    String? name,
    String? paymentTypeId,
    String? thumbnail,
    String? secureThumbnail,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      name: name ?? this.name,
      paymentTypeId: paymentTypeId ?? this.paymentTypeId,
      thumbnail: thumbnail ?? this.thumbnail,
      secureThumbnail: secureThumbnail ?? this.secureThumbnail,
    );
  }

  List<Object> get props {
    return [
      id!,
      name!,
      paymentTypeId!,
      thumbnail!,
      secureThumbnail!,
    ];
  }
}
