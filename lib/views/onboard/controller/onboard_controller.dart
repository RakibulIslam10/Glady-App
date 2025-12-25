import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glady/core/utils/basic_import.dart';

class OnboardController extends GetxController {
  // PageView Controller
  final PageController pageController = PageController();

  // Current page index
  final RxInt currentPage = 0.obs;

  // Onboarding items
  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      imagePath: Assets.dummy.amico, // Update with your asset path
      title: 'Consult Doctors from Home',
      description:
          'Book instant video consultations with qualified doctors anytime, anywhere—no waiting in clinics.',
    ),
    OnboardingItem(
      imagePath: Assets.dummy.pana,
      title: 'Find the Right Specialist',
      description:
          'Choose from a wide range of verified doctors across specialties and schedule a video call in minutes.',
    ),
    OnboardingItem(
      imagePath: Assets.dummy.ddd, // Update with your asset path
      title: 'Secure & Private Consultations',
      description:
          'Enjoy confidential video calls, get prescriptions online, and manage your health with complete privacy. Get started now!',
    ),
  ];

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Handle page changes
  void onPageChanged(int index) {
    currentPage.value = index;
  }

  // Navigate to next page or complete onboarding
  void nextPage() {
    if (currentPage.value < onboardingItems.length - 1) {
      // Go to next page with smooth animation
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Complete onboarding
      completeOnboarding();
    }
  }

  // Skip to last page
  void skipToEnd() {
    pageController.animateToPage(
      onboardingItems.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  // Complete onboarding and navigate to home/login
  void completeOnboarding() {
    // Save onboarding completion status
    // Example: Get.find<StorageService>().setOnboardingCompleted(true);

    // Navigate to next screen (login or home)
    Get.offAllNamed(Routes.loginScreen); // Update with your route
  }
}

// Onboarding Item Model
class OnboardingItem {
  final String imagePath;
  final String title;
  final String description;

  OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
