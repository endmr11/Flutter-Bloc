part of 'form_data_bloc.dart';

abstract class FormDataEvent extends Equatable {
  const FormDataEvent();

  @override
  List<Object> get props => [UniqueKey()];
}

class FormDataChange extends FormDataEvent {
  final String data;
  const FormDataChange(this.data);

  @override
  List<Object> get props => [data];
}