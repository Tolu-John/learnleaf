

import '../model/review.dart';
import '../repository/abs/ReviewRepository.dart';
import '../repository/local/ReviewLocalRepository.dart';
import 'abs/ReviewService.dart';

class ReviewSv implements ReviewService {
  final ReviewRepository _reviewRepository;

  ReviewSv([ReviewRepository? reviewRepository])
      : _reviewRepository = reviewRepository ?? ReviewLocalRepository();

  @override
  Future<String?> create(Review review) async {

    try {
      return await _reviewRepository.create(review);
    } catch (e) {
      throw Exception('Failed to create review: $e');
    }
  }



  @override
  Future<Review> read(String id) async {
    try {
      return await _reviewRepository.read(id);
    } catch (e) {
      throw Exception('Failed to get review: $e');
    }


  }

  @override
  Future<List<Review>> getAllReview() async {
    try {
      return await _reviewRepository.readAllReview();
    } catch (e) {
      throw Exception('Failed to get all reviews: $e');
    }
  }

  @override
  Future<int> update(Review review) async {
    try {

    } catch (e) {
      throw Exception('Failed to update review: $e');
    }
    return await _reviewRepository.update(review);
  }

  @override
  Future<int> delete(String id) async {
    try {
      return await _reviewRepository.delete(id);
    } catch (e) {
      throw Exception('Failed to delete review: $e');
    }
  }
}
