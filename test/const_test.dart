import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('const', () {
    final User u = User('boyone');
    u.name = 'boytwo';

    expect(u.name, 'boytwo');
  });
}

class User {
  String name;

  User(this.name);
}
