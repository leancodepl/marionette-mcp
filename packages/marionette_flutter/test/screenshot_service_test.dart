import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:marionette_flutter/marionette_flutter.dart';

void main() {
  group('ScreenshotService.calculateScaledSize', () {
    test('returns null when within limits', () {
      final size = ScreenshotService.calculateScaledSize(
        const Size(1000, 1000),
        const Size(2000, 2000),
      );

      expect(size, isNull);
    });

    test('scales down based on the wider dimension', () {
      final size = ScreenshotService.calculateScaledSize(
        const Size(4000, 2000),
        const Size(2000, 2000),
      );

      expect(size, const Size(2000, 1000));
    });

    test('scales down based on the taller dimension', () {
      final size = ScreenshotService.calculateScaledSize(
        const Size(2000, 4000),
        const Size(2000, 2000),
      );

      expect(size, const Size(1000, 2000));
    });
  });
}
