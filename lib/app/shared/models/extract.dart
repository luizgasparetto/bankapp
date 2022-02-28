import 'package:bankapp/app/core/exports.dart';

class Statement extends Equatable {
  final String purchaseTitle;
  final String purchaseDescription;
  final double purchaseValue;
  final String purchaseDate;

  const Statement({
    required this.purchaseTitle,
    required this.purchaseDescription,
    required this.purchaseValue,
    required this.purchaseDate,
  });

  factory Statement.fromMap(Map<String, dynamic> map) {
    return Statement(
      purchaseTitle: map['purchaseTitle'] ?? '',
      purchaseDescription: map['purchaseDescription'] ?? '',
      purchaseValue: map['purchaseValue']?.toDouble() ?? 0.0,
      purchaseDate: map['purchaseDate'] ?? '',
    );
  }

  Statement copyWith({
    String? purchaseTitle,
    String? purchaseDescription,
    double? purchaseValue,
    String? purchaseDate,
  }) {
    return Statement(
      purchaseTitle: purchaseTitle ?? this.purchaseTitle,
      purchaseDescription: purchaseDescription ?? this.purchaseDescription,
      purchaseValue: purchaseValue ?? this.purchaseValue,
      purchaseDate: purchaseDate ?? this.purchaseDate,
    );
  }

  @override
  List<Object?> get props =>
      [purchaseTitle, purchaseDescription, purchaseValue, purchaseDate];
}
