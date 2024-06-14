import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/redirect_bloc/redirect_bloc.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/routes/app_routes.dart';
import 'package:edudoor_jobseeker/src/view/common/animations/fade_animation.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/redirect_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: TextButton(onPressed: () {
              AppNavigator.push(AppRoutes.COMPLETE_PROFILE);
            }, child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return Text(context.watch<AuthenticationBloc>().jobseekerModel?.fullName ?? '');
              },
            )),
          ),
          BlocBuilder<RedirectBloc, RedirectState>(
            builder: (context, state) {
              if (state == RedirectState.show) {
                return const AnimatedFade(child: RedirectWidget());
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
