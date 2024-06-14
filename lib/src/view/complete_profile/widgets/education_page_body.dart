import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_education_bloc/change_education_step_bloc.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_additional.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_diploma.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_doctorate.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_graduate.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_language.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_pg.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_ten.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_form_twelve.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/education_levels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationPageBody extends StatefulWidget {
  final bool onlyUpdate;

  const EducationPageBody({
    super.key,
    this.onlyUpdate = false,
  });

  @override
  State<EducationPageBody> createState() => _EducationPageBodyState();
}

class _EducationPageBodyState extends State<EducationPageBody> {
  late bool readOnly;

  int selectedLevel = 0;
  void changeSelectedLevel(int level) {
    setState(() {
      print("object");
      selectedLevel = level;
    });
  }

  late final TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController();
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ChangeEducationStepBloc, int>(
        builder: (context, state) {
          return Column(
            children: [
              const EducationLevels(),
              switch (state) {
                0 => EducationTenBasicState(
                    onlyUpdate: widget.onlyUpdate,
                  ),
                1 => EducationTwelveBasicState(onlyUpdate: widget.onlyUpdate),
                2 => EducationDiplomaState(onlyUpdate: widget.onlyUpdate),
                3 => EducationGraduateState(onlyUpdate: widget.onlyUpdate),
                4 => EducationPGState(onlyUpdate: widget.onlyUpdate),
                5 => EducationDoctorateState(onlyUpdate: widget.onlyUpdate),
                6 => EducationFormLanguageState(onlyUpdate: widget.onlyUpdate),
                7 => EducationFormAdditionalState(onlyUpdate: widget.onlyUpdate),
                _ => const SizedBox.shrink()
              },
            ],
          );
        },
      ),
    );
  }
}
