import 'package:flutter/foundation.dart';
import 'package:mercadopago_checkouts/src/models/issuer_model.dart';

@immutable
class CardTypeModel {
  final IssuerModel? issuer;
  final String? id;
  final String? thumbnail;

  const CardTypeModel({this.issuer, this.id, this.thumbnail});

  @override
  String toString() => 'CardTypeModel(issuer: $issuer, id: $id)';

  factory CardTypeModel.fromJson(Map<String, dynamic> json) => CardTypeModel(
        issuer: json['issuer'] == null
            ? null
            : IssuerModel.fromJson(json['issuer'] as Map<String, dynamic>),
        id: json['id'] as String?,
        thumbnail: json['thumbnail'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'issuer': issuer?.toJson(),
        'id': id,
        'thumbnail': thumbnail,
      };

  CardTypeModel copyWith({
    IssuerModel? issuer,
    String? id,
    String? thumbnail,
  }) {
    return CardTypeModel(
      issuer: issuer ?? this.issuer,
      id: id ?? this.id,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
