import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_education_bloc/change_education_step_bloc.dart';
import 'package:edudoor_jobseeker/src/helper/education_checker_helper.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/toggle_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationLevels extends StatelessWidget {
  const EducationLevels({super.key});
  final List<String> statusList = const [
    '10th',
    '12th',
    'Diploma',
    'Graduate',
    'P.G',
    'Doctorate',
    'English',
    'Technical Degree',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        final education = context.watch<AuthenticationBloc>().jobseekerModel?.education;
        final status = EducationCheckerHelper.status(education);
        return SizedBox(
          height: 55,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<ChangeEducationStepBloc, int>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: statusList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: StatusToggleWidget(
                      text: statusList[index],
                      level: index,
                      done: status[index],
                      selectedLevel: state,
                      changeSelectedLevel: () {
                        context.read<ChangeEducationStepBloc>().add(ChangeEducationStepUpdateEvent(activeStep: index));
                      },
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10.0), // Adjust padding as needed
              );
            },
          ),
        );
      },
    );
  }
}
