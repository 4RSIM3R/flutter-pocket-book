import 'package:bloc/bloc.dart';
import 'package:pocket_books/application/subtitle/model/subtitle_model.dart';
import 'package:pocket_books/application/subtitle/repositories/subtitle_repository.dart';

class SubtitleState {}

class SubtitleInit extends SubtitleState {}

class SubtitleLoading extends SubtitleState {}

class SubtitleSuccess extends SubtitleState {
  final List<SubtitleModels>? payload;

  SubtitleSuccess(this.payload);
}

class SubtitleFailure extends SubtitleState {
  final String? message;

  SubtitleFailure(this.message);
}

class SubtitleBloc extends Cubit<SubtitleState> {
  SubtitleBloc() : super(SubtitleInit());

  final subtitleRepository = SubtitleRepository();

  Future<void> loadSubtitle(String url) async {
    emit(SubtitleLoading());

    try {
      final result = await subtitleRepository.parseSrt(url: url);
      emit(SubtitleSuccess(result));
    } catch (e) {
      emit(SubtitleFailure(e.toString()));
    }
  }
}
