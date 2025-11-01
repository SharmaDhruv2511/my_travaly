import 'package:equatable/equatable.dart';

abstract class PropertyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPropertiesEvent extends PropertyEvent {}

class PerformSearchAutoComplete extends PropertyEvent {
  final String query;

  PerformSearchAutoComplete(this.query);

  @override
  List<Object?> get props => [query];
}
