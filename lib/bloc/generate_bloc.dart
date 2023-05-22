import 'package:flutter_bloc/flutter_bloc.dart';

import 'generate_event.dart';
import 'generate_state.dart';

class NumberSequenceBloc
    extends Bloc<NumberSequenceEvent, NumberSequenceState> {
  NumberSequenceBloc() : super(NumberSequenceInitial());

  @override
  Stream<NumberSequenceState> mapEventToState(
      NumberSequenceEvent event) async* {
    if (event is GenerateSequenceEvent) {
      yield* _mapGenerateSequenceEvent(event.n);
    } else if (event is GenerateReverseSequenceEvent) {
      yield* _mapGenerateReverseSequenceEvent(event.n);
    } else if (event is GenerateIncrementalSequenceEvent) {
      yield* _mapGenerateIncrementalSequenceEvent(
          event.n, event.increment);
    } else if (event is GenerateReplacementSequenceEvent) {
      yield* _mapGenerateReplacementSequenceEvent(
          event.n, event.multiple1, event.multiple2);
    }
  }

  Stream<NumberSequenceState> _mapGenerateSequenceEvent(int n) async* {
    String sequence = '';
    for (int i = 1; i <= n; i++) {
      sequence += i.toString();
    }
    yield NumberSequenceGenerated(sequence);
  }

  Stream<NumberSequenceState> _mapGenerateReverseSequenceEvent(int n) async* {
    String sequence = '';
    for (int i = 1; i <= n; i++) {
      sequence += i.toString();
    }
    for (int i = n - 1; i >= 1; i--) {
      sequence += i.toString();
    }
    yield NumberSequenceGenerated(sequence);
  }

  Stream<NumberSequenceState> _mapGenerateIncrementalSequenceEvent(
      int n, int increment) async* {
    String sequence = '';
    int currentNumber = 1;
    for (int i = 1; i <= n; i++) {
      sequence += currentNumber.toString() + ' ';
      currentNumber += increment;
    }
    yield NumberSequenceGenerated(sequence.trim());
  }

  Stream<NumberSequenceState> _mapGenerateReplacementSequenceEvent(
      int n, int multiple1, int multiple2) async* {
    String sequence = '';
    for (int i = 1; i <= n; i++) {
      if (i % multiple1 == 0) {
        sequence += 'LIMA';
      } else if (i % multiple2 == 0) {
        sequence += 'TUJUH';
      } else {
        sequence += i.toString();
      }
    }
    yield NumberSequenceGenerated(sequence);
  }
}