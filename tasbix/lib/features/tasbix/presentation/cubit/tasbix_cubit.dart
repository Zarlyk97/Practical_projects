import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasbix_state.dart';

class TasbixCubit extends Cubit<TasbixState> {
  TasbixCubit() : super(const TasbixState());

  void increment() {
    final count = state.count + 1;
    final updatdState = TasbixState(count: count);
    emit(updatdState);
  }

  void reset() {
    const count = 0;
    const updatdState = TasbixState(count: count);
    emit(updatdState);
  }
}
