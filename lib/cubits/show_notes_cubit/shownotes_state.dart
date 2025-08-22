part of 'shownotes_cubit.dart';

@immutable
sealed class ShownotesState {}

final class ShownotesInitial extends ShownotesState {}

final class ShownotesLoading extends ShownotesState {}

final class ShownotesSuccess extends ShownotesState {
  final List<NoteModel> notes;

  ShownotesSuccess({required this.notes});
}

final class ShownotesFailure extends ShownotesState {
  final String errMessage;

  ShownotesFailure({required this.errMessage});
}
