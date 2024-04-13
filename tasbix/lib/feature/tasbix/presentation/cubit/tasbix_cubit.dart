// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tasbix/feature/tasbix/domain/repositories/repositories.dart';
import 'package:tasbix/feature/tasbix/presentation/pages/pages.dart';

part 'tasbix_state.dart';

class TasbixCubit extends Cubit<TasbixState> {
  TasbixCubit({
    required this.countRepository,
  }) : super(const TasbixState());

  final CountRepositoryInterface countRepository;

  int _counter = 0;
  int _currentIndex = 0;

  final List<TasbihModel> _tasbihList = [
    TasbihModel(arabic: "سبحان الله", cyrillic: "Субханаллах", count: 0),
    TasbihModel(arabic: "الحمد لله", cyrillic: "Альхамдулиллях", count: 0),
    TasbihModel(arabic: "الله أكبر", cyrillic: "Аллаху Акбар", count: 0),
    TasbihModel(arabic: "أستغفر الله", cyrillic: "Астагфируллах", count: 0),
  ];

  void increment() {
    final count = state.count + 1;
    final updatdState = TasbixState(count: count);
    emit(updatdState);

    countRepository.getCount();
    countRepository.setCount(count);
  }

  void reset() {
    const count = 0;
    const updatdState = TasbixState(count: count);
    emit(updatdState);
  }

  incrementCounter() {
    _counter++;
    _tasbihList[_currentIndex].count = _counter;
  }

  changeTasbihCard(int index) {
    _currentIndex = index;
    _counter = _tasbihList[index].count;
  }

  resetTasbihCounters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var tasbih in _tasbihList) {
      tasbih.count = 0;
      prefs.remove(tasbih.arabic);
    }

    await saveCountersToCache();
  }

  Future<void> loadCountersFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var tasbih in _tasbihList) {
      tasbih.count = prefs.getInt(tasbih.arabic) ?? 0;
    }
  }

  Future<void> saveCountersToCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    for (var tasbih in _tasbihList) {
      prefs.setInt(tasbih.arabic, tasbih.count);
    }
  }
}
