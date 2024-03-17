import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tasbix_state.dart';

class TasbixCubit extends Cubit<TasbixState> {
  TasbixCubit() : super(TasbixInitial());
}
