import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:password_strength_checker/src/common/regex_expresions.dart';

part 'global_event.dart';
part 'global_state.dart';
part 'global_bloc.freezed.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(_Initial()) {
    on<GlobalEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SeePassword>((event, emit) {
      emit(state.copyWith(seePassword: event.viewPass));
      print(event.viewPass);
    });
    on<RequerimentsChecking>(
      (event, emit) {
        if (event.valueInput != "") {
          if (RegexPattern.containsMayus.hasMatch(event.valueInput)) {
            emit(state.copyWith(containsUppercaseLetter: true));
          } else {
            emit(state.copyWith(containsUppercaseLetter: false));
          }

          if (RegexPattern.containsMinus.hasMatch(event.valueInput)) {
            emit(state.copyWith(containsLowercaseLetter: true));
          } else {
            emit(state.copyWith(containsLowercaseLetter: false));
          }

          if (RegexPattern.containsNumbers.hasMatch(event.valueInput)) {
            emit(state.copyWith(containsNumbers: true));
          } else {
            emit(state.copyWith(containsNumbers: false));
          }

          if (RegexPattern.containsSymbols.hasMatch(event.valueInput)) {
            emit(state.copyWith(containsSymbols: true));
          } else {
            emit(state.copyWith(containsSymbols: false));
          }

          if (event.valueInput.toString().length < 8) {
            emit(state.copyWith(cantNecessaryCharacters: false));
          } else {
            emit(state.copyWith(cantNecessaryCharacters: true));
          }
        } else {
          emit(state.copyWith(
            cantNecessaryCharacters: false,
            containsLowercaseLetter: false,
            containsNumbers: false,
            containsSymbols: false,
            containsUppercaseLetter: false,
          ));
        }
      },
    );
  }
}
