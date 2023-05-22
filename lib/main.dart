import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/generate_bloc.dart';
import 'bloc/generate_event.dart';
import 'bloc/generate_state.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Aplikasi Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => NumberSequenceBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contoh Aplikasi Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Masukkan N'),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Spacer(flex: 20,),
                ElevatedButton(
                  onPressed: () {
                    int? n = int.tryParse(_textEditingController.text);
                    if (n != null) {
                      BlocProvider.of<NumberSequenceBloc>(context)
                          .add(GenerateSequenceEvent(n));
                    }
                  },
                  child: const Text('1'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    int? n = int.tryParse(_textEditingController.text);
                    if (n != null) {
                      BlocProvider.of<NumberSequenceBloc>(context)
                          .add(GenerateReverseSequenceEvent(n));
                    }
                  },
                  child: Text('2'),
                ),
                const Spacer(flex: 20,),
              ],
            ),
            Row(
              children: [
                const Spacer(flex: 20,),
                ElevatedButton(
                  onPressed: () {
                    int? n = int.tryParse(_textEditingController.text);
                    int increment = 11; // Ubah sesuai kebutuhan
                    if (n != null) {
                      BlocProvider.of<NumberSequenceBloc>(context)
                          .add(GenerateIncrementalSequenceEvent(n, increment));
                    }
                  },
                  child: Text('3'),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    int? n = int.tryParse(_textEditingController.text);
                    int multiple1 = 5; // Ubah sesuai kebutuhan
                    int multiple2 = 7; // Ubah sesuai kebutuhan
                    if (n != null) {
                      BlocProvider.of<NumberSequenceBloc>(context)
                          .add(GenerateReplacementSequenceEvent(
                          n, multiple1, multiple2));
                    }
                  },
                  child: Text('4'),
                ),
                const Spacer(flex: 20,),
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Result : "),
                BlocBuilder<NumberSequenceBloc, NumberSequenceState>(
                  builder: (context, state) {
                    if (state is NumberSequenceGenerated) {
                      return Text(state.sequence);
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

