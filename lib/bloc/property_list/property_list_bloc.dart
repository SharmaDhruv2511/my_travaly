import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_travaly_task/bloc/property_list/propert_list_event.dart';
import 'package:my_travaly_task/bloc/property_list/property_list_state.dart';
import 'package:my_travaly_task/network/api_reponse.dart';
import 'package:my_travaly_task/repository/property_repo.dart';
import 'package:my_travaly_task/repository/search_auto_complete_repo.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyListState> {
  final BuildContext context;
  final PropertyRepo repo;
  final SearchRepository searchRepo;

  PropertyBloc(this.context, this.repo, this.searchRepo)
    : super(PropertyListState.initial()) {
    on<FetchPropertiesEvent>(_handleFetchProperties);
    on<PerformSearchAutoComplete>(_handleSearch);
  }

  Future<void> _handleFetchProperties(
    FetchPropertiesEvent event,
    Emitter<PropertyListState> emit,
  ) async {
    // ✅ Show loading message in UI
    emit(state.copyWith(message: "loading"));

    final response = await repo.fetchProperties();

    switch (response.apiStatus) {
      case ApiStatus.success:
        emit(
          state.copyWith(propertyListData: response.json, message: "success"),
        );
        break;

      case ApiStatus.noInternet:
        emit(state.copyWith(message: "noInternet"));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("No Internet Connection")),
          );
        }
        break;

      default:
        emit(state.copyWith(message: response.errorMessage));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response.errorMessage)));
    }
  }

  Future<void> _handleSearch(
    PerformSearchAutoComplete event,
    Emitter<PropertyListState> emit,
  ) async {
    emit(state.copyWith(message: "loading"));

    try {
      final result = await searchRepo.searchAutoComplete(event.query);
      emit(state.copyWith(searchResults: result.json, message: "searchLoaded"));
    } catch (e) {
      emit(state.copyWith(message: "searchError"));
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Search failed: $e")));
      }
    }
  }
}
