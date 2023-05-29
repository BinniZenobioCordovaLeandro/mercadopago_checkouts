import 'package:flutter/foundation.dart';

@immutable
class IssuerModel {
  final bool? issuerDefault;
  final String? name;
  final int? id;

  const IssuerModel({this.issuerDefault, this.name, this.id});

  @override
  String toString() {
    return 'IssuerModel(issuerDefault: $issuerDefault, name: $name, id: $id)';
  }

  factory IssuerModel.fromJson(Map<String, dynamic> json) => IssuerModel(
        issuerDefault: json['default'] as bool?,
        name: json['name'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'default': issuerDefault,
        'name': name,
        'id': id,
      };

  IssuerModel copyWith({
    bool? issuerDefault,
    String? name,
    int? id,
  }) {
    return IssuerModel(
      issuerDefault: issuerDefault ?? this.issuerDefault,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}
