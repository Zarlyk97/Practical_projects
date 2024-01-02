import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'busket_screen_state.dart';

class BusketScreenCubit extends Cubit<BusketScreenState> {
  BusketScreenCubit() : super(BusketScreenInitial());
}
