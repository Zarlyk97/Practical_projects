import 'order.dart';
import 'order_manager.dart';
import 'product.dart';
import 'product_screen.dart';

void main() {
// продуктулардын тизмеси
  var product1 = Product(name: 'Нан', price: 35.5);
  var product2 = Product(name: 'Сүт', price: 50);
  var product3 = Product(name: 'Сыр', price: 250);
  var product4 = Product(name: 'Айран', price: 100);

  // Заказ түзүп, ага продукция кошуу
  var order = Order();
  order.addProduct(product1);
  order.addProduct(product2);
  order.addProduct(product4);

  //  Заказ тууралуу маалыматты көрсөтүү
  print('Заказ:');
  print(order.products);
  print('Жыйынтык: ${order.getTotal()}');

  // Заказ менеджерин түзүп, буйрутманы кошуу
  var manager = OrderManager();
  manager.addOrder(order);

  // Алуу жана баардык заказдарды чыгаруу
  print('');
  print('Баардык заказдар :');
  for (var o in manager.getAllOrders()) {
    print(o.products);
    print('Жыйынтык: ${o.getTotal()}');
  }

  // Корзинага товар кошуу
  var screen = ProductsScreen();
  screen.addToCart(product1);
  screen.addToCart(product3);

  // Корзинаны чыгаруу
  print('');
  print('Корзина:');
  print(screen.cart);
  print('Жыйынтык: ${screen.getTotal()}');
}
