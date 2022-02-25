part of 'criptocoin_bloc.dart';

abstract class CriptoCoinEvent extends Equatable {
  const CriptoCoinEvent();

  @override
  List<Object> get props => [];
}

class CriptoCoinFetchedEvent extends CriptoCoinEvent {}
