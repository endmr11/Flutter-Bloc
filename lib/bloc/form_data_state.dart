part of 'form_data_bloc.dart';

abstract class FormDataState extends Equatable {
  const FormDataState();
  
  @override
  List<Object> get props => [UniqueKey()];
}

class FormDataInitial extends FormDataState {}
class FormDataChanged extends FormDataState {
  final String data;
  const FormDataChanged(this.data);

  @override
  List<Object> get props => [data];
}
