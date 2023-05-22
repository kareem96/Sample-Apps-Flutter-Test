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
      appBar: AppBar(title: Text('Contoh Aplikasi Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan N'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                int? n = int.tryParse(_textEditingController.text);
                if (n != null) {
                  BlocProvider.of<NumberSequenceBloc>(context)
                      .add(GenerateSequenceEvent(n));
                }
              },
              child: Text('Deret Angka 1->N'),
            ),
            ElevatedButton(
              onPressed: () {
                int? n = int.tryParse(_textEditingController.text);
                if (n != null) {
                  BlocProvider.of<NumberSequenceBloc>(context)
                      .add(GenerateReverseSequenceEvent(n));
                }
              },
              child: Text('Deret Angka 1->N->1'),
            ),
            ElevatedButton(
              onPressed: () {
                int? n = int.tryParse(_textEditingController.text);
                int increment = 10; // Ubah sesuai kebutuhan
                if (n != null) {
                  BlocProvider.of<NumberSequenceBloc>(context)
                      .add(GenerateIncrementalSequenceEvent(n, increment));
                }
              },
              child: Text('Deret Angka dengan Penambahan'),
            ),
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
              child: Text('Deret Angka dengan Penggantian'),
            ),
            BlocBuilder<NumberSequenceBloc, NumberSequenceState>(
              builder: (context, state) {
                if (state is NumberSequenceGenerated) {
                  return Text(state.sequence);
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

