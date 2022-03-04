import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('passing class', () {
    var f = Foo(10);
    inner1(f);
    expect(f.x, 20);
    inner2(f);
    expect(f.x, 20);
  });
}

class Foo {
  int x;
  Foo(this.x);
}

void inner1(Foo f) {
  f.x = 20;
}

void inner2(Foo f) {
  f = Foo(30);
}
