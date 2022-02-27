part of 'creditcards_bloc.dart';

abstract class CreditCardsEvent extends Equatable {
  const CreditCardsEvent();

  @override
  List<Object> get props => [];
}

class CreditCardsFetchEvent extends CreditCardsEvent {}
