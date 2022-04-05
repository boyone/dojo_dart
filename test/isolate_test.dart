import 'dart:io';
import 'dart:isolate';

import 'package:test/test.dart';

void main() {
  test('isolate', () async {
    String expected = 'Hello, World';
    var receivePort = ReceivePort();

    // update data
    Isolate isolate = await Isolate.spawn(updateData, receivePort.sendPort);

    // continue
    print('do something');
    sleep(Duration(milliseconds: 700));
    var message = await receivePort.first;
    isolate.kill(priority: Isolate.immediate);

    expect(message, expected);
  });
}

void updateData(SendPort sendPort) {
  sleep(Duration(milliseconds: 300));
  sendPort.send('Hello, World');
}
