import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_screen_state.dart';

class InfoScreenCubit extends Cubit<InfoScreenState> {
  InfoScreenCubit() : super(InfoScreenInitial());
}
