abstract class NumberSequenceEvent {}

class GenerateSequenceEvent extends NumberSequenceEvent {
  final int n;

  GenerateSequenceEvent(this.n);
}

class GenerateReverseSequenceEvent extends NumberSequenceEvent {
  final int n;

  GenerateReverseSequenceEvent(this.n);
}

class GenerateIncrementalSequenceEvent extends NumberSequenceEvent {
  final int n;
  final int increment;

  GenerateIncrementalSequenceEvent(this.n, this.increment);
}

class GenerateReplacementSequenceEvent extends NumberSequenceEvent {
  final int n;
  final int multiple1;
  final int multiple2;

  GenerateReplacementSequenceEvent(this.n, this.multiple1, this.multiple2);
}