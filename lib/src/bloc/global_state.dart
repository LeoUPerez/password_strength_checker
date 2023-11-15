part of 'global_bloc.dart';

@freezed
class GlobalState with _$GlobalState {
  const factory GlobalState.initial({
    @Default(false) bool seePassword,
    @Default(false) bool cantNecessaryCharacters,
    @Default(false) bool containsUppercaseLetter,
    @Default(false) bool containsLowercaseLetter,
    @Default(false) bool containsNumbers,
    @Default(false) bool containsSymbols,
  }) = _Initial;
}
