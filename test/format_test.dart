import 'package:flutter_test/flutter_test.dart';
import 'package:ms/ms.dart';

void main() {
  group('format(number, long: true)', () {
    test('should not throw an error', () {
      expect(() => format(500, long: true), returnsNormally);
    });

    test('should support milliseconds', () {
      expect(format(500, long: true), '500 ms');
      expect(format(-500, long: true), '-500 ms');
    });

    test('should support seconds', () {
      expect(format(1000, long: true), '1 second');
      expect(format(1200, long: true), '1 second');
      expect(format(10000, long: true), '10 seconds');
      expect(format(-1000, long: true), '-1 second');
      expect(format(-1200, long: true), '-1 second');
      expect(format(-10000, long: true), '-10 seconds');
    });

    test('should support minutes', () {
      expect(format(60 * 1000, long: true), '1 minute');
      expect(format(60 * 1200, long: true), '1 minute');
      expect(format(60 * 10000, long: true), '10 minutes');
      expect(format(-1 * 60 * 1000, long: true), '-1 minute');
      expect(format(-1 * 60 * 1200, long: true), '-1 minute');
      expect(format(-1 * 60 * 10000, long: true), '-10 minutes');
    });

    test('should support hours', () {
      expect(format(60 * 60 * 1000, long: true), '1 hour');
      expect(format(60 * 60 * 1200, long: true), '1 hour');
      expect(format(60 * 60 * 10000, long: true), '10 hours');
      expect(format(-1 * 60 * 60 * 1000, long: true), '-1 hour');
      expect(format(-1 * 60 * 60 * 1200, long: true), '-1 hour');
      expect(format(-1 * 60 * 60 * 10000, long: true), '-10 hours');
    });

    test('should support days', () {
      expect(format(24 * 60 * 60 * 1000, long: true), '1 day');
      expect(format(24 * 60 * 60 * 1200, long: true), '1 day');
      expect(format(24 * 60 * 60 * 5000, long: true), '5 days');
      expect(format(-1 * 24 * 60 * 60 * 1000, long: true), '-1 day');
      expect(format(-1 * 24 * 60 * 60 * 1200, long: true), '-1 day');
      expect(format(-1 * 24 * 60 * 60 * 5000, long: true), '-5 days');
    });

    test('should support weeks', () {
      expect(format(7 * 24 * 60 * 60 * 1000, long: true), '1 week');
      expect(format(7 * 24 * 60 * 60 * 1200, long: true), '1 week');
      expect(format(7 * 24 * 60 * 60 * 10000, long: true), '10 weeks');
      expect(format(-1 * 7 * 24 * 60 * 60 * 1000, long: true), '-1 week');
      expect(format(-1 * 7 * 24 * 60 * 60 * 1200, long: true), '-1 week');
      expect(format(-1 * 7 * 24 * 60 * 60 * 10000, long: true), '-10 weeks');
    });

    test('should support years', () {
      expect(format(365.25 * 24 * 60 * 60 * 1000, long: true), '1 year');
      expect(format(365.25 * 24 * 60 * 60 * 1200, long: true), '1 year');
      expect(format(365.25 * 24 * 60 * 60 * 10000, long: true), '10 years');
      expect(format(-1 * 365.25 * 24 * 60 * 60 * 1000, long: true), '-1 year');
      expect(format(-1 * 365.25 * 24 * 60 * 60 * 1200, long: true), '-1 year');
      expect(
        format(-1 * 365.25 * 24 * 60 * 60 * 10000, long: true),
        '-10 years',
      );
    });

    test('should round', () {
      expect(format(234234234, long: true), '3 days');
      expect(format(-234234234, long: true), '-3 days');
    });
  });

  group('format(number)', () {
    test('should not throw an error', () {
      expect(() => format(500), returnsNormally);
    });

    test('should support milliseconds', () {
      expect(format(500), '500ms');
      expect(format(-500), '-500ms');
    });

    test('should support seconds', () {
      expect(format(1000), '1s');
      expect(format(10000), '10s');
      expect(format(-1000), '-1s');
      expect(format(-10000), '-10s');
    });

    test('should support minutes', () {
      expect(format(60 * 1000), '1m');
      expect(format(60 * 10000), '10m');
      expect(format(-1 * 60 * 1000), '-1m');
      expect(format(-1 * 60 * 10000), '-10m');
    });

    test('should support hours', () {
      expect(format(60 * 60 * 1000), '1h');
      expect(format(60 * 60 * 10000), '10h');
      expect(format(-1 * 60 * 60 * 1000), '-1h');
      expect(format(-1 * 60 * 60 * 10000), '-10h');
    });

    test('should support days', () {
      expect(format(24 * 60 * 60 * 1000), '1d');
      expect(format(24 * 60 * 60 * 5000), '5d');
      expect(format(-1 * 24 * 60 * 60 * 1000), '-1d');
      expect(format(-1 * 24 * 60 * 60 * 5000), '-5d');
    });

    test('should support weeks', () {
      expect(format(7 * 24 * 60 * 60 * 1000), '1w');
      expect(format(7 * 24 * 60 * 60 * 10000), '10w');
      expect(format(-1 * 7 * 24 * 60 * 60 * 1000), '-1w');
      expect(format(-1 * 7 * 24 * 60 * 60 * 10000), '-10w');
    });

    test('should support years', () {
      expect(format(365.25 * 24 * 60 * 60 * 1000), '1y');
      expect(format(365.25 * 24 * 60 * 60 * 10000), '10y');
      expect(format(-1 * 365.25 * 24 * 60 * 60 * 1000), '-1y');
      expect(format(-1 * 365.25 * 24 * 60 * 60 * 10000), '-10y');
    });

    test('should round', () {
      expect(format(234234234), '3d');
      expect(format(-234234234), '-3d');
    });
  });

  group('format(invalid inputs)', () {
    test('should throw an error if Infinity or NaN is provided', () {
      expect(() => format(double.infinity), throwsArgumentError);
      expect(() => format(double.nan), throwsArgumentError);
    });
  });

  group('tryFormat', () {
    test('should return expected values with valid inputs', () {
      expect(tryFormat(10000, long: true), '10 seconds');
      expect(tryFormat(-1 * 24 * 60 * 60 * 10000, long: true), '-1 week');
      expect(tryFormat(-500), '-500ms');
      expect(tryFormat(-1 * 60 * 60 * 1000), '-1h');
    });

    test('should return null with invalid inputs', () {
      expect(tryFormat(double.infinity), null);
      expect(tryFormat(double.nan), null);
    });
  });
}
