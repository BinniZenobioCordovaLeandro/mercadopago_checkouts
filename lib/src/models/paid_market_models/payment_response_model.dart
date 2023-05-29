// To parse this JSON data, do
//
//     final paymentResponseModel = paymentResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:mercadopago_checkouts/src/models/paid_market_models/cards.dart';
import 'package:mercadopago_checkouts/src/models/paid_market_models/identification.dart';

PaymentResponseModel paymentResponseModelFromJson(String? str) =>
    PaymentResponseModel.fromJson(json.decode(str!));

String paymentResponseModelToJson(PaymentResponseModel data) =>
    json.encode(data.toJson());

class PaymentResponseModel {
  PaymentResponseModel({
    this.id,
    this.dateCreated,
    this.dateApproved,
    this.dateLastUpdated,
    this.dateOfExpiration,
    this.moneyReleaseDate,
    this.operationType,
    this.issuerId,
    this.paymentMethodId,
    this.paymentTypeId,
    this.status,
    this.statusDetail,
    this.currencyId,
    this.description,
    this.liveMode,
    this.sponsorId,
    this.authorizationCode,
    this.moneyReleaseSchema,
    this.taxesAmount,
    this.counterCurrency,
    this.shippingAmount,
    this.posId,
    this.storeId,
    this.collectorId,
    this.payer,
    this.metadata,
    this.additionalInfo,
    this.order,
    this.externalReference,
    this.transactionAmount,
    this.transactionAmountRefunded,
    this.couponAmount,
    this.differentialPricingId,
    this.deductionSchema,
    this.transactionDetails,
    this.feeDetails,
    this.captured,
    this.binaryMode,
    this.callForAuthorizeId,
    this.statementDescriptor,
    this.installments,
    this.card,
    this.notificationUrl,
    this.refunds,
    this.processingMode,
    this.merchantAccountId,
    this.acquirer,
    this.merchantNumber,
    this.acquirerReconciliation,
    this.pointOfInteraction,
  });

  String? id;
  DateTime? dateCreated;
  DateTime? dateApproved;
  DateTime? dateLastUpdated;
  dynamic dateOfExpiration;
  DateTime? moneyReleaseDate;
  String? operationType;
  String? issuerId;
  String? paymentMethodId;
  String? paymentTypeId;
  String? status;
  String? statusDetail;
  String? currencyId;
  String? description;
  bool? liveMode;
  dynamic sponsorId;
  dynamic authorizationCode;
  dynamic moneyReleaseSchema;
  int? taxesAmount;
  dynamic counterCurrency;
  int? shippingAmount;
  dynamic posId;
  dynamic storeId;
  int? collectorId;
  PaymentResponseModelPayer? payer;
  Metadata? metadata;
  AdditionalInfo? additionalInfo;
  Metadata? order;
  String? externalReference;
  double? transactionAmount;
  int? transactionAmountRefunded;
  int? couponAmount;
  dynamic differentialPricingId;
  dynamic deductionSchema;
  TransactionDetails? transactionDetails;
  List<FeeDetail>? feeDetails;
  bool? captured;
  bool? binaryMode;
  dynamic callForAuthorizeId;
  String? statementDescriptor;
  int? installments;
  Card? card;
  String? notificationUrl;
  List<dynamic>? refunds;
  String? processingMode;
  dynamic merchantAccountId;
  dynamic acquirer;
  dynamic merchantNumber;
  List<dynamic>? acquirerReconciliation;
  PointOfInteraction? pointOfInteraction;

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        id: json["id"].toString(),
        dateCreated: json["date_created"] != null
            ? DateTime.parse(json["date_created"])
            : null,
        dateApproved: json["date_approved"] != null
            ? DateTime.parse(json["date_approved"])
            : null,
        dateLastUpdated: json["date_last_updated"] != null
            ? DateTime.parse(json["date_last_updated"])
            : null,
        dateOfExpiration: json["date_of_expiration"],
        moneyReleaseDate: json["money_release_date"] != null
            ? DateTime.parse(json["money_release_date"])
            : null,
        operationType: json["operation_type"],
        issuerId: json["issuer_id"],
        paymentMethodId: json["payment_method_id"],
        paymentTypeId: json["payment_type_id"],
        status: json["status"] != null ? json["status"].toString() : null,
        statusDetail: json["status_detail"] != null
            ? json["status_detail"]
            : json["message"],
        currencyId: json["currency_id"],
        description: json["description"],
        liveMode: json["live_mode"],
        sponsorId: json["sponsor_id"],
        authorizationCode: json["authorization_code"],
        moneyReleaseSchema: json["money_release_schema"],
        taxesAmount: json["taxes_amount"],
        counterCurrency: json["counter_currency"],
        shippingAmount: json["shipping_amount"],
        posId: json["pos_id"],
        storeId: json["store_id"],
        collectorId: json["collector_id"],
        payer: json["payer"] != null
            ? PaymentResponseModelPayer.fromJson(json["payer"])
            : null,
        metadata: json["metadata"] != null
            ? Metadata.fromJson(json["metadata"])
            : null,
        additionalInfo: json["additional_info"] != null
            ? AdditionalInfo.fromJson(json["additional_info"])
            : null,
        order: json["order"] != null ? Metadata.fromJson(json["order"]) : null,
        externalReference: json["external_reference"],
        transactionAmount: json["transaction_amount"] != null
            ? json["transaction_amount"].toDouble()
            : null,
        transactionAmountRefunded: json["transaction_amount_refunded"],
        couponAmount: json["coupon_amount"],
        differentialPricingId: json["differential_pricing_id"],
        deductionSchema: json["deduction_schema"],
        transactionDetails: json["transaction_details"] != null
            ? TransactionDetails.fromJson(json["transaction_details"])
            : null,
        feeDetails: json["fee_details"] != null
            ? List<FeeDetail>.from(
                json["fee_details"].map((x) => FeeDetail.fromJson(x)))
            : null,
        captured: json["captured"],
        binaryMode: json["binary_mode"],
        callForAuthorizeId: json["call_for_authorize_id"],
        statementDescriptor: json["statement_descriptor"],
        installments: json["installments"],
        card: json["card"] != null ? Card.fromJson(json["card"]) : null,
        notificationUrl: json["notification_url"],
        refunds: json["refunds"] != null
            ? List<dynamic>.from(json["refunds"].map((x) => x))
            : null,
        processingMode: json["processing_mode"],
        merchantAccountId: json["merchant_account_id"],
        acquirer: json["acquirer"],
        merchantNumber: json["merchant_number"],
        acquirerReconciliation: json["acquirer_reconciliation"] != null
            ? List<dynamic>.from(json["acquirer_reconciliation"].map((x) => x))
            : null,
        pointOfInteraction: json["point_of_interaction"] != null
            ? PointOfInteraction.fromJson(json["point_of_interaction"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created":
            dateCreated != null ? dateCreated!.toIso8601String() : null,
        "date_approved":
            dateApproved != null ? dateApproved!.toIso8601String() : null,
        "date_last_updated":
            dateApproved != null ? dateLastUpdated!.toIso8601String() : null,
        "date_of_expiration": dateOfExpiration,
        "money_release_date": moneyReleaseDate != null
            ? moneyReleaseDate!.toIso8601String()
            : null,
        "operation_type": operationType,
        "issuer_id": issuerId,
        "payment_method_id": paymentMethodId,
        "payment_type_id": paymentTypeId,
        "status": status,
        "status_detail": statusDetail,
        "currency_id": currencyId,
        "description": description,
        "live_mode": liveMode,
        "sponsor_id": sponsorId,
        "authorization_code": authorizationCode,
        "money_release_schema": moneyReleaseSchema,
        "taxes_amount": taxesAmount,
        "counter_currency": counterCurrency,
        "shipping_amount": shippingAmount,
        "pos_id": posId,
        "store_id": storeId,
        "collector_id": collectorId,
        "payer": payer != null ? payer!.toJson() : null,
        "metadata": metadata != null ? metadata!.toJson() : null,
        "additional_info":
            additionalInfo != null ? additionalInfo!.toJson() : null,
        "order": order != null ? order!.toJson() : null,
        "external_reference": externalReference,
        "transaction_amount": transactionAmount,
        "transaction_amount_refunded": transactionAmountRefunded,
        "coupon_amount": couponAmount,
        "differential_pricing_id": differentialPricingId,
        "deduction_schema": deductionSchema,
        "transaction_details":
            transactionDetails != null ? transactionDetails!.toJson() : null,
        "fee_details": (feeDetails != null && feeDetails is List)
            ? List<dynamic>.from(feeDetails!.map((x) => x.toJson()))
            : null,
        "captured": captured,
        "binary_mode": binaryMode,
        "call_for_authorize_id": callForAuthorizeId,
        "statement_descriptor": statementDescriptor,
        "installments": installments,
        "card": card != null ? card!.toJson() : null,
        "notification_url": notificationUrl,
        "refunds": (refunds != null && refunds is List)
            ? List<dynamic>.from(refunds!.map((x) => x))
            : null,
        "processing_mode": processingMode,
        "merchant_account_id": merchantAccountId,
        "acquirer": acquirer,
        "merchant_number": merchantNumber,
        "acquirer_reconciliation":
            (acquirerReconciliation != null && acquirerReconciliation is List)
                ? List<dynamic>.from(acquirerReconciliation!.map((x) => x))
                : null,
        "point_of_interaction":
            pointOfInteraction != null ? pointOfInteraction!.toJson() : null,
      };
}

class AdditionalInfo {
  AdditionalInfo({
    this.payer,
  });

  AdditionalInfoPayer? payer;

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
        payer: json["payer"] != null
            ? AdditionalInfoPayer.fromJson(json["payer"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "payer": payer!.toJson(),
      };
}

class AdditionalInfoPayer {
  AdditionalInfoPayer({
    this.phone,
    this.address,
    this.firstName,
    this.lastName,
    this.registrationDate,
  });

  PurplePhone? phone;
  Address? address;
  String? firstName;
  String? lastName;
  DateTime? registrationDate;

  factory AdditionalInfoPayer.fromJson(Map<String, dynamic> json) =>
      AdditionalInfoPayer(
        phone:
            json["phone"] != null ? PurplePhone.fromJson(json["phone"]) : null,
        address:
            json["address"] != null ? Address.fromJson(json["address"]) : null,
        firstName: json["first_name"],
        lastName: json["last_name"],
        registrationDate: json["registration_date"] != null
            ? DateTime.parse(json["registration_date"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "phone": phone != null ? phone?.toJson() : null,
        "address": address != null ? address?.toJson() : null,
        "first_name": firstName,
        "last_name": lastName,
        "registration_date": registrationDate != null
            ? registrationDate!.toIso8601String()
            : null,
      };
}

class Address {
  Address({
    this.zipCode,
    this.streetName,
    this.streetNumber,
  });

  String? zipCode;
  String? streetName;
  String? streetNumber;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        zipCode: json["zip_code"],
        streetName: json["street_name"],
        streetNumber: json["street_number"],
      );

  Map<String, dynamic> toJson() => {
        "zip_code": zipCode,
        "street_name": streetName,
        "street_number": streetNumber,
      };
}

class PurplePhone {
  PurplePhone({
    this.areaCode,
    this.number,
  });

  String? areaCode;
  String? number;

  factory PurplePhone.fromJson(Map<String, dynamic> json) => PurplePhone(
        areaCode: json["area_code"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "area_code": areaCode,
        "number": number,
      };
}

class FeeDetail {
  FeeDetail({
    this.type,
    this.amount,
    this.feePayer,
  });

  String? type;
  double? amount;
  String? feePayer;

  factory FeeDetail.fromJson(Map<String, dynamic> json) => FeeDetail(
        type: json["type"],
        amount: json["amount"] != null ? json["amount"].toDouble() : null,
        feePayer: json["fee_payer"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "fee_payer": feePayer,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toJson() => {};
}

class PaymentResponseModelPayer {
  PaymentResponseModelPayer({
    this.firstName,
    this.lastName,
    this.email,
    this.identification,
    this.phone,
    this.type,
    this.entityType,
    this.id,
  });

  String? firstName;
  String? lastName;
  String? email;
  Identification? identification;
  FluffyPhone? phone;
  String? type;
  dynamic entityType;
  dynamic id;

  factory PaymentResponseModelPayer.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModelPayer(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        identification: json["identification"] != null
            ? Identification.fromJson(json["identification"])
            : null,
        phone:
            json["phone"] != null ? FluffyPhone.fromJson(json["phone"]) : null,
        type: json["type"],
        entityType: json["entity_type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "identification":
            identification != null ? identification?.toJson() : null,
        "phone": phone != null ? phone?.toJson() : null,
        "type": type,
        "entity_type": entityType,
        "id": id,
      };
}

class FluffyPhone {
  FluffyPhone({
    this.areaCode,
    this.number,
    this.extension,
  });

  String? areaCode;
  String? number;
  String? extension;

  factory FluffyPhone.fromJson(Map<String, dynamic> json) => FluffyPhone(
        areaCode: json["area_code"],
        number: json["number"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "area_code": areaCode,
        "number": number,
        "extension": extension,
      };
}

class PointOfInteraction {
  PointOfInteraction({
    this.type,
    this.subType,
    this.applicationData,
    this.transactionData,
  });

  String? type;
  dynamic subType;
  ApplicationData? applicationData;
  TransactionData? transactionData;

  factory PointOfInteraction.fromJson(Map<String, dynamic> json) =>
      PointOfInteraction(
        type: json["type"],
        subType: json["sub_type"],
        applicationData: json["application_data"] != null
            ? ApplicationData.fromJson(json["application_data"])
            : null,
        transactionData: json["transaction_data"] != null
            ? TransactionData.fromJson(json["transaction_data"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "sub_type": subType,
        "application_data":
            applicationData != null ? applicationData!.toJson() : null,
        "transaction_data":
            transactionData != null ? transactionData!.toJson() : null,
      };
}

class ApplicationData {
  ApplicationData({
    this.name,
    this.version,
  });

  String? name;
  String? version;

  factory ApplicationData.fromJson(Map<String, dynamic> json) =>
      ApplicationData(
        name: json["name"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
      };
}

class TransactionData {
  TransactionData({
    this.qrCodeBase64,
  });

  String? qrCodeBase64;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        qrCodeBase64: json["qr_code_base64"],
      );

  Map<String, dynamic> toJson() => {
        "qr_code_base64": qrCodeBase64,
      };
}

class TransactionDetails {
  TransactionDetails({
    this.paymentMethodReferenceId,
    this.netReceivedAmount,
    this.totalPaidAmount,
    this.overpaidAmount,
    this.externalResourceUrl,
    this.installmentAmount,
    this.financialInstitution,
    this.payableDeferralPeriod,
    this.acquirerReference,
  });

  dynamic paymentMethodReferenceId;
  double? netReceivedAmount;
  double? totalPaidAmount;
  int? overpaidAmount;
  dynamic externalResourceUrl;
  double? installmentAmount;
  dynamic financialInstitution;
  dynamic payableDeferralPeriod;
  dynamic acquirerReference;

  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      TransactionDetails(
        paymentMethodReferenceId: json["payment_method_reference_id"],
        netReceivedAmount: json["net_received_amount"] != null
            ? json["net_received_amount"].toDouble()
            : null,
        totalPaidAmount: json["total_paid_amount"] != null
            ? json["total_paid_amount"].toDouble()
            : null,
        overpaidAmount: json["overpaid_amount"],
        externalResourceUrl: json["external_resource_url"],
        installmentAmount: json["installment_amount"] != null
            ? json["installment_amount"].toDouble()
            : null,
        financialInstitution: json["financial_institution"],
        payableDeferralPeriod: json["payable_deferral_period"],
        acquirerReference: json["acquirer_reference"],
      );

  Map<String, dynamic> toJson() => {
        "payment_method_reference_id": paymentMethodReferenceId,
        "net_received_amount": netReceivedAmount,
        "total_paid_amount": totalPaidAmount,
        "overpaid_amount": overpaidAmount,
        "external_resource_url": externalResourceUrl,
        "installment_amount": installmentAmount,
        "financial_institution": financialInstitution,
        "payable_deferral_period": payableDeferralPeriod,
        "acquirer_reference": acquirerReference,
      };
}
