part of 'shownotes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}
final class NotesUpdate extends NotesState {}
