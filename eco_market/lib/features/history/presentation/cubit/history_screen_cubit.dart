import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'history_screen_state.dart';

class StoryScreenCubit extends Cubit<StoryScreenState> {
  StoryScreenCubit() : super(StoryScreenInitial());
}
