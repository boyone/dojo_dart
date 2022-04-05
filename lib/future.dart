import 'dart:io';

Future<String> placeOrder(String itemCode, int qty) {
  return Future.delayed(
    const Duration(milliseconds: 100),
    () => 'success',
  );
}

void main(List<String> args) {
  String? result;
  placeOrder('001', 3).then((value) => result = value);
  print('waiting...');
  sleep(
    const Duration(milliseconds: 1000),
  );
  print('waiting...');
  print(result);
}
