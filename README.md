# TestSSL Engine (`testssl_engine`)

> Comprehensive TLS/SSL Security Evaluator  
> **Author & Original Architect:** [Abdallah Fawzi Ali Mahmoud](https://github.com/AbdoFawzi777)  
> **Part of the RedOps Hub Monorepo Suite**

---

## 📌 Overview
`testssl_engine` is a production-grade, standalone Flutter package engineered for high-performance mobile security auditing. Built with pure Dart and native Flutter MethodChannels/Isolates, it delivers enterprise-level capability directly on Android & iOS devices without relying on external Linux command-line dependencies.

---

## 🚀 New Capabilities & Features (v2.0)
- **Security Grading System:** Provides overall TLS/SSL security grade (A+ to F rating) based on industry standards.
- **ALPN & Protocol Negotiation:** Tests HTTP/2, ALPN, and NPN protocol negotiation capabilities.
- **Client Simulation:** Simulates legacy and modern mobile/desktop clients to test handshake compatibility.
- **Executive PDF / JSON Reports:** Exports structured JSON and clean security assessment summaries.

---

## 🛠 Usage & Integration

Add `testssl_engine` to your Flutter `pubspec.yaml`:

```yaml
dependencies:
  testssl_engine:
    path: ../packages/testssl_engine
```

### Basic Example

```dart
import 'package:testssl_engine/testssl_engine.dart';

void main() async {
  final engine = TestSSLEngine();
  
  print('Starting TestSSL Engine audit...');
  final results = await engine.execute(
    target: '192.168.1.1',
  );
  
  print('Audit Complete!');
}
```

---

## 🔒 Security & Privacy
- **Zero Telemetry:** No analytics, tracking, or network calls home.
- **Encrypted Local Storage:** Integrates seamlessly with RedOps Hub AES-256 local database.
- **Thread Safety:** All heavy operations execute inside Dart Isolates to maintain 60fps UI rendering.

---

## 👤 Author & Copyright

**Abdallah Fawzi Ali Mahmoud**  
Lead Developer & Security Architect of RedOps Hub  
- **GitHub:** [@AbdoFawzi777](https://github.com/AbdoFawzi777)  
- **Telegram:** [@ABdo_FawZi1](https://telegram.me/ABdo_FawZi1)  
- **Website:** [RedOps Hub Platform](https://redops-hub.web.app)

*Copyright (c) 2026 Abdallah Fawzi Ali Mahmoud. All rights reserved.*
