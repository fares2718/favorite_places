import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(Place place) {
    if (state.contains(place)) {
      state = state.where((p) => p.id != place.id).toList();
      return;
    }
    state = [...state, place];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (ref) => UserPlacesNotifier(),
    );
