import 'order_manager_model.dart';
import 'product_model.dart';
import 'product_screen_model.dart';

void main() {
// продуктулардын тизмеси
  var product1 = ProductModel(name: 'Нан', price: 35);

  var product2 = ProductModel(name: 'Сүт', price: 50);

  var product3 = ProductModel(name: 'Сыр', price: 270);

  var product4 = ProductModel(name: 'Картошка', price: 20);

  // Заказ түзүп, ага продукция кошуу
  var order = OrderManager();
  order.addOrder(product1);
  order.addOrder(product2);
  order.addOrder(product3);
  order.addOrder(product4);

  // Товарды алып салуу же өчүрүү

  order.removeOrder(product3);

  //  Заказ тууралуу маалыматты көрсөтүү
  print('Заказ:');
  print(order.getAllOrders());
  print('Result: ${order.getTotalPrice()}');

  // Корзинага товар кошуу
  var screen = ProductsScreenModel();
  screen.addToCart(product1);
  screen.addToCart(product2);
  screen.addToCart(product3);

  // Корзинаны чыгаруу
  print('');
  print('Корзина:');
  print(screen.cart);
  print('Result: ${screen.getTotal()}');
}
