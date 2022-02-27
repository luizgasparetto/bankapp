import 'package:bankapp/app/core/exports.dart';

class Extract extends Equatable {
  final String purchaseTitle;
  final String purchaseDescription;
  final double purchaseValue;
  final String purchaseDate;

  const Extract({
    required this.purchaseTitle,
    required this.purchaseDescription,
    required this.purchaseValue,
    required this.purchaseDate,
  });

  factory Extract.fromMap(Map<String, dynamic> map) {
    return Extract(
      purchaseTitle: map['purchaseTitle'] ?? '',
      purchaseDescription: map['purchaseDescription'] ?? '',
      purchaseValue: map['purchaseValue']?.toDouble() ?? 0.0,
      purchaseDate: map['purchaseDate'] ?? '',
    );
  }

  Extract copyWith({
    String? purchaseTitle,
    String? purchaseDescription,
    double? purchaseValue,
    String? purchaseDate,
  }) {
    return Extract(
      purchaseTitle: purchaseTitle ?? this.purchaseTitle,
      purchaseDescription: purchaseDescription ?? this.purchaseDescription,
      purchaseValue: purchaseValue ?? this.purchaseValue,
      purchaseDate: purchaseDate ?? this.purchaseDate,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
