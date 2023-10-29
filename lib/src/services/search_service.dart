import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/location.dart';
import '../models/locus_user.dart';

abstract class SearchService {
  Future<List<LocusUser>> getUsers(String query);

  Future<List<Location>> getLocations(String query);
}

class SearchServiceImpl implements SearchService {
  final FirebaseFirestore client;

  SearchServiceImpl(this.client);

  static const MOMENT_COLLECTION = 'moments';
  static const USER_COLLECTION = 'users';

  @override
  Future<List<Location>> getLocations(String query) async {
    final all = await client
        .collection(MOMENT_COLLECTION)
        .where(
          'location/place',
          isEqualTo: query,
        )
        .get();
    final res = <Location>[];
    for (var d in all.docs) {
      res.add(
        Location.fromJson(
          d.data()['location'],
        ),
      );
    }
    return res;
  }

  @override
  Future<List<LocusUser>> getUsers(String query) async {
    final users = await client
        .collection(USER_COLLECTION)
        .where('username', isEqualTo: query)
        .get();
    return users.docs
        .map(
          (u) => LocusUser.fromJson(
            u.data(),
          ),
        )
        .toList();
  }
}
