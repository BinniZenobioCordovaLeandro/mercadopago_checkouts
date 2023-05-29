enum PaidMarketStatusTypeEnum {
  Accredited,
  PendingContingency,
  PendingReviewManual,
  RejectedBadFilledCardNumber,
  RejectedBadFilledDate,
  RejectedBadFilledOther,
  RejectedBadFilledSecurityCode,
  RejectedBlacklist,
  RejectedCallForAuthorize,
  RejectedCardDisabled,
  RejectedCardError,
  RejectedDuplicatedPayment,
  RejectedHighRisk,
  RejectedInsufficientAmount,
  RejectedInvalidInstallments,
  RejectedMaxAttempts,
  RejectedOtherReason,
  InvalidSecurityCode,
  InvalidTransactionAmount,
}

extension PaidMarketStatusTypeEnumExtension on PaidMarketStatusTypeEnum {
  String? get value {
    if (this == PaidMarketStatusTypeEnum.Accredited) return "accredited";
    if (this == PaidMarketStatusTypeEnum.PendingContingency)
      return "pending_contingency";
    if (this == PaidMarketStatusTypeEnum.PendingReviewManual)
      return "pending_review_manual";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledCardNumber)
      return "cc_rejected_bad_filled_card_number";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledDate)
      return "cc_rejected_bad_filled_date";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledOther)
      return "cc_rejected_bad_filled_other";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledSecurityCode)
      return "cc_rejected_bad_filled_security_code";
    if (this == PaidMarketStatusTypeEnum.RejectedBlacklist)
      return "cc_rejected_blacklist";
    if (this == PaidMarketStatusTypeEnum.RejectedCallForAuthorize)
      return "cc_rejected_call_for_authorize";
    if (this == PaidMarketStatusTypeEnum.RejectedCardDisabled)
      return "cc_rejected_card_disabled";
    if (this == PaidMarketStatusTypeEnum.RejectedCardError)
      return "cc_rejected_card_error";
    if (this == PaidMarketStatusTypeEnum.RejectedDuplicatedPayment)
      return "cc_rejected_duplicated_payment";
    if (this == PaidMarketStatusTypeEnum.RejectedHighRisk)
      return "cc_rejected_high_risk";
    if (this == PaidMarketStatusTypeEnum.RejectedInsufficientAmount)
      return "cc_rejected_insufficient_amount";
    if (this == PaidMarketStatusTypeEnum.RejectedInvalidInstallments)
      return "cc_rejected_invalid_installments";
    if (this == PaidMarketStatusTypeEnum.RejectedMaxAttempts)
      return "cc_rejected_max_attempts";
    if (this == PaidMarketStatusTypeEnum.RejectedOtherReason)
      return "cc_rejected_other_reason";
    if (this == PaidMarketStatusTypeEnum.InvalidSecurityCode)
      return "Invalid security_code_length";
    if (this == PaidMarketStatusTypeEnum.InvalidTransactionAmount)
      return "Invalid transaction_amount";
    return null;
  }

  String? get description {
    if (this == PaidMarketStatusTypeEnum.Accredited)
      return "¡Listo! Se acreditó tu pago. En tu resumen verás el cargo de amount como statement_descriptor."; // Old: ¡Listo! Se acreditó tu pago. En tu resumen verás el cargo de amount como statement_descriptor.
    if (this == PaidMarketStatusTypeEnum.PendingContingency)
      return "Estamos procesando tu pago. No te preocupes, menos de 2 días hábiles te avisaremos por e-mail si se acreditó.";
    if (this == PaidMarketStatusTypeEnum.PendingReviewManual)
      return "Estamos procesando tu pago. No te preocupes, menos de 2 días hábiles te avisaremos por e-mail si se acreditó o si necesitamos más información.";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledCardNumber)
      return "Revisa el número de tarjeta.";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledDate)
      return "Revisa la fecha de vencimiento.";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledOther)
      return "Revisa los datos.";
    if (this == PaidMarketStatusTypeEnum.RejectedBadFilledSecurityCode)
      return "Revisa el código de seguridad de la tarjeta.";
    if (this == PaidMarketStatusTypeEnum.RejectedBlacklist)
      return "No pudimos procesar tu pago.";
    if (this == PaidMarketStatusTypeEnum.RejectedCallForAuthorize)
      return "Debes autorizar ante la entidad bancaria el pago o válidar los datos de tu tarjeta.";
    if (this == PaidMarketStatusTypeEnum.RejectedCardDisabled)
      return "Llama a tu banco para activar tu tarjeta o usa otro medio de pago. El teléfono está al dorso de tu tarjeta."; // Old: Llama a payment_method_id para activar tu tarjeta o usa otro medio de pago. El teléfono está al dorso de tu tarjeta.
    if (this == PaidMarketStatusTypeEnum.RejectedCardError)
      return "No pudimos procesar tu pago.";
    if (this == PaidMarketStatusTypeEnum.RejectedDuplicatedPayment)
      return "Ya hiciste un pago por ese valor. Si necesitas volver a pagar usa otra tarjeta u otro medio de pago.";
    if (this == PaidMarketStatusTypeEnum.RejectedHighRisk)
      return "Tu pago fue rechazado. Elige otro de los medios de pago, te recomendamos medios en efectivo.";
    if (this == PaidMarketStatusTypeEnum.RejectedInsufficientAmount)
      return "Tu payment_method_id no tiene fondos suficientes.";
    if (this == PaidMarketStatusTypeEnum.RejectedInvalidInstallments)
      return "payment_method_id no procesa pagos en installments cuotas.";
    if (this == PaidMarketStatusTypeEnum.RejectedMaxAttempts)
      return "Llegaste al límite de intentos permitidos. Elige otra tarjeta u otro medio de pago.";
    if (this == PaidMarketStatusTypeEnum.RejectedOtherReason)
      return "Tu banco no procesó el pago."; // Old: payment_method_id no procesó el pago.
    if (this == PaidMarketStatusTypeEnum.InvalidSecurityCode)
      return "El código de seguridad es invalido.";
    if (this == PaidMarketStatusTypeEnum.InvalidTransactionAmount)
      return "El monto de la transacción es invalido.";
    return null;
  }
}

typedef Type Name(params);

PaidMarketStatusTypeEnum? paidMarketStatusTypeEnum(String value) {
  if (value == PaidMarketStatusTypeEnum.Accredited.value)
    return PaidMarketStatusTypeEnum.Accredited;
  if (value == PaidMarketStatusTypeEnum.PendingContingency.value)
    return PaidMarketStatusTypeEnum.PendingContingency;
  if (value == PaidMarketStatusTypeEnum.PendingReviewManual.value)
    return PaidMarketStatusTypeEnum.PendingReviewManual;
  if (value == PaidMarketStatusTypeEnum.RejectedBadFilledCardNumber.value)
    return PaidMarketStatusTypeEnum.RejectedBadFilledCardNumber;
  if (value == PaidMarketStatusTypeEnum.RejectedBadFilledDate.value)
    return PaidMarketStatusTypeEnum.RejectedBadFilledDate;
  if (value == PaidMarketStatusTypeEnum.RejectedBadFilledOther.value)
    return PaidMarketStatusTypeEnum.RejectedBadFilledOther;
  if (value == PaidMarketStatusTypeEnum.RejectedBadFilledSecurityCode.value)
    return PaidMarketStatusTypeEnum.RejectedBadFilledSecurityCode;
  if (value == PaidMarketStatusTypeEnum.RejectedBlacklist.value)
    return PaidMarketStatusTypeEnum.RejectedBlacklist;
  if (value == PaidMarketStatusTypeEnum.RejectedCallForAuthorize.value)
    return PaidMarketStatusTypeEnum.RejectedCallForAuthorize;
  if (value == PaidMarketStatusTypeEnum.RejectedCardDisabled.value)
    return PaidMarketStatusTypeEnum.RejectedCardDisabled;
  if (value == PaidMarketStatusTypeEnum.RejectedCardError.value)
    return PaidMarketStatusTypeEnum.RejectedCardError;
  if (value == PaidMarketStatusTypeEnum.RejectedDuplicatedPayment.value)
    return PaidMarketStatusTypeEnum.RejectedDuplicatedPayment;
  if (value == PaidMarketStatusTypeEnum.RejectedHighRisk.value)
    return PaidMarketStatusTypeEnum.RejectedHighRisk;
  if (value == PaidMarketStatusTypeEnum.RejectedInsufficientAmount.value)
    return PaidMarketStatusTypeEnum.RejectedInsufficientAmount;
  if (value == PaidMarketStatusTypeEnum.RejectedInvalidInstallments.value)
    return PaidMarketStatusTypeEnum.RejectedInvalidInstallments;
  if (value == PaidMarketStatusTypeEnum.RejectedMaxAttempts.value)
    return PaidMarketStatusTypeEnum.RejectedMaxAttempts;
  if (value == PaidMarketStatusTypeEnum.RejectedOtherReason.value)
    return PaidMarketStatusTypeEnum.RejectedOtherReason;
  if (value == PaidMarketStatusTypeEnum.InvalidSecurityCode.value)
    return PaidMarketStatusTypeEnum.InvalidSecurityCode;
  if (value == PaidMarketStatusTypeEnum.InvalidTransactionAmount.value)
    return PaidMarketStatusTypeEnum.InvalidTransactionAmount;
  return null;
}
