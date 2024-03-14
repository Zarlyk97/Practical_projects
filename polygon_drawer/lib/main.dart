import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Провайдер для управления состоянием точек и линий
final polygonProvider =
    StateNotifierProvider<PolygonNotifier, PolygonState>((ref) {
  return PolygonNotifier();
});

// Модель данных для представления точек и линий
class PolygonState {
  final List<Offset> points;
  final List<Line> lines;

  PolygonState({this.points = const [], this.lines = const []});

  PolygonState copyWith({List<Offset>? points, List<Line>? lines}) {
    return PolygonState(
      points: points ?? this.points,
      lines: lines ?? this.lines,
    );
  }


// Класс для управления состоянием точек и линий
class PolygonNotifier extends StateNotifier<PolygonState> {
  PolygonNotifier() : super(PolygonState());

  void addPoint(Offset point) {
    final newPoints = [...state.points, point];
    final newLines = [...state.lines];

    if (newPoints.length >= 2) {
      newLines.add(Line(newPoints[newPoints.length - 2], point));
    }

    state = state.copyWith(points: newPoints, lines: newLines);
  }
}

class Line {
  final Offset start;
  final Offset end;

  Line(this.start, this.end);
}

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Polygon Drawing App',
      home: HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final polygonState = ref.watch(polygonProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Polygon Drawing'),
      ),
      body: GestureDetector(
        onPanDown: (details) {
          ref.read(polygonProvider.notifier).addPoint(details.localPosition);
        },
        child: CustomPaint(
          painter: PolygonPainter(polygonState),
        ),
      ),
    );
  }
}

class PolygonPainter extends CustomPainter {
  final PolygonState polygonState;

  PolygonPainter(this.polygonState);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    for (var line in polygonState.lines) {
      canvas.drawLine(line.start, line.end, paint);
    }

    final pointPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 8;

    for (var point in polygonState.points) {
      canvas.drawCircle(point, 4, pointPaint);
    }
  }

  @override
  bool shouldRepaint(PolygonPainter oldDelegate) => true;
}
}