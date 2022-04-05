import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('passing class to function', () {
    var f = Foo(10);

    assignValueToNumber(f);
    expect(f.number, 20);
    
    assignNewInstance(f);
    expect(f.number, 20);
  });
}

class Foo {
  int number;
  Foo(this.number);
}

void assignValueToNumber(Foo f) {
  f.number = 20;
}

void assignNewInstance(Foo f) {
  f = Foo(30);
}
