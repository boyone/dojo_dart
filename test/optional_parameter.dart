import 'package:test/test.dart';

void main() {
  test('optional parameter', () {
    expect(hello(), 'Hello, ');
    expect(hello(name: 'World'), 'Hello, World');
  });
}

String hello({String? name = ''}) {
  return 'Hello, $name';
}
