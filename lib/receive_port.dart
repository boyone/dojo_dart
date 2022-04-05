import 'dart:isolate';

Future<void> main(List<String> args) async {
  final data = await _parseInBackground();

  print('do something');

  // Use that data
  print('data = $data');
}

Future<String> _parseInBackground() async {
  print('parse in background');
  final p = ReceivePort();
  await Isolate.spawn(_readAndParseJson, p.sendPort);
  return await p.first;
}

Future _readAndParseJson(SendPort p) async {
  Isolate.exit(p, 'Hello');
}
