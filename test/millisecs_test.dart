import 'package:flutter_test/flutter_test.dart';
import 'package:millisecs/millisecs.dart';

void main() {
  group('ms(string)', () {
    test('should not throw an error', () {
      expect(() => ms('1m'), returnsNormally);
    });

    test('should preserve ms', () {
      expect(ms('100'), 100);
    });

    test('should convert from m to ms', () {
      expect(ms('1m'), 60000);
    });

    test('should convert from h to ms', () {
      expect(ms('1h'), 3600000);
    });

    test('should convert d to ms', () {
      expect(ms('2d'), 172800000);
    });

    test('should convert w to ms', () {
      expect(ms('3w'), 1814400000);
    });

    test('should convert s to ms', () {
      expect(ms('1s'), 1000);
    });

    test('should convert ms to ms', () {
      expect(ms('100ms'), 100);
    });

    test('should convert y to ms', () {
      expect(ms('1y'), 31557600000);
    });

    test('should work with ms', () {
      expect(ms('1.5h'), 5400000);
    });

    test('should work with multiple spaces', () {
      expect(ms('1   s'), 1000);
    });

    test('should be case-insensitive', () {
      expect(ms('1.5H'), 5400000);
    });

    test('should work with numbers starting with .', () {
      expect(ms('.5ms'), 0.5);
    });

    test('should work with negative integers', () {
      expect(ms('-100ms'), -100);
    });

    test('should work with negative decimals', () {
      expect(ms('-1.5h'), -5400000);
      expect(ms('-10.5h'), -37800000);
    });

    test('should work with negative decimals starting with "."', () {
      expect(ms('-.5h'), -1800000);
    });
  });

  group('ms(long string)', () {
    test('should not throw an error', () {
      expect(() => ms('53 milliseconds'), returnsNormally);
    });

    test('should convert milliseconds to ms', () {
      expect(ms('53 milliseconds'), 53);
    });

    test('should convert msecs to ms', () {
      expect(ms('17 msecs'), 17);
    });

    test('should convert sec to ms', () {
      expect(ms('1 sec'), 1000);
    });

    test('should convert from min to ms', () {
      expect(ms('1 min'), 60000);
    });

    test('should convert from hr to ms', () {
      expect(ms('1 hr'), 3600000);
    });

    test('should convert days to ms', () {
      expect(ms('2 days'), 172800000);
    });

    test('should convert weeks to ms', () {
      expect(ms('1 week'), 604800000);
    });

    test('should convert years to ms', () {
      expect(ms('1 year'), 31557600000);
    });

    test('should work with decimals', () {
      expect(ms('1.5 hours'), 5400000);
    });

    test('should work with negative integers', () {
      expect(ms('-100 milliseconds'), -100);
    });

    test('should work with negative decimals', () {
      expect(ms('-1.5 hours'), -5400000);
    });

    test('should work with negative decimals starting with "."', () {
      expect(ms('-.5 hr'), -1800000);
    });
  });

  group('ms(number, long: true)', () {
    test('should not throw an error', () {
      expect(() => ms(500, long: true), returnsNormally);
    });

    test('should support milliseconds', () {
      expect(ms(500, long: true), '500 ms');
      expect(ms(-500, long: true), '-500 ms');
    });

    test('should support seconds', () {
      expect(ms(1000, long: true), '1 second');
      expect(ms(1200, long: true), '1 second');
      expect(ms(10000, long: true), '10 seconds');
      expect(ms(-1000, long: true), '-1 second');
      expect(ms(-1200, long: true), '-1 second');
      expect(ms(-10000, long: true), '-10 seconds');
    });

    test('should support minutes', () {
      expect(ms(60 * 1000, long: true), '1 minute');
      expect(ms(60 * 1200, long: true), '1 minute');
      expect(ms(60 * 10000, long: true), '10 minutes');
      expect(ms(-1 * 60 * 1000, long: true), '-1 minute');
      expect(ms(-1 * 60 * 1200, long: true), '-1 minute');
      expect(ms(-1 * 60 * 10000, long: true), '-10 minutes');
    });

    test('should support hours', () {
      expect(ms(60 * 60 * 1000, long: true), '1 hour');
      expect(ms(60 * 60 * 1200, long: true), '1 hour');
      expect(ms(60 * 60 * 10000, long: true), '10 hours');
      expect(ms(-1 * 60 * 60 * 1000, long: true), '-1 hour');
      expect(ms(-1 * 60 * 60 * 1200, long: true), '-1 hour');
      expect(ms(-1 * 60 * 60 * 10000, long: true), '-10 hours');
    });

    test('should support days', () {
      expect(ms(24 * 60 * 60 * 1000, long: true), '1 day');
      expect(ms(24 * 60 * 60 * 1200, long: true), '1 day');
      expect(ms(24 * 60 * 60 * 5000, long: true), '5 days');
      expect(ms(-1 * 24 * 60 * 60 * 1000, long: true), '-1 day');
      expect(ms(-1 * 24 * 60 * 60 * 1200, long: true), '-1 day');
      expect(ms(-1 * 24 * 60 * 60 * 5000, long: true), '-5 days');
    });

    test('should support weeks', () {
      expect(ms(7 * 24 * 60 * 60 * 1000, long: true), '1 week');
      expect(ms(7 * 24 * 60 * 60 * 1200, long: true), '1 week');
      expect(ms(7 * 24 * 60 * 60 * 10000, long: true), '10 weeks');
      expect(ms(-1 * 7 * 24 * 60 * 60 * 1000, long: true), '-1 week');
      expect(ms(-1 * 7 * 24 * 60 * 60 * 1200, long: true), '-1 week');
      expect(ms(-1 * 7 * 24 * 60 * 60 * 10000, long: true), '-10 weeks');
    });

    test('should support years', () {
      expect(ms(365.25 * 24 * 60 * 60 * 1000, long: true), '1 year');
      expect(ms(365.25 * 24 * 60 * 60 * 1200, long: true), '1 year');
      expect(ms(365.25 * 24 * 60 * 60 * 10000, long: true), '10 years');
      expect(ms(-1 * 365.25 * 24 * 60 * 60 * 1000, long: true), '-1 year');
      expect(ms(-1 * 365.25 * 24 * 60 * 60 * 1200, long: true), '-1 year');
      expect(
        ms(-1 * 365.25 * 24 * 60 * 60 * 10000, long: true),
        '-10 years',
      );
    });

    test('should round', () {
      expect(ms(234234234, long: true), '3 days');
      expect(ms(-234234234, long: true), '-3 days');
    });
  });

  group('ms(number)', () {
    test('should not throw an error', () {
      expect(() => ms(500), returnsNormally);
    });

    test('should support milliseconds', () {
      expect(ms(500), '500ms');
      expect(ms(-500), '-500ms');
    });

    test('should support seconds', () {
      expect(ms(1000), '1s');
      expect(ms(10000), '10s');
      expect(ms(-1000), '-1s');
      expect(ms(-10000), '-10s');
    });

    test('should support minutes', () {
      expect(ms(60 * 1000), '1m');
      expect(ms(60 * 10000), '10m');
      expect(ms(-1 * 60 * 1000), '-1m');
      expect(ms(-1 * 60 * 10000), '-10m');
    });

    test('should support hours', () {
      expect(ms(60 * 60 * 1000), '1h');
      expect(ms(60 * 60 * 10000), '10h');
      expect(ms(-1 * 60 * 60 * 1000), '-1h');
      expect(ms(-1 * 60 * 60 * 10000), '-10h');
    });

    test('should support days', () {
      expect(ms(24 * 60 * 60 * 1000), '1d');
      expect(ms(24 * 60 * 60 * 5000), '5d');
      expect(ms(-1 * 24 * 60 * 60 * 1000), '-1d');
      expect(ms(-1 * 24 * 60 * 60 * 5000), '-5d');
    });

    test('should support weeks', () {
      expect(ms(7 * 24 * 60 * 60 * 1000), '1w');
      expect(ms(7 * 24 * 60 * 60 * 10000), '10w');
      expect(ms(-1 * 7 * 24 * 60 * 60 * 1000), '-1w');
      expect(ms(-1 * 7 * 24 * 60 * 60 * 10000), '-10w');
    });

    test('should support years', () {
      expect(ms(365.25 * 24 * 60 * 60 * 1000), '1y');
      expect(ms(365.25 * 24 * 60 * 60 * 10000), '10y');
      expect(ms(-1 * 365.25 * 24 * 60 * 60 * 1000), '-1y');
      expect(ms(-1 * 365.25 * 24 * 60 * 60 * 10000), '-10y');
    });

    test('should round', () {
      expect(ms(234234234), '3d');
      expect(ms(-234234234), '-3d');
    });
  });

  group('tryMS(string)', () {
    test('should return expected values with valid inputs', () {
      expect(tryMS('100'), 100);
      expect(tryMS('2d'), 172800000);
      expect(tryMS('1y'), 31557600000);
      expect(tryMS('1.5H'), 5400000);
      expect(tryMS('-.5 hr'), -1800000);
    });

    test('should return null with invalid inputs', () {
      expect(tryMS(''), null);
      expect(tryMS('🎯'), null);
      expect(tryMS('foo'), null);
      expect(tryMS('10-.5'), null);
    });
  });

  group('tryMS(number)', () {
    test('should return expected values with valid inputs', () {
      expect(tryMS(10000, long: true), '10 seconds');
      expect(tryMS(-1 * 24 * 60 * 60 * 10000, long: true), '-1 week');
      expect(tryMS(-500), '-500ms');
      expect(tryMS(-1 * 60 * 60 * 1000), '-1h');
    });

    test('should return null with invalid inputs', () {
      expect(tryMS(double.infinity), null);
      expect(tryMS(double.nan), null);
    });
  });

  group('ms(invalid inputs)', () {
    test('should throw an error, when ms("")', () {
      expect(() => ms(''), throwsArgumentError);
    });

    test('should throw an error, when parse non-numeric strings', () {
      expect(() => ms('🎯'), throwsArgumentError);
      expect(() => ms('foo'), throwsArgumentError);
    });

    test('should throw an error, when parse invalid numeric symbols combo', () {
      expect(() => ms('10-.5'), throwsArgumentError);
    });

    test('should throw an error if Infinity or NaN is provided', () {
      expect(() => ms(double.infinity), throwsArgumentError);
      expect(() => ms(double.nan), throwsArgumentError);
    });
  });
}
