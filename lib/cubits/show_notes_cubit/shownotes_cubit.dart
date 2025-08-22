import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/constant.dart';
import 'package:notesapp/models/note_model.dart';

part 'shownotes_state.dart';

class ShownotesCubit extends Cubit<ShownotesState> {
  ShownotesCubit() : super(ShownotesInitial());

  fetchAllNotes(NoteModel note) async {
    //emit(ShownotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      List<NoteModel> notes = notesBox.values.toList();
      emit(ShownotesSuccess(notes: notes));
    } catch (e) {
      emit(ShownotesFailure(errMessage: e.toString()));
    }
  }
}
