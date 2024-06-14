import 'package:edudoor_jobseeker/src/blocs_cubits/Internet_check_cubit/internet_cubit.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/application_bloc/application_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/bottom_navigator_startup/bottom_navigator_startup_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_education_bloc/change_education_step_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_register_step_block/change_register_step_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/count_down/count_down_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/redirect_bloc/redirect_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBloc {
  AllBloc._();

  static final AllBloc _allBloc = AllBloc._();

  factory AllBloc() {
    return _allBloc;
  }

  static final InternetCubit internetCubit = InternetCubit();
  static final AuthenticationBloc authenticationBloc = AuthenticationBloc();
  static final ApplicationBloc applicationBloc = ApplicationBloc();
  static final CountDownBloc countDownBloc = CountDownBloc();
  static final BottomNavigatorStartupBloc bottomNavigatorStartupBloc = BottomNavigatorStartupBloc();
  static final RedirectBloc redirectBloc = RedirectBloc();
  static final ChangeRegisterStepBloc changeRegisterStepBloc = ChangeRegisterStepBloc();
  static final ChangeEducationStepBloc changeEducationStepBloc = ChangeEducationStepBloc();
  // static final UserBloc userBloc = UserBloc();
  // static final AuthBloc authBloc = AuthBloc();
  // static final RecommendedBloc recommendedBloc = RecommendedBloc();
  // static final CourseBloc courseBloc = CourseBloc();
  // static final ResumeServiceBloc resumeServiceBloc = ResumeServiceBloc();
  // static final LatestJobsBloc latestJobsBloc = LatestJobsBloc();
  // static final JobListPageBloc jobListPageBloc = JobListPageBloc();
  // static final AppliedBloc appliedBloc = AppliedBloc();
  // static final AppliedJobListPageBloc appliedJobListPageBloc = AppliedJobListPageBloc();
  // static final SavedJobListPageBloc savedJobListPageBloc = SavedJobListPageBloc();
  // static final LogOutBlocBloc logOutBlocBloc = LogOutBlocBloc();
  // static final FilterBloc filterBloc = FilterBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<InternetCubit>(
      create: (context) => internetCubit,
    ),
    BlocProvider<AuthenticationBloc>(
      create: (context) => authenticationBloc,
    ),
    BlocProvider<ApplicationBloc>(
      create: (context) => applicationBloc,
    ),
    BlocProvider<CountDownBloc>(
      create: (context) => countDownBloc,
    ),

    BlocProvider<RedirectBloc>(
      create: (context) => redirectBloc,
    ),
    BlocProvider<ChangeRegisterStepBloc>(
      create: (context) => changeRegisterStepBloc,
    ),
    BlocProvider<ChangeEducationStepBloc>(
      create: (context) => changeEducationStepBloc,
    ),
    // BlocProvider<UserBloc>(
    //   create: (context) => userBloc,
    // ),
    // BlocProvider<AuthBloc>(
    //   create: (context) => authBloc,
    // ),
    // BlocProvider<RecommendedBloc>(
    //   create: (context) => recommendedBloc,
    // ),
    // BlocProvider<CourseBloc>(
    //   create: (context) => courseBloc,
    // ),
    // BlocProvider<ResumeServiceBloc>(
    //   create: (context) => resumeServiceBloc,
    // ),
    // BlocProvider<LatestJobsBloc>(
    //   create: (context) => latestJobsBloc,
    // ),
    // BlocProvider<JobListPageBloc>(
    //   create: (context) => jobListPageBloc,
    // ),
    // BlocProvider<AppliedBloc>(
    //   create: (context) => appliedBloc,
    // ),
    // BlocProvider<AppliedJobListPageBloc>(
    //   create: (context) => appliedJobListPageBloc,
    // ),
    // BlocProvider<SavedJobListPageBloc>(
    //   create: (context) => savedJobListPageBloc,
    // ),
    // BlocProvider<LogOutBlocBloc>(
    //   create: (context) => logOutBlocBloc,
    // ),
    // BlocProvider<FilterBloc>(
    //   create: (context) => filterBloc,
    // )
  ];

  static void dispose() {
    internetCubit.close();
    authenticationBloc.close();
    applicationBloc.close();
    countDownBloc.close();
    redirectBloc.close();
    changeRegisterStepBloc.close();
    changeRegisterStepBloc.close();
    // userBloc.close();
    // authBloc.close();
    // recommendedBloc.close();
    // courseBloc.close();
    // resumeServiceBloc.close();
    // latestJobsBloc.close();
    // jobListPageBloc.close();
    // appliedBloc.close();
    // appliedJobListPageBloc.close();
    // savedJobListPageBloc.close();
    // logOutBlocBloc.close();
    // filterBloc.close();
  }
}
