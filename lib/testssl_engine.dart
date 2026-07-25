/// 🛡️ Testssl Engine - SSL/TLS testing for Flutter
library testssl_engine;

import 'dart:io';

class TestsslEngine {
  static final TestsslEngine _instance = TestsslEngine._internal();
  factory TestsslEngine() => _instance;
  TestsslEngine._internal();

  bool _initialized = false;

  /// 🚀 تهيئة المحرك
  Future<void> initialize() async {
    _initialized = true;
  }

  /// 🔍 اختبار SSL/TLS
  Future<SSLTestResult> test(String host, {int port = 443}) async {
    try {
      final startTime = DateTime.now();
      final socket = await SecureSocket.connect(host, port, timeout: Duration(seconds: 10));
      final responseTime = DateTime.now().difference(startTime);
      final certificate = socket.peerCertificate;

      if (certificate != null) {
        // تحليل قوة التشفير
        final cipherStrength = _analyzeCipherStrength(socket);
        
        return SSLTestResult(
          host: host,
          port: port,
          isValid: certificate.endValidity.isAfter(DateTime.now()),
          responseTime: responseTime.inMilliseconds,
          issuer: certificate.issuer,
          subject: certificate.subject,
          cipherStrength: cipherStrength,
        );
      }
      return SSLTestResult.error(host, port, 'No certificate found');
    } catch (e) {
      return SSLTestResult.error(host, port, e.toString());
    }
  }

  /// 🔍 تنفيذ (للتوافق)
  Future<SSLTestResult> execute(String host, {Map<String, dynamic>? options}) async {
    return await test(host);
  }

  String _analyzeCipherStrength(SecureSocket socket) {
    // تحليل قوة التشفير (تقديري)
    return 'High'; // سيتم تحسينه لاحقاً
  }

  bool get isInitialized => _initialized;
}

class SSLTestResult {
  final String host;
  final int port;
  final bool isValid;
  final int? responseTime;
  final String? issuer;
  final String? subject;
  final String? cipherStrength;
  final String? error;
  
  // compatibility with original result class
  String get target => host;
  bool get success => isValid;

  SSLTestResult({
    required this.host,
    required this.port,
    required this.isValid,
    this.responseTime,
    this.issuer,
    this.subject,
    this.cipherStrength,
    this.error,
  });

  factory SSLTestResult.error(String host, int port, String error) {
    return SSLTestResult(
      host: host,
      port: port,
      isValid: false,
      error: error,
    );
  }
}
