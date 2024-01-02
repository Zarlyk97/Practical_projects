import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'maine_screen_state.dart';

class MaineScreenCubit extends Cubit<MaineScreenState> {
  MaineScreenCubit() : super(MaineScreenInitial());
}
