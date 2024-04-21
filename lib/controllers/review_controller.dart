import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnleaf/core/service/abs/ReviewService.dart';
import 'package:learnleaf/utils/utils_widget.dart';

import '../core/model/review.dart';
import '../core/service/ReviewSv.dart';

class ReviewController extends GetxController {
  var loading = false.obs;

  final ReviewService _reviewService;
  
  ReviewController({ReviewService? reviewService}) : _reviewService = reviewService ?? ReviewSv() ;

  Future<List<Review>> fetchAllReviews() async {
    try {
      loading.value = true;

      List<Review> fetchedReviews = await _reviewService.getAllReview();

      return fetchedReviews;

    } catch (e) {
      print('Error fetching reviews: $e');
    }
    finally {
      loading.value = false;
    }
    return <Review>[];
  }

  Future<void> createReview(String courseId, double rating, String reviewText ) async {

    try {
      loading.value = true;

      var review = Review(id: " ", courseId: courseId, rating: rating, reviewText: reviewText);
      String? id = await _reviewService.create(review);

      await _reviewService.read(id!);
      UtilsWidget.successSnack("Review Sent");


    } catch (e) {

      print('Error creating review: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> deleteReview(Review review) async {
    try {
      loading.value = true;
      print('deleting review id: ${review.id!}');
      await _reviewService.delete(review.id!);

    } catch (e) {
      print('Error deleting review: $e');
    } finally {
      loading.value = false;
    }
  }

  Future<void> updateReview(Review updatedReview) async {
    try {
      loading.value = true;



    } catch (e) {
      print('Error updating review: $e');
    } finally {
      loading.value = false;
    }
    await _reviewService.update(updatedReview);
  }

  double getAverageRating(List<Review> reviews)  {
    double total = 0;
    int length= reviews.length;
    for (Review review in reviews) {
      total += review.rating;
    }
  return  total/length;

  }
}
