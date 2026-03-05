part of 'transcription_cubit.dart';

@immutable
final class TranscriptionState extends Equatable {
  final String intermediateText; // intermediate result, without punctuation
  final List<String> finalizedText; // final result, with punctuation
  final String text; // returns finalizedText if present, otherwise intermediateText
  final bool isListening;

  const TranscriptionState({
    this.intermediateText = '',
    this.finalizedText = const [],
    this.text = '',
    this.isListening = false,
  });

  TranscriptionState copyWith({
    String? intermediateText,
    List<String>? finalizedText,
    String? text,
    bool? isListening,
  }) {
    return TranscriptionState(
      intermediateText: intermediateText ?? this.intermediateText,
      finalizedText: finalizedText ?? this.finalizedText,
      text: text ?? this.text,
      isListening: isListening ?? this.isListening,
    );
  }

  @override
  List<Object?> get props => [intermediateText, finalizedText, text, isListening];
}
