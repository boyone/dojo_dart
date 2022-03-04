const int x = 0;

String hello(int i) {
  var hex = 0xDEADBEEF;
  var exponent = 1.42e5;
  print(hex);
  print(exponent);
  return "hello $i";
}

void main() {
  print(hello(0));
}
