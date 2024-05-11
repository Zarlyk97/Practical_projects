class TasbihModel {
  final String arabic;
  final String cyrillic;
  int count;
  TasbihModel({
    required this.arabic,
    required this.cyrillic,
    required this.count,
  });
}

final List<TasbihModel> tasbihList = [
  TasbihModel(arabic: "سبحان الله", cyrillic: "СубханАллах", count: 0),
  TasbihModel(arabic: "الحمد لله", cyrillic: "Альхамдулиллях", count: 0),
  TasbihModel(arabic: "الله أكبر", cyrillic: "Аллаху Акбар", count: 0),
  TasbihModel(arabic: "أستغفر الله", cyrillic: "Астагфируллах", count: 0),
  TasbihModel(
      arabic: 'سبحان الله وبحمده',
      cyrillic: "СубханАллахи ва бихамдихи",
      count: 0),
  TasbihModel(
      arabic: 'سبحان الله العظيم', cyrillic: "СубханАллахил азиим ", count: 0),
];
