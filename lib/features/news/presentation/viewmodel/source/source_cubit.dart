import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/domain/usecase/source_usecase.dart';
import 'source_state.dart';

@injectable
class SourceCubit extends Cubit<SourceState> {
  //todo hold data - handle logic
  int selectedIndex = 0;
  SourceUseCase sourceUseCase;

  SourceCubit({required this.sourceUseCase}) : super(InitialState());

  void getSource(String categoryId) async {
    try {
      emit(LoadingState());
      var response = await sourceUseCase.call(categoryId);
      if (response.status == 'ok') {
        emit(SuccessState(sourceList: response.sources));
      } else {
        emit(ErrorState(errorMessage: response.status));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  void changeIndex(int index) {
    selectedIndex = index;
    emit(ChangeIndexState());
  }
}
