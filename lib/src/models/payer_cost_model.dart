import 'package:flutter/foundation.dart';

@immutable
class PayerCostModel {
  final int? installments;
  final int? installmentRate;
  final int? discountRate;
  final dynamic reimbursementRate;
  final List<dynamic>? labels;
  final List<dynamic>? installmentRateCollector;
  final int? minAllowedAmount;
  final int? maxAllowedAmount;
  final String? recommendedMessage;
  final double? installmentAmount;
  final double? totalAmount;
  final String? paymentMethodOptionId;

  const PayerCostModel({
    this.installments,
    this.installmentRate,
    this.discountRate,
    this.reimbursementRate,
    this.labels,
    this.installmentRateCollector,
    this.minAllowedAmount,
    this.maxAllowedAmount,
    this.recommendedMessage,
    this.installmentAmount,
    this.totalAmount,
    this.paymentMethodOptionId,
  });

  @override
  String toString() {
    return 'PayerCostModel(installments: $installments, installmentRate: $installmentRate, discountRate: $discountRate, reimbursementRate: $reimbursementRate, labels: $labels, installmentRateCollector: $installmentRateCollector, minAllowedAmount: $minAllowedAmount, maxAllowedAmount: $maxAllowedAmount, recommendedMessage: $recommendedMessage, installmentAmount: $installmentAmount, totalAmount: $totalAmount, paymentMethodOptionId: $paymentMethodOptionId)';
  }

  factory PayerCostModel.fromJson(Map<String, dynamic> json) => PayerCostModel(
        installments: json['installments'] as int?,
        installmentRate: json['installment_rate'] as int?,
        discountRate: json['discount_rate'] as int?,
        reimbursementRate: json['reimbursement_rate'],
        labels: json['labels'] as List<dynamic>?,
        installmentRateCollector:
            json['installment_rate_collector'] as List<dynamic>?,
        minAllowedAmount: json['min_allowed_amount'] as int?,
        maxAllowedAmount: json['max_allowed_amount'] as int?,
        recommendedMessage: json['recommended_message'] as String?,
        installmentAmount:
            double.tryParse(json['installment_amount'].toString()),
        totalAmount: double.tryParse(json['total_amount'].toString()),
        paymentMethodOptionId: json['payment_method_option_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'installments': installments,
        'installment_rate': installmentRate,
        'discount_rate': discountRate,
        'reimbursement_rate': reimbursementRate,
        'labels': labels,
        'installment_rate_collector': installmentRateCollector,
        'min_allowed_amount': minAllowedAmount,
        'max_allowed_amount': maxAllowedAmount,
        'recommended_message': recommendedMessage,
        'installment_amount': installmentAmount,
        'total_amount': totalAmount,
        'payment_method_option_id': paymentMethodOptionId,
      };

  PayerCostModel copyWith({
    int? installments,
    int? installmentRate,
    int? discountRate,
    dynamic reimbursementRate,
    List<dynamic>? labels,
    List<dynamic>? installmentRateCollector,
    int? minAllowedAmount,
    int? maxAllowedAmount,
    String? recommendedMessage,
    double? installmentAmount,
    double? totalAmount,
    String? paymentMethodOptionId,
  }) {
    return PayerCostModel(
      installments: installments ?? this.installments,
      installmentRate: installmentRate ?? this.installmentRate,
      discountRate: discountRate ?? this.discountRate,
      reimbursementRate: reimbursementRate ?? this.reimbursementRate,
      labels: labels ?? this.labels,
      installmentRateCollector:
          installmentRateCollector ?? this.installmentRateCollector,
      minAllowedAmount: minAllowedAmount ?? this.minAllowedAmount,
      maxAllowedAmount: maxAllowedAmount ?? this.maxAllowedAmount,
      recommendedMessage: recommendedMessage ?? this.recommendedMessage,
      installmentAmount: installmentAmount ?? this.installmentAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      paymentMethodOptionId:
          paymentMethodOptionId ?? this.paymentMethodOptionId,
    );
  }
}
