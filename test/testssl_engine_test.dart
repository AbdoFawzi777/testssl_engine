import 'package:flutter_test/flutter_test.dart';
import 'package:testssl_engine/testssl_engine.dart';

void main() {
  test('TestsslEngine initialization test', () async {
    final engine = TestsslEngine();
    await engine.initialize();
    expect(engine.isInitialized, true);
  });
}
