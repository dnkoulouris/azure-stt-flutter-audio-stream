import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transcription_state.dart';

class TranscriptionCubit extends Cubit<TranscriptionState> {
  TranscriptionCubit() : super(const TranscriptionState());

  void setListening(bool listening) {
    emit(state.copyWith(isListening: listening));
  }

  void updateIntermediateText(String text) {
    emit(state.copyWith(intermediateText: text, finalizedText: [], text: text));
  }

  void addFinalizedText(String text) {
    if (text.isNotEmpty) {
      final updatedList = List.of(state.finalizedText)..add(text);
      emit(
        state.copyWith(finalizedText: updatedList, intermediateText: '', text: updatedList.join()),
      );
    } else {
      emit(state.copyWith(intermediateText: '', text: ''));
    }
  }

  bool get isListening => state.isListening;

  void reset() {
    emit(const TranscriptionState(intermediateText: '', finalizedText: [], isListening: false));
  }

  void clearText() {
    emit(state.copyWith(intermediateText: '', finalizedText: [], text: ''));
  }
}
