import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:jpt_app/core/error/failures.dart';
import 'package:jpt_app/core/usecase.dart';
import 'package:jpt_app/features/app/domain/entities/item_list_data.dart';
import 'package:jpt_app/features/app/domain/usecases/get_item_list_data.dart';
import 'bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GetItemDataList getItemDataList;
  AppBloc({@required this.getItemDataList});

  @override
  AppState get initialState => Empty();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is GetDataListForItems) {
      yield Loading();
      final failureOrTrivia = await getItemDataList(
        NoParams(),
      );
      yield failureOrTrivia.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (itemDataList) => Loaded(itemDataList: itemDataList),
      );
    }
  }
}

Stream<AppState> _eitherLoadedOrErrorState(
  Either<Failure, ItemDataList> either,
) async* {
  yield either.fold(
    (failure) => Error(message: _mapFailureToMessage(failure)),
    (itemDataList) => Loaded(itemDataList: itemDataList),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Error';
    case CacheFaliure:
      return 'Cache Error';
    default:
      return 'Unexpected Error';
  }
}
