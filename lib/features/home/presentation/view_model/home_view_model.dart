import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/home/presentation/navigator/home_navigator.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, void>((ref) {
  final navigator = ref.watch(homeViewNavigatorProvider);
  return HomeViewModel(navigator);
});

class HomeViewModel extends StateNotifier<void> {
  HomeViewModel(this.navigator) : super(null);

  final HomeViewNavigator navigator;

  void openCourseView() {
    navigator.openCourseView();
  }

  void openBatchView() {
    navigator.openBatchView();
  }

  void openHomeView() {
    navigator.openHomeView();
  }

  
}
