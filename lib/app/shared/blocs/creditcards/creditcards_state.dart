part of 'creditcards_bloc.dart';

abstract class CreditCardsState extends Equatable {
  const CreditCardsState();

  @override
  List<Object> get props => [];
}

class CreditCardsLoadingState extends CreditCardsState {}

class CreditCardsLoadedState extends CreditCardsState {
  final List creditCards;

  const CreditCardsLoadedState(this.creditCards);

  @override
  List<Object> get props => [creditCards];
}

class CreditCardsErrorState extends CreditCardsState {}
