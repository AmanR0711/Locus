import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/moment.dart';

abstract class MomentService {
  Future<Moment> loadMoment(String postId);

  Future<void> addComment(String postId, String commentor, String comment);

  Future<bool> toggleLike(String postId, String username);
}

class MomentServiceImpl implements MomentService {
  static const MOMENT_COLLECTION = "moments";
  static const USER_COLLECTION = "users";
  static const COMMENT_COLLECTION = "comments";

  final FirebaseFirestore client;

  MomentServiceImpl(this.client);

  @override
  Future<Moment> loadMoment(String postId) async {
    final momentDoc =
        await client.collection(MOMENT_COLLECTION).doc(postId).get();
    final momentDataJson = momentDoc.data()!;
    final moment = Moment.fromJson(momentDataJson);
    return moment;
  }

  @override
  Future<void> addComment(
    String postId,
    String commentor,
    String comment,
  ) async {
    await client
        .collection(MOMENT_COLLECTION)
        .doc(postId)
        .collection(COMMENT_COLLECTION)
        .add({
      "post_id": postId,
      "created_at": DateTime.now().toIso8601String(),
      "comment": comment,
      "commentor": commentor,
    });
  }

  @override
  Future<bool> toggleLike(String postId, String username) async {
    final userHasLikedSnapshot = await client
        .collection(MOMENT_COLLECTION)
        .doc(postId)
        .collection(COMMENT_COLLECTION)
        .where(
          'username',
          isEqualTo: username,
        )
        .get();
    final userHasLiked = userHasLikedSnapshot.docs.isNotEmpty;
    if (!userHasLiked) {
      await client
          .collection(MOMENT_COLLECTION)
          .doc(postId)
          .collection(COMMENT_COLLECTION)
          .add({
        "username": username,
      });
    } else {
      await client
          .collection(MOMENT_COLLECTION)
          .doc(postId)
          .collection(COMMENT_COLLECTION)
          .doc(userHasLikedSnapshot.docs[0].id)
          .delete();
    }
    return userHasLiked;
  }
}
