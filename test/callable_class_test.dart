import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('callable class', () {
    var function = Hello();

    expect(function(), 'Hello');
  });
}

class Hello {
  String call() => 'Hello';
}
