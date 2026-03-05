import 'package:flutter/cupertino.dart';

abstract class AzureResponse {
  final String path;
  final String text;

  const AzureResponse({required this.path, required this.text});
}

class SpeechHypothesis extends AzureResponse {
  SpeechHypothesis({required super.text}) : super(path: 'speech.hypothesis');

  factory SpeechHypothesis.fromJson(Map<String, dynamic> json) {
    return SpeechHypothesis(text: json['Text'] ?? '');
  }
}

class SpeechPhrase extends AzureResponse {
  final String recognitionStatus;

  SpeechPhrase({required super.text, required this.recognitionStatus})
    : super(path: 'speech.phrase');

  factory SpeechPhrase.fromJson(Map<String, dynamic> json) {
    return SpeechPhrase(
      text: json['DisplayText'] ?? '',
      recognitionStatus: json['RecognitionStatus'] ?? 'Error',
    );
  }
}

AzureResponse? parseAzureResponse(String path, Map<String, dynamic> json) {
  try {
    if (path == 'speech.hypothesis') {
      return SpeechHypothesis.fromJson(json);
    }
    if (path == 'speech.phrase') {
      return SpeechPhrase.fromJson(json);
    }
  } catch (e) {
    debugPrint("Error parsing Azure response: $e");
  }
  return null;
}
