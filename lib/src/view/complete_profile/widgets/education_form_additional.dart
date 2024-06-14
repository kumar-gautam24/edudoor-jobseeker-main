import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_register_step_block/change_register_step_bloc.dart';
import 'package:edudoor_jobseeker/src/constants/options.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/custom_elevated_btn.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/multi_select_btns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationFormAdditionalState extends StatefulWidget {
  final bool onlyUpdate;
  const EducationFormAdditionalState({super.key, required this.onlyUpdate});

  @override
  State<EducationFormAdditionalState> createState() => _EducationFormAdditionalStateState();
}

class _EducationFormAdditionalStateState extends State<EducationFormAdditionalState> {
  late List<String> _technicalDegree;

  @override
  void initState() {
    super.initState();
    final education = context.read<AuthenticationBloc>().jobseekerModel?.education;
    _technicalDegree = education?.technicalDegrees ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Select additional technical degree you you have...',
                          style: TextStyle(fontWeight: FontWeight.w400, color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(.8) ?? Theme.of(context).primaryColor),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            if (widget.onlyUpdate) {
                              AppNavigator.pop();
                            } else {
                              context.read<ChangeRegisterStepBloc>().add(ChangeRegisterStepIncrementEvent());
                            }
                          },
                          child: const Text('Skip'))
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        MultiSelectBtns(
                          list: Options.TECHNICAL_DEGREES,
                          onChange: (value) {
                            setState(() {
                              if (_technicalDegree.contains(value)) {
                                _technicalDegree.remove(value);
                              } else {
                                _technicalDegree.add(value);
                              }
                            });
                          },
                          selectedValue: _technicalDegree,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomElevatedButton(
            onlyUpdate: widget.onlyUpdate,
            onPressed: () {
              context.read<AuthenticationBloc>().add(
                    AuthenticationEducationDetailsEvent(
                      widget.onlyUpdate,
                      EducationType.technicalDegrees,
                      clear: false,
                      technicalDegrees: _technicalDegree,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }
}
