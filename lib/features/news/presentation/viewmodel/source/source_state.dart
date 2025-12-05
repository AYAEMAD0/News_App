
import '../../../../../domain/entities/source/sources.dart';

abstract class SourceState {}

class InitialState extends SourceState {}
class LoadingState extends SourceState {}

class SuccessState extends SourceState {
  List<Sources>? sourceList;
  SuccessState({required this.sourceList});
}

class ErrorState extends SourceState {
  String? errorMessage;
  ErrorState({required this.errorMessage});
}
class ChangeIndexState extends SourceState{}
