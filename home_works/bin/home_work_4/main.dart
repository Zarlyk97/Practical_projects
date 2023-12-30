import 'order_manager_model.dart';
import 'product_model.dart';
import 'product_screen_model.dart';

void main() {
// продуктулардын тизмеси
  var product1 = Product(name: 'Нан', price: 33);

  var product2 = Product(name: 'Сүт', price: 33);

  var product3 = Product(name: 'Сыр', price: 828);

  // Заказ түзүп, ага продукция кошуу
  var order = OrderManager();
  order.addOrder(product1);
  order.addOrder(product2);
  order.addOrder(product3);

  //  Заказ тууралуу маалыматты көрсөтүү
  // print('Заказ:');
  // print(order.orders);
  // print('Жыйынтык: ${order.()}');

  // Заказ менеджерин түзүп, буйрутманы кошуу

  // Алуу жана баардык заказдарды чыгаруу
  print('');
  print('Result: ${order.getTotalPrice()}');
  // for (var o in order.orders) {
  //   // print(o.);
  //   print('Жыйынтык: ${)}');
  // }

  // Корзинага товар кошуу
  var screen = ProductsScreen();
  screen.addToCart(product1);
  screen.addToCart(product3);

  // Корзинаны чыгаруу
  // print('');
  // print('Корзина:');
  // print(screen.cart);
  // print('Жыйынтык: ${screen.getTotal()}');
}
