import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/bottom_navigator_startup/bottom_navigator_startup_bloc.dart';
import 'package:edudoor_jobseeker/src/view/applied_jobs/applied_jobs_screen.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/circular_avatar.dart';
import 'package:edudoor_jobseeker/src/view/course/courses_screen.dart';
import 'package:edudoor_jobseeker/src/view/home/home_screen.dart';
import 'package:edudoor_jobseeker/src/view/job/jobs_screen.dart';
import 'package:edudoor_jobseeker/src/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  PageController pageController = PageController();
  int _currentPage = 0;

  changeCurrentPage(int index) {
    setState(() {
      _currentPage = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    AllBloc.bottomNavigatorStartupBloc.add(BottomNavigatorStartupSetupEvent());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: PageView(
            controller: pageController,
            allowImplicitScrolling: true,
            onPageChanged: changeCurrentPage,
            children: const [
              HomeScreen(),
              JobsScreen(),
              AppliedJobsScreen(),
              CoursesScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            elevation: 100,
            currentIndex: _currentPage,
            onTap: changeCurrentPage,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).textTheme.bodyMedium?.color ?? Theme.of(context).primaryColor,
            items: [
              BottomNavigationBarItem(
                icon: PhosphorIcon(PhosphorIcons.house()),
                activeIcon: PhosphorIcon(PhosphorIcons.house(PhosphorIconsStyle.fill)),
                label: "home".tr,
              ),
              BottomNavigationBarItem(
                icon: PhosphorIcon(PhosphorIcons.briefcase()),
                activeIcon: PhosphorIcon(PhosphorIcons.briefcase(PhosphorIconsStyle.fill)),
                label: "Jobs".tr,
              ),
              BottomNavigationBarItem(
                icon: PhosphorIcon(PhosphorIcons.sealCheck()),
                activeIcon: PhosphorIcon(PhosphorIcons.sealCheck(PhosphorIconsStyle.fill)),
                label: "applied".tr,
              ),
              BottomNavigationBarItem(
                icon: PhosphorIcon(PhosphorIcons.video()),
                activeIcon: PhosphorIcon(PhosphorIcons.video(PhosphorIconsStyle.fill)),
                label: "course".tr,
              ),
              BottomNavigationBarItem(
                icon: _buildBottomNavigatorProfile(false),
                activeIcon: _buildBottomNavigatorProfile(true),
                label: "profile".tr,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildBottomNavigatorProfile(isActive) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final jobseekerModel = context.watch<AuthenticationBloc>().jobseekerModel;
        if (jobseekerModel != null && jobseekerModel.profilePicLink != null) {
          final urlToImage = jobseekerModel.profilePicLink;
          final blurHash = jobseekerModel.profilePicLinkBlurHash;
          if (urlToImage != null && blurHash != null) {
            return CircularAvatar(
              isActive: isActive,
              urlToImage: urlToImage,
              blurHash: blurHash,
            );
          }
        }
        return PhosphorIcon(PhosphorIcons.userCircle());
      },
    );
  }
}
