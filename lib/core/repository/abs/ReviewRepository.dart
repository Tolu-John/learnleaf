
import '../../model/review.dart';

abstract class ReviewRepository {
  Future<String?> create(Review review);
  Future<Review> read(String id);
  Future<List<Review>> readAllReview();
  Future<int> update(Review review);
  Future<int> delete(String id);
}