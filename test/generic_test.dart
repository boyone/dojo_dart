import 'package:test/test.dart';

void main() {
  test('generic create instance test', () {
    Item expectedT = Item('boyone');
    Repository<Item> itemRepository = Repository<Item>(Item('no name'));

    Item actualT = itemRepository.find('boyone');

    expect(actualT.name, expectedT.name);
  });
}

class Repository<T extends Super> {
  final T instance;

  Repository(this.instance);

  T find(String name) {
    Map<String, String> map = {'name': name};
    return instance.fromMap(map);
  }
}

abstract class Super<T> {
  T fromMap(Map<String, String> map);
}

class Item extends Super {
  final String name;

  Item(this.name);

  @override
  Item fromMap(Map<String, String> map) {
    String name = map['name'] ?? '';
    return Item(name);
  }
}
