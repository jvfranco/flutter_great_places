import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:great_places/models/places.dart';
import 'package:great_places/utils/db_util.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place itemByIndex(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    var location = PlaceLocation('address', latitude: 1.0, longitude: 1.0);
    final place = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: location,
    );

    _items.add(place);
    DbUtil.insert('places', {
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
    });
    notifyListeners();
  }

  Future<void> loadPlaces() async {
    var location = PlaceLocation('address', latitude: 1.0, longitude: 1.0);
    final dataList = await DbUtil.getData('places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            location: location,
            image: File(item['image']),
          ),
        )
        .toList();
    notifyListeners();
  }
}
