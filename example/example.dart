import 'package:testssl_engine/testssl_engine.dart';

void main() async {
  final engine = TestsslEngine();
  await engine.initialize();
  print('TestsslEngine is ready for tactical operations.');
}
