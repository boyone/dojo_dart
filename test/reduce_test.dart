import 'package:test/test.dart';

void main() {
  test('map reduce', () {
    var items = [Item(1, 20), Item(2, 30)];
    var actual = items.map((e) => e.qty * e.price).reduce((value, element) => value + element);
    expect(actual, 80);
  });
}

class Item {
  final int qty;
  final int price;

  Item(this.qty, this.price);
}
