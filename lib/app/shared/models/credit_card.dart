import 'package:bankapp/app/core/exports.dart';

class CreditCard extends Equatable {
  final String cardNumber;
  final String expirationDate;
  final String cardName;
  final String cvvCode;

  const CreditCard({
    required this.cardNumber,
    required this.expirationDate,
    required this.cardName,
    required this.cvvCode,
  });

  Map<String, dynamic> toMap() {
    return {
      'cardNumber': cardNumber,
      'expirationDate': expirationDate,
      'cardName': cardName,
      'cvvCode': cvvCode,
    };
  }

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    return CreditCard(
      cardNumber: map['cardNumber'] ?? '',
      expirationDate: map['expirationDate'] ?? '',
      cardName: map['cardName'] ?? '',
      cvvCode: map['cvvCode'] ?? '',
    );
  }

  @override
  List<Object?> get props => [cardNumber, expirationDate, cardName, cvvCode];
}
