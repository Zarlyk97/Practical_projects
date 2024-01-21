import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/history/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'История заказов',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Сегодня'),
            Expanded(
              child: ListStyleWidget(
                onTap: () => bottomSheetHistory(context),
                leading: SizedBox(
                  width: 44,
                  height: 44,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: AppColors.green),
                  ),
                ),
                title: 'Заказа №345674',
                subtitle: '12:46',
                trailing: '340 с',
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
