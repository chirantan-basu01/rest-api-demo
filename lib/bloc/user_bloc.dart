import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_demo/bloc/user_event.dart';
import 'package:rest_api_demo/bloc/user_state.dart';

import '../services/api_services.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final PostRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserLoading());

      try {
        final users = await repository.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
