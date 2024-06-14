import 'package:easy_stepper/easy_stepper.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_register_step_block/change_register_step_bloc.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/basic_details_body.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_page_body.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/experience_page_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'create_profile'.tr,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          BlocBuilder<ChangeRegisterStepBloc, int>(
            builder: (context, state) {
              return TextButton(
                onPressed: () {
                  context.read<ChangeRegisterStepBloc>().add(ChangeRegisterStepIncrementEvent());
                },
                child: Text(
                  "skip".tr,
                  style: const TextStyle(color: Colors.blue),
                ),
              );
            },
          )
        ],
      ),
      body: BlocBuilder<ChangeRegisterStepBloc, int>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 65.sp,
                child: EasyStepper(
                  alignment: AlignmentDirectional.topCenter,
                  enableStepTapping: true,
                  steppingEnabled: true,
                  maxReachedStep: state,
                  onStepReached: (index) {
                    context.read<ChangeRegisterStepBloc>().add(ChangeRegisterStepUpdateEvent(activeStep: index));
                  },
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  lineStyle: const LineStyle(
                    defaultLineColor: Colors.grey,
                    unreachedLineColor: Colors.grey,
                    activeLineColor: Colors.blue,
                    finishedLineColor: Colors.green,
                    lineType: LineType.normal,
                    unreachedLineType: LineType.dotted,
                    lineThickness: 2,
                    lineLength: 60,
                  ),
                  activeStep: state,
                  stepShape: StepShape.circle,
                  borderThickness: 5,
                  stepRadius: 16,
                  internalPadding: 15,
                  unreachedStepTextColor: Colors.grey,
                  unreachedStepBackgroundColor: Colors.transparent,
                  unreachedStepIconColor: Colors.grey,
                  unreachedStepBorderColor: Colors.grey,
                  activeStepTextColor: Colors.blue,
                  activeStepIconColor: Colors.blue,
                  activeStepBackgroundColor: Colors.transparent,
                  activeStepBorderColor: Colors.blue,
                  finishedStepTextColor: Colors.green,
                  finishedStepBorderColor: Colors.green,
                  finishedStepIconColor: Colors.green,
                  finishedStepBackgroundColor: Colors.transparent,
                  unreachedStepBorderType: BorderType.dotted,
                  activeStepBorderType: BorderType.dotted,
                  finishedStepBorderType: BorderType.normal,
                  showLoadingAnimation: false,
                  steps: [
                    EasyStep(
                      icon: const Icon(Icons.person),
                      activeIcon: const Icon(Icons.add),
                      finishIcon: const Icon(Icons.done),
                      title: "basics".tr,
                    ),
                    EasyStep(
                      icon: const Icon(Icons.book_outlined),
                      activeIcon: const Icon(Icons.add),
                      finishIcon: const Icon(Icons.done),
                      title: "education".tr,
                    ),
                    EasyStep(
                      icon: const Icon(Icons.work_history_outlined),
                      activeIcon: const Icon(Icons.add),
                      finishIcon: const Icon(Icons.done),
                      title: "experience".tr,
                    ),
                    EasyStep(
                      icon: const Icon(Icons.work_outline_rounded),
                      activeIcon: const Icon(Icons.add),
                      finishIcon: const Icon(Icons.done),
                      title: "preference".tr,
                    ),
                    EasyStep(
                      icon: const Icon(Icons.recent_actors),
                      activeIcon: const Icon(Icons.add),
                      finishIcon: const Icon(Icons.done),
                      title: "resume".tr,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: switch (state) {
                  0 => const BasicDetailsBody(),
                  1 => const EducationPageBody(),
                  2 => const ExperiencePageBody(),
                  3 => const Text("Job Preferences Body"),
                  4 => const Text("Resume Body"),
                  _ => const SizedBox.shrink(),

                  // 1 => const EducationPageBody(),
                  // 2 => const ExperiencePageBody(),
                  // 3 => const JobPreferencesBody(),
                  // 4 => const UploadResume(),
                  // _ => const SizedBox.shrink(),
                },
              )
            ],
          );
        },
      ),
    );
  }
}
