import 'dart:async';

import 'package:test/test.dart';

void main() {
  test('plain', () {
    var actual = placeOrder('001', 3);

    expect(actual, isNot(equals('success')));
  });

  test('plain with callback', () {
    placeOrder('001', 3).then(expectAsync1((String result) {
      expect(result, 'success');
    }));
  });

  test('async await', () async {
    String actual = await placeOrder('001', 3);

    expect(actual, 'success');
  });
}

Future<String> placeOrder(String itemCode, int qty) {
  return Future.delayed(
    const Duration(milliseconds: 100),
    () => 'success',
  );
}
