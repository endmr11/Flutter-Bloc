
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'form_data_event.dart';
part 'form_data_state.dart';

class FormDataBloc extends Bloc<FormDataEvent, FormDataState> {
  FormDataBloc() : super(FormDataInitial()) {
    on<FormDataChange>((event, emit) {
      emit(FormDataChanged(event.data));
    });
  }
}
