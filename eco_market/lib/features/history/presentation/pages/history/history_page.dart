import 'package:auto_route/auto_route.dart';
import 'package:eco_market/config/config.dart';
import 'package:eco_market/features/cart/domain/entities/entity.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:eco_market/features/cart/presentation/cubit/cart_screen_state.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {
          // context.read<CartScreenCubit>().getOrders();
        },
        child: BlocBuilder<CartScreenCubit, CartScreenState>(
          builder: (context, state) {
            if (state is CartScreenLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartScreenLoaded) {
              // data = state.cart;
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 8,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () => bottomSheetHistory(context, data[index]),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          tileColor: const Color(0xffF8F8F8),
                          leading: SizedBox(
                            width: 44,
                            height: 44,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: AppColors.green),
                            ),
                          ),
                          title: Text(
                            'Заказа №${data[index].orderNumber}',
                            style: const TextStyle(
                              color: Color(0xFF1E1E1E),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            '${data[index].createdAt}',
                            style: const TextStyle(
                              color: Color(0xFFABABAD),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Text(
                            '${data[index].totalAmount} с',
                            style: const TextStyle(
                              color: Color(0xFF75DB1B),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
