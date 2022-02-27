import 'package:bankapp/app/core/exports.dart';
import 'package:bankapp/app/shared/repositories/firestore_repository.dart';
import 'package:bloc/bloc.dart';
import 'dart:developer' as dev;

part 'creditcards_event.dart';
part 'creditcards_state.dart';

class CreditCardsBloc extends Bloc<CreditCardsEvent, CreditCardsState> {
  CreditCardsBloc() : super(CreditCardsLoadingState()) {
    on<CreditCardsFetchEvent>((event, emit) async {
      try {
        final cardList = await GetIt.I<FirestoreRepository>().getCreditCards();
        emit(CreditCardsLoadedState(cardList));
      } catch (e, st) {
        emit(CreditCardsErrorState());
        dev.log('ERROR no CreditCardsBloc', error: e, stackTrace: st);
      }
    });
  }
}
