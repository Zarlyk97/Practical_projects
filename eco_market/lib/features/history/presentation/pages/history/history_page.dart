import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/cart/domain/entities/entity.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/history/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<OrderEntity> data = [];
  @override
  void initState() {
    super.initState();
    context.read<CartScreenCubit>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'История заказов',
            style: TextStyle(color: AppColors.black),
          ),
        ),
        body: BlocBuilder<CartScreenCubit, CartScreenState>(
            builder: (context, state) {
          if (state is CartScreenLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartScreenLoaded) {
            data = state.orders;
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Сегодня'),
                Expanded(
                  child: ListStyleWidget(
                    onTap: () => bottomSheetHistory(context, data[5]),
                    leading: SizedBox(
                      width: 44,
                      height: 44,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color: AppColors.green),
                      ),
                    ),
                    title: 'Заказа №${data[2].orderNumber}',
                    subtitle: '${data[3].createdAt}',
                    trailing: '${data[5].totalAmount} с',
                    itemCount: data.length,
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
