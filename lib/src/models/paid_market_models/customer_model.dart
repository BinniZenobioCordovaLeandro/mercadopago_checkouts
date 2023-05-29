import "address.dart";
import "cards.dart";
import "identification.dart";
import "metadata.dart";
import "phone.dart";

class CustomerModel {
  final Address? address;
  final List<dynamic>? addresses;
  final List<dynamic>? cards;
  final String? dateCreated;
  final String? dateLastUpdated;
  final dynamic dateRegistered;
  final dynamic defaultAddress;
  final String? defaultCard;
  final dynamic description;
  final String? email;
  final String? firstName;
  final String? id;
  final Identification? identification;
  final String? lastName;
  final bool? liveMode;
  final Metadata? metadata;
  final Phone? phone;

  const CustomerModel({
    this.address,
    this.addresses,
    this.cards,
    this.dateCreated,
    this.dateLastUpdated,
    this.dateRegistered,
    this.defaultAddress,
    this.defaultCard,
    this.description,
    this.email,
    this.firstName,
    this.id,
    this.identification,
    this.lastName,
    this.liveMode,
    this.metadata,
    this.phone,
  });

  @override
  String toString() {
    return 'CustomerModel(address: $address, addresses: $addresses, cards: $cards, dateCreated: $dateCreated, dateLastUpdated: $dateLastUpdated, dateRegistered: $dateRegistered, defaultAddress: $defaultAddress, defaultCard: $defaultCard, description: $description, email: $email, firstName: $firstName, id: $id, identification: $identification, lastName: $lastName, liveMode: $liveMode, metadata: $metadata, phone: $phone)';
  }

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      addresses: json['addresses'] as List<dynamic>,
      cards: (json['cards'] != null)
          ? ((json['cards']).map((dynamic e) {
              if (e == null) return null;
              return Card.fromJson(e as Map<String, dynamic>);
            }).toList())
          : null,
      dateCreated: json['date_created'] as String?,
      dateLastUpdated: json['date_last_updated'] as String?,
      dateRegistered: json['date_registered'] as dynamic,
      defaultAddress: json['default_address'] as dynamic,
      defaultCard: json['default_card'] as String?,
      description: json['description'] as dynamic,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      id: json['id'] as String?,
      identification: json['identification'] == null
          ? null
          : Identification.fromJson(
              json['identification'] as Map<String, dynamic>),
      lastName: json['last_name'] as String?,
      liveMode: json['live_mode'] as bool,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      phone: json['phone'] == null
          ? null
          : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address?.toJson(),
      'addresses': addresses,
      'cards': cards?.map((e) => e.toJson()).toList(),
      'date_created': dateCreated,
      'date_last_updated': dateLastUpdated,
      'date_registered': dateRegistered,
      'default_address': defaultAddress,
      'default_card': defaultCard,
      'description': description,
      'email': email,
      'first_name': firstName,
      'id': id,
      'identification': identification?.toJson(),
      'last_name': lastName,
      'live_mode': liveMode,
      'metadata': metadata?.toJson(),
      'phone': phone?.toJson(),
    };
  }

  CustomerModel copyWith({
    Address? address,
    List<dynamic>? addresses,
    List<dynamic>? cards,
    String? dateCreated,
    String? dateLastUpdated,
    dynamic dateRegistered,
    dynamic defaultAddress,
    String? defaultCard,
    dynamic description,
    String? email,
    String? firstName,
    String? id,
    Identification? identification,
    String? lastName,
    bool? liveMode,
    Metadata? metadata,
    Phone? phone,
  }) {
    return CustomerModel(
      address: address ?? this.address,
      addresses: addresses ?? this.addresses,
      cards: cards ?? this.cards,
      dateCreated: dateCreated ?? this.dateCreated,
      dateLastUpdated: dateLastUpdated ?? this.dateLastUpdated,
      dateRegistered: dateRegistered ?? this.dateRegistered,
      defaultAddress: defaultAddress ?? this.defaultAddress,
      defaultCard: defaultCard ?? this.defaultCard,
      description: description ?? this.description,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      identification: identification ?? this.identification,
      lastName: lastName ?? this.lastName,
      liveMode: liveMode ?? this.liveMode,
      metadata: metadata ?? this.metadata,
      phone: phone ?? this.phone,
    );
  }

  List<Object> get props {
    return [
      address!,
      addresses!,
      cards!,
      dateCreated!,
      dateLastUpdated!,
      dateRegistered!,
      defaultAddress!,
      defaultCard!,
      description!,
      email!,
      firstName!,
      id!,
      identification!,
      lastName!,
      liveMode!,
      metadata!,
      phone!,
    ];
  }
}
