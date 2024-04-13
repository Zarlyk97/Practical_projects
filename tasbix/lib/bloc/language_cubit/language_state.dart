part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class ChangeLanguageLoading extends LanguageState {}

class ChangeLanguageState extends LanguageState {
  final Locale locale;

  const ChangeLanguageState({required this.locale});
}
