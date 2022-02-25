import 'package:bankapp/app/shared/repositories/criptocoin_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'criptocoin_event.dart';
part 'criptocoin_state.dart';

class CriptoCoinBloc extends Bloc<CriptoCoinEvent, CriptoCoinState> {
  final CriptoCoinRepository _criptoCoinRepository;

  CriptoCoinBloc(CriptoCoinRepository criptoCoinRepository)
      : _criptoCoinRepository = criptoCoinRepository,
        super(CriptoCoinLoadingState()) {
    on<CriptoCoinFetchedEvent>((event, emit) async {
      try {
        final coinList = await _criptoCoinRepository.getCoins();
        emit(CriptoCoinLoadedState(coinList));
      } catch (e, st) {
        emit(CriptoCoinErrorState());
        dev.log('ERROR', error: e, stackTrace: st);
      }
    });
  }
}
