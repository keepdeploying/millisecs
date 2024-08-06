# millisecs

Converts various time formats to milliseconds and vice versa. Dart & Flutter adaptation of [Vercel's ms npm package](https://github.com/vercel/ms).

## Usage

### Import

```dart
import 'package:millisecs/millisecs.dart';
```

### Convert from Time Formats

```dart
ms('2 days');  // 172800000
ms('1d');      // 86400000
ms('10h');     // 36000000
ms('2.5 hrs'); // 9000000.0
ms('2h');      // 7200000
ms('1m');      // 60000
ms('5s');      // 5000
ms('1y');      // 31557600000.0
ms('100');     // 100
ms('-3 days'); // -259200000
ms('-1h');     // -3600000
ms('-200');    // -200
```

### Convert from Milliseconds

```dart
ms(60000);             // "1m"
ms(2 * 60000);         // "2m"
ms(-3 * 60000);        // "-3m"
ms(ms('10 hours'));    // "10h"
```

### Time Format Written-Out

```dart
ms(60000, long: true);             // "1 minute"
ms(2 * 60000, long: true);         // "2 minutes"
ms(-3 * 60000, long: true);        // "-3 minutes"
ms(ms('10 hours'), long: true);    // "10 hours"
```

### `parse` and `format`

```dart
parse('1h');                     // 3600000
format(2000);                    // "2s"
format(2000, long: true);        // "2 seconds"

tryParse('1h');                  // 3600000
tryFormat(2000);                 // "2s"

tryParse('🎯');                 // null
tryFormat(double.infinity);      // null
```

### Extensions

```dart 
'2.5 hrs'.parseMS();              // 9000000.0
'1y'.parseMS();                   // 31557600000.0
'100'.parseMS();                  // 100
'-3 days'.parseMS();              // -259200000

'10 hours'.parseMS().formatMS();  // "10h"
6000.formatMS();                  // "2m"
(2 * 60000).formatMS(long: true); // "2 minutes"

'1h'.tryParseMS();                // 3600000
'🎯'.tryParseMS();               // null
2000.tryFormatMS();               // "2s"
double.infinity.tryFormatMS();    // null
```

## Features

- Works both in Dart and Flutter.
- If you pass a string with a number and a valid unit, the number of equivalent milliseconds is returned.
- If a string that contains the number is supplied, it returns it as a number (e.g.: it returns `100` for `'100'`).
- If a number is supplied to `ms`, a string with a unit is returned.
- `ms` throws `ArgumentError`s if invalid strings or non-finite numbers are provided.
- Use `tryMS` instead of `ms` to return `null` instead of throwing errors.
- Parsing is case-insensitive. So `'2.5 hrs'` and `'2.5 HRs'` will both evaluate to `9000000`.
- The direct `parse` and `format` functions are also exposed. `ms` is built around them.
- Extensions are available for the direct method calls on strings and numbers.

## Additional Information

### Rounding

When formatting, the numbers are been rounded up or down as appropriate. So `ms(1499)` will yield `"1s"`. While `ms(1500)` will give `"2s"`.

### `dynamic`

The parameter and return value of `ms` both have the `dynamic` type. 

As of the time this paragraph was written (August 2024), this is the only native way to allow support for multiple types (Strings and nums) in the same variables. This is because Dart doesn't natively support Union types with raw types as you can see in TypeScript:

```ts
// Following is from ms in TypeScript at
// https://github.com/vercel/ms/blob/f150c1cfc73a8c08cfdb191b253a33d55462c327/src/index.ts#L42-L47

type UnitAnyCase = Unit | Uppercase<Unit> | Lowercase<Unit>;

export type StringValue =
  | `${number}`
  | `${number}${UnitAnyCase}`
  | `${number} ${UnitAnyCase}`;
```

Coming over to Dart, as there is no way to achieve the above (to improve types), `ms` simply uses `dynamic`. The code works as expected. If need be, you might want to interpolate the result from `ms` into a string or cast it to your desired type (string or num):

```dart
final toDisplay1 = ms(24 * 60 * 60 * 1000) as String; // "1d"
final toDisplay2 = '${ms(24 * 60 * 60 * 1000)}'; // "1d"
```

If you want more type control, use the extensions or the `parse` and `format` functions. `parse` takes a String and returns a num, whereas `format` does the opposite (takes a num and returns a String). If you are not worried about the `dynamic` type, then enjoy `ms` as it is.

### Formatting to weeks and years

In the "inspirer" code (Vercel's), parsing goes up to years, but formatting stops at days. However, in this Dart implementation, formatting includes weeks and years, just as parsing does. Mentioning this here in case someone is already accustomed with the "no-weeks & no-years" formatted strings in JavaScript: the inclusion of weeks and years in Dart is rather intentional.

### Contribute

In case of bugs, feature requests, or enhancements, open an issue or send a pull request.
