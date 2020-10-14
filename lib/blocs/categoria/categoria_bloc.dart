import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrilife/repository/repository.dart';

import 'package:nutrilife/repository/models/models.dart';
part 'categoria_event.dart';
part 'categoria_state.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  final CategoriaRepository categoriaRepository;

  CategoriaBloc({@required this.categoriaRepository});

  @override
  CategoriaState get initialState => LoadInProgressState();

  @override
  Stream<CategoriaState> mapEventToState(
    CategoriaEvent event,
  ) async* {
    if (event is CategoriaLoadSuccess){
      yield* _mapTodosLoadedToState();
    }
    if (event is CategoriaSelected){
      yield SelectedState(event.categoria);
    }
  }

  Stream<CategoriaState> _mapTodosLoadedToState() async* {
    try {
      final categorias = await this.categoriaRepository.getCategorias();
      yield LoadSuccessState(categorias);
    } catch (_) {
      yield LoadFailureState();
    }
  }
}
