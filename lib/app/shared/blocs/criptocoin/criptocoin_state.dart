part of 'criptocoin_bloc.dart';

abstract class CriptoCoinState extends Equatable {
  const CriptoCoinState();

  @override
  List<Object> get props => [];
}

class CriptoCoinLoadingState extends CriptoCoinState {}

class CriptoCoinLoadedState extends CriptoCoinState {
  final List<dynamic> coinList;

  const CriptoCoinLoadedState(this.coinList);

  @override
  List<Object> get props => [coinList];
}

class CriptoCoinErrorState extends CriptoCoinState {}
