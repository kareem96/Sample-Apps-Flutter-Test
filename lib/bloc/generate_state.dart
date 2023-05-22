abstract class NumberSequenceState {}

class NumberSequenceInitial extends NumberSequenceState {}

class NumberSequenceGenerated extends NumberSequenceState {
  final String sequence;

  NumberSequenceGenerated(this.sequence);
}