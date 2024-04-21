
import '../../model/review.dart';

abstract class ReviewService {
  Future<String?> create(Review iBudget);
  Future<Review> read(String id);
  Future<List<Review>> getAllReview();
  Future<int> update(Review iBudget);
  Future<int> delete(String id);
}