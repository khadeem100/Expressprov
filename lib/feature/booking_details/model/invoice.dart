

import 'package:demandium_provider/feature/booking_details/model/provider.dart';

class Invoice {
  final InvoiceInfo? info;
  final Provider? provider;
  final List<InvoiceItem> ? items;

  const Invoice({
    this.info,
    this.provider,
    this.items,
  });
}

class InvoiceInfo {
  final String description;
  final String number;
  final DateTime date;
  final String paymentStatus;


  const InvoiceInfo({
    required this.description,
    required this.number,
    required this.date,
    required this.paymentStatus,
  });
}

class InvoiceItem {
  final String serviceName;
  final String variationName;
  final int quantity;
  final double ? discountAmount;
  final double ? tax;
  final double ? unitAllTotal;
  final double ? unitPrice;
  const InvoiceItem({
    required this.discountAmount,
    required this.tax,
    required this.serviceName,
    required this.variationName,
    required this.quantity,
    required this.unitAllTotal,
    required this.unitPrice,
  });
}

class InvoiceTotal {
  double allTotalAmountWithVatDis =0.0;
  double allTotal=0.0;
  double totalTax=0.0;
  double totalDiscount=0.0;
  InvoiceTotal({
    required this.allTotalAmountWithVatDis,
    required this.allTotal,
    required this.totalTax,
    required this.totalDiscount,
  });
}

