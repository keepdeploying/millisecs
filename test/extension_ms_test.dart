import 'package:flutter_test/flutter_test.dart';
import 'package:ms/ms.dart';

void main() {
  group('"string".parseMS()', () {
    test('should not throw an error', () {
      expect(() => '1m'.parseMS(), returnsNormally);
    });

    test('should preserve ms', () {
      expect('100'.parseMS(), 100);
    });

    test('should convert from m to ms', () {
      expect('1m'.parseMS(), 60000);
    });

    test('should convert from h to ms', () {
      expect('1h'.parseMS(), 3600000);
    });

    test('should convert d to ms', () {
      expect('2d'.parseMS(), 172800000);
    });

    test('should convert w to ms', () {
      expect('3w'.parseMS(), 1814400000);
    });

    test('should convert s to ms', () {
      expect('1s'.parseMS(), 1000);
    });

    test('should convert ms to ms', () {
      expect('100ms'.parseMS(), 100);
    });

    test('should convert y to ms', () {
      expect('1y'.parseMS(), 31557600000);
    });

    test('should work with ms', () {
      expect('1.5h'.parseMS(), 5400000);
    });

    test('should work with multiple spaces', () {
      expect('1   s'.parseMS(), 1000);
    });

    test('should be case-insensitive', () {
      expect('1.5H'.parseMS(), 5400000);
    });

    test('should work with numbers starting with .', () {
      expect('.5ms'.parseMS(), 0.5);
    });

    test('should work with negative integers', () {
      expect('-100ms'.parseMS(), -100);
    });

    test('should work with negative decimals', () {
      expect('-1.5h'.parseMS(), -5400000);
      expect('-10.5h'.parseMS(), -37800000);
    });

    test('should work with negative decimals starting with "."', () {
      expect('-.5h'.parseMS(), -1800000);
    });
  });

  group('"long string".parseMS()', () {
    test('should not throw an error', () {
      expect(() => '53 milliseconds'.parseMS(), returnsNormally);
    });

    test('should convert milliseconds to ms', () {
      expect('53 milliseconds'.parseMS(), 53);
    });

    test('should convert msecs to ms', () {
      expect('17 msecs'.parseMS(), 17);
    });

    test('should convert sec to ms', () {
      expect('1 sec'.parseMS(), 1000);
    });

    test('should convert from min to ms', () {
      expect('1 min'.parseMS(), 60000);
    });

    test('should convert from hr to ms', () {
      expect('1 hr'.parseMS(), 3600000);
    });

    test('should convert days to ms', () {
      expect('2 days'.parseMS(), 172800000);
    });

    test('should convert weeks to ms', () {
      expect('1 week'.parseMS(), 604800000);
    });

    test('should convert years to ms', () {
      expect('1 year'.parseMS(), 31557600000);
    });

    test('should work with decimals', () {
      expect('1.5 hours'.parseMS(), 5400000);
    });

    test('should work with negative integers', () {
      expect('-100 milliseconds'.parseMS(), -100);
    });

    test('should work with negative decimals', () {
      expect('-1.5 hours'.parseMS(), -5400000);
    });

    test('should work with negative decimals starting with "."', () {
      expect('-.5 hr'.parseMS(), -1800000);
    });
  });

  group('number.formatMS(long: true)', () {
    test('should not throw an error', () {
      expect(() => 500.formatMS(long: true), returnsNormally);
    });

    test('should support milliseconds', () {
      expect(500.formatMS(long: true), '500 ms');
      expect((-500).formatMS(long: true), '-500 ms');
    });

    test('should support seconds', () {
      expect(1000.formatMS(long: true), '1 second');
      expect(1200.formatMS(long: true), '1 second');
      expect(10000.formatMS(long: true), '10 seconds');
      expect((-1000).formatMS(long: true), '-1 second');
      expect((-1200).formatMS(long: true), '-1 second');
      expect((-10000).formatMS(long: true), '-10 seconds');
    });

    test('should support minutes', () {
      expect((60 * 1000).formatMS(long: true), '1 minute');
      expect((60 * 1200).formatMS(long: true), '1 minute');
      expect((60 * 10000).formatMS(long: true), '10 minutes');
      expect((-1 * 60 * 1000).formatMS(long: true), '-1 minute');
      expect((-1 * 60 * 1200).formatMS(long: true), '-1 minute');
      expect((-1 * 60 * 10000).formatMS(long: true), '-10 minutes');
    });

    test('should support hours', () {
      expect((60 * 60 * 1000).formatMS(long: true), '1 hour');
      expect((60 * 60 * 1200).formatMS(long: true), '1 hour');
      expect((60 * 60 * 10000).formatMS(long: true), '10 hours');
      expect((-1 * 60 * 60 * 1000).formatMS(long: true), '-1 hour');
      expect((-1 * 60 * 60 * 1200).formatMS(long: true), '-1 hour');
      expect((-1 * 60 * 60 * 10000).formatMS(long: true), '-10 hours');
    });

    test('should support days', () {
      expect((24 * 60 * 60 * 1000).formatMS(long: true), '1 day');
      expect((24 * 60 * 60 * 1200).formatMS(long: true), '1 day');
      expect((24 * 60 * 60 * 5000).formatMS(long: true), '5 days');
      expect((-1 * 24 * 60 * 60 * 1000).formatMS(long: true), '-1 day');
      expect((-1 * 24 * 60 * 60 * 1200).formatMS(long: true), '-1 day');
      expect((-1 * 24 * 60 * 60 * 5000).formatMS(long: true), '-5 days');
    });

    test('should support weeks', () {
      expect((7 * 24 * 60 * 60 * 1000).formatMS(long: true), '1 week');
      expect((7 * 24 * 60 * 60 * 1200).formatMS(long: true), '1 week');
      expect((7 * 24 * 60 * 60 * 10000).formatMS(long: true), '10 weeks');
      expect((-1 * 7 * 24 * 60 * 60 * 1000).formatMS(long: true), '-1 week');
      expect((-1 * 7 * 24 * 60 * 60 * 1200).formatMS(long: true), '-1 week');
      expect((-1 * 7 * 24 * 60 * 60 * 10000).formatMS(long: true), '-10 weeks');
    });

    test('should support years', () {
      expect((365.25 * 24 * 60 * 60 * 1000).formatMS(long: true), '1 year');
      expect((365.25 * 24 * 60 * 60 * 1200).formatMS(long: true), '1 year');
      expect((365.25 * 24 * 60 * 60 * 10000).formatMS(long: true), '10 years');
      expect(
          (-1 * 365.25 * 24 * 60 * 60 * 1000).formatMS(long: true), '-1 year');
      expect(
          (-1 * 365.25 * 24 * 60 * 60 * 1200).formatMS(long: true), '-1 year');
      expect(
        (-1 * 365.25 * 24 * 60 * 60 * 10000).formatMS(long: true),
        '-10 years',
      );
    });

    test('should round', () {
      expect((234234234).formatMS(long: true), '3 days');
      expect((-234234234).formatMS(long: true), '-3 days');
    });
  });

  group('number.formatMS()', () {
    test('should not throw an error', () {
      expect(() => (500).formatMS(), returnsNormally);
    });

    test('should support milliseconds', () {
      expect(500.formatMS(), '500ms');
      expect((-500).formatMS(), '-500ms');
    });

    test('should support seconds', () {
      expect(1000.formatMS(), '1s');
      expect(10000.formatMS(), '10s');
      expect((-1000).formatMS(), '-1s');
      expect((-10000).formatMS(), '-10s');
    });

    test('should support minutes', () {
      expect((60 * 1000).formatMS(), '1m');
      expect((60 * 10000).formatMS(), '10m');
      expect((-1 * 60 * 1000).formatMS(), '-1m');
      expect((-1 * 60 * 10000).formatMS(), '-10m');
    });

    test('should support hours', () {
      expect((60 * 60 * 1000).formatMS(), '1h');
      expect((60 * 60 * 10000).formatMS(), '10h');
      expect((-1 * 60 * 60 * 1000).formatMS(), '-1h');
      expect((-1 * 60 * 60 * 10000).formatMS(), '-10h');
    });

    test('should support days', () {
      expect((24 * 60 * 60 * 1000).formatMS(), '1d');
      expect((24 * 60 * 60 * 5000).formatMS(), '5d');
      expect((-1 * 24 * 60 * 60 * 1000).formatMS(), '-1d');
      expect((-1 * 24 * 60 * 60 * 5000).formatMS(), '-5d');
    });

    test('should support weeks', () {
      expect((7 * 24 * 60 * 60 * 1000).formatMS(), '1w');
      expect((7 * 24 * 60 * 60 * 10000).formatMS(), '10w');
      expect((-1 * 7 * 24 * 60 * 60 * 1000).formatMS(), '-1w');
      expect((-1 * 7 * 24 * 60 * 60 * 10000).formatMS(), '-10w');
    });

    test('should support years', () {
      expect((365.25 * 24 * 60 * 60 * 1000).formatMS(), '1y');
      expect((365.25 * 24 * 60 * 60 * 10000).formatMS(), '10y');
      expect((-1 * 365.25 * 24 * 60 * 60 * 1000).formatMS(), '-1y');
      expect((-1 * 365.25 * 24 * 60 * 60 * 10000).formatMS(), '-10y');
    });

    test('should round', () {
      expect((234234234).formatMS(), '3d');
      expect((-234234234).formatMS(), '-3d');
    });
  });

  group('"string".tryParseMS()', () {
    test('should return expected values with valid inputs', () {
      expect('100'.tryParseMS(), 100);
      expect('2d'.tryParseMS(), 172800000);
      expect('1y'.tryParseMS(), 31557600000);
      expect('1.5H'.tryParseMS(), 5400000);
      expect('-.5 hr'.tryParseMS(), -1800000);
    });

    test('should return null with invalid inputs', () {
      expect(''.tryParseMS(), null);
      expect('🎯'.tryParseMS(), null);
      expect('foo'.tryParseMS(), null);
      expect('10-.5'.tryParseMS(), null);
    });
  });

  group('number.tryFormatMS()', () {
    test('should return expected values with valid inputs', () {
      expect(10000.tryFormatMS(long: true), '10 seconds');
      expect((-1 * 24 * 60 * 60 * 10000).tryFormatMS(long: true), '-1 week');
      expect((-500).tryFormatMS(), '-500ms');
      expect((-1 * 60 * 60 * 1000).tryFormatMS(), '-1h');
    });

    test('should return null with invalid inputs', () {
      expect(double.infinity.tryFormatMS(), null);
      expect(double.nan.tryFormatMS(), null);
    });
  });

  group('(invalid inputs).parseMS/formatMS', () {
    test('should throw an error, when on empty strings', () {
      expect(() => ''.parseMS(), throwsArgumentError);
    });

    test('should throw an error, when parse non-numeric strings', () {
      expect(() => '🎯'.parseMS(), throwsArgumentError);
      expect(() => 'foo'.parseMS(), throwsArgumentError);
    });

    test('should throw an error, when parse invalid numeric symbols combo', () {
      expect(() => '10-.5'.parseMS(), throwsArgumentError);
    });

    test('should throw an error if Infinity or NaN is to be formatted', () {
      expect(() => double.infinity.formatMS(), throwsArgumentError);
      expect(() => double.nan.formatMS(), throwsArgumentError);
    });
  });
}
