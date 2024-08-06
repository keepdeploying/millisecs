import 'package:flutter/material.dart';
import 'package:millisecs/millisecs.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Testing "millisecs" Package',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Testing "millisecs" Package'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Convert from Time Formats',
              style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            title: const Text("ms('2 days')"),
            trailing: Text('${ms('2 days')}'),
          ),
          ListTile(
            title: const Text("ms('1d')"),
            trailing: Text('${ms('1d')}'),
          ),
          ListTile(
            title: const Text("ms('10h')"),
            trailing: Text('${ms('10h')}'),
          ),
          ListTile(
            title: const Text("ms('2.5 hrs')"),
            trailing: Text('${ms('2.5 hrs')}'),
          ),
          ListTile(
            title: const Text("ms('2h')"),
            trailing: Text('${ms('2h')}'),
          ),
          ListTile(
            title: const Text("ms('1m')"),
            trailing: Text('${ms('1m')}'),
          ),
          ListTile(
            title: const Text("ms('5s')"),
            trailing: Text('${ms('5s')}'),
          ),
          ListTile(
            title: const Text("ms('1y')"),
            trailing: Text('${ms('1y')}'),
          ),
          ListTile(
            title: const Text("ms('100')"),
            trailing: Text('${ms('100')}'),
          ),
          ListTile(
            title: const Text("ms('-3 days')"),
            trailing: Text('${ms('-3 days')}'),
          ),
          ListTile(
            title: const Text("ms('1h')"),
            trailing: Text('${ms('1h')}'),
          ),
          ListTile(
            title: const Text("ms('-200')"),
            trailing: Text('${ms('-200')}'),
          ),
          const SizedBox(height: 32),
          Text('Convert from Milliseconds',
              style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            title: const Text('ms(60000)'),
            trailing: Text('${ms(60000)}'),
          ),
          ListTile(
            title: const Text('ms(2 * 60000)'),
            trailing: Text('${ms(2 * 60000)}'),
          ),
          ListTile(
            title: const Text('ms(-3 * 60000)'),
            trailing: Text('${ms(-3 * 60000)}'),
          ),
          ListTile(
            title: const Text("ms(ms('10 hours'))"),
            trailing: Text('${ms(ms('10 hours'))}'),
          ),
          const SizedBox(height: 32),
          Text('Time Format Written-Out',
              style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            title: const Text('ms(60000, long: true)'),
            trailing: Text('${ms(60000, long: true)}'),
          ),
          ListTile(
            title: const Text('ms(2 * 60000, long: true)'),
            trailing: Text('${ms(2 * 60000, long: true)}'),
          ),
          ListTile(
            title: const Text('ms(-3 * 60000, long: true)'),
            trailing: Text('${ms(-3 * 60000, long: true)}'),
          ),
          ListTile(
            title: const Text("ms(ms('10 hours'), long: true)"),
            trailing: Text('${ms(ms('10 hours'), long: true)}'),
          ),
          const SizedBox(height: 32),
          Text('parse and format',
              style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            title: const Text("parse('1h')"),
            trailing: Text('${parse('1h')}'),
          ),
          ListTile(
            title: const Text('format(2000)'),
            trailing: Text(format(2000)),
          ),
          ListTile(
            title: const Text('format(2000, long: true)'),
            trailing: Text(format(2000, long: true)),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text("tryParse('1h')"),
            trailing: Text('${tryParse('1h')}'),
          ),
          ListTile(
            title: const Text('tryFormat(2000)'),
            trailing: Text('${tryFormat(2000)}'),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text("tryParse('🎯')"),
            trailing: Text('${tryParse('🎯')}'),
          ),
          ListTile(
            title: const Text('tryFormat(double.infinity)'),
            trailing: Text('${tryFormat(double.infinity)}'),
          ),
          const SizedBox(height: 32),
          Text('Extensions', style: Theme.of(context).textTheme.titleMedium),
          ListTile(
            title: const Text("'2.5 hrs'.parseMS()"),
            trailing: Text('${'2.5 hrs'.parseMS()}'),
          ),
          ListTile(
            title: const Text("'1y'.parseMS()"),
            trailing: Text('${'1y'.parseMS()}'),
          ),
          ListTile(
            title: const Text("'100'.parseMS()"),
            trailing: Text('${'100'.parseMS()}'),
          ),
          ListTile(
            title: const Text("'-3 days'.parseMS()"),
            trailing: Text('${'-3 days'.parseMS()}'),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text("'10 hours'.parseMS().formatMS()"),
            trailing: Text('10 hours'.parseMS().formatMS()),
          ),
          ListTile(
            title: const Text('6000.formatMS()'),
            trailing: Text(6000.formatMS()),
          ),
          ListTile(
            title: const Text('(2 * 6000).formatMS(long: true)'),
            trailing: Text((2 * 6000).formatMS(long: true)),
          ),
          const SizedBox(height: 16),
          ListTile(
            title: const Text("'1h'.tryParseMS()"),
            trailing: Text('${'1h'.tryParseMS()}'),
          ),
          ListTile(
            title: const Text("'🎯'.tryParseMS()"),
            trailing: Text('${'🎯'.tryParseMS()}'),
          ),
          ListTile(
            title: const Text('2000.tryFormatMS()'),
            trailing: Text('${2000.tryFormatMS()}'),
          ),
          ListTile(
            title: const Text('double.infinity.tryFormatMS()'),
            trailing: Text('${double.infinity.tryFormatMS()}'),
          ),
        ],
      ),
    );
  }
}
