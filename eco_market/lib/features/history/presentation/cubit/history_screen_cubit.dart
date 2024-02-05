import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_screen_state.dart';

class StoryScreenCubit extends Cubit<StoryScreenState> {
  StoryScreenCubit() : super(StoryScreenInitial());
}
