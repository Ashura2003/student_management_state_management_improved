import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_starter/features/batch/presentation/view/batch_view.dart';
import 'package:student_management_starter/features/course/presentation/view/course_view.dart';
import 'package:student_management_starter/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:student_management_starter/features/home/presentation/view/bottom_view/profile_view.dart';
import 'package:student_management_starter/features/home/presentation/view_model/home_view_model.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = 0;
    List<Widget> lstScreen = [
      const DashBoardView(),
      const CourseView(),
      const BatchView(),
      const ProfileView(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Dashboard View'),
            const Spacer(),
            // Reload button
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh),
            ),

            // Logout button
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout),
            ),

            // Theme toggle button
            Switch(
              value: true,
              onChanged: (value) {},
            )
          ],
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Home View",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.batch_prediction),
            label: 'Batch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 0) {
            ref.read(homeViewModelProvider.notifier).openHomeView();
            selectedIndex = index;
          } else if (index == 1) {
            ref.read(homeViewModelProvider.notifier).openCourseView();
            selectedIndex = index;
          } else if (index == 2) {
            ref.read(homeViewModelProvider.notifier).openBatchView();
            selectedIndex = index;
          } else {
            ref.read(homeViewModelProvider.notifier).openHomeView();
            selectedIndex = index;
          }
        },
      ),
    );
  }
}
