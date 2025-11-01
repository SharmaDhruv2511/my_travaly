import 'package:equatable/equatable.dart';
import 'package:my_travaly_task/models/property_model.dart';
import 'package:my_travaly_task/models/search_auto_complete_model.dart';

class PropertyListState extends Equatable {
  final Property propertyListData;
  final String message;
  final SearchAutoComplete? searchResults; 

  const PropertyListState(
      this.propertyListData, this.message, this.searchResults);

  factory PropertyListState.initial() {
    return PropertyListState(
      Property(status: false, data: [], message: '', responseCode: 0),
      "",
      null, 
    );
  }

  PropertyListState copyWith({
    Property? propertyListData,
    String? message,
    SearchAutoComplete? searchResults,
  }) {
    return PropertyListState(
      propertyListData ?? this.propertyListData,
      message ?? this.message,
      searchResults ?? this.searchResults,
    );
  }

  @override
  List<Object?> get props => [propertyListData, message, searchResults];
}
