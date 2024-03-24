// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tasbix/feature/tasbix/domain/repositories/repositories.dart';

part 'tasbix_state.dart';

class TasbixCubit extends Cubit<TasbixState> {
  TasbixCubit({
    required this.countRepository,
  }) : super(const TasbixState());

  final CountRepositoryInterface countRepository;

  void increment() {
    final count = state.count + 1;
    final updatdState = TasbixState(count: count);
    emit(updatdState);

    countRepository.setCount(count);
  }

  void reset() {
    const count = 0;
    const updatdState = TasbixState(count: count);
    emit(updatdState);
  }
}
