import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_education_bloc/change_education_step_bloc.dart';
import 'package:edudoor_jobseeker/src/constants/options.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/delete_education.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/general_dialog_alert_dialog_loading.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/custom_elevated_btn.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/dynamic_model_search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EducationTenBasicState extends StatefulWidget {
  final bool onlyUpdate;
  const EducationTenBasicState({super.key, required this.onlyUpdate});

  @override
  State<EducationTenBasicState> createState() => _EducationTenBasicStateState();
}

class _EducationTenBasicStateState extends State<EducationTenBasicState> {
  String? _board;
  String? _medium;
  String? _passingYear;
  String? _percentage;
  bool? _showDelete = false;
  final date = DateTime.now();

  update() {
    final jobseekerModel = context.read<AuthenticationBloc>().jobseekerModel;
    _board = jobseekerModel?.education?.the10Th?.board;
    _medium = jobseekerModel?.education?.the10Th?.medium;
    _passingYear = jobseekerModel?.education?.the10Th?.passingYear?.toString();
    _percentage = jobseekerModel?.education?.the10Th?.percentageORmarks?.toString();
    _showDelete = _board != null || _medium != null || _passingYear != null || _percentage != null;
  }

  @override
  void initState() {
    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
       if (state is AuthenticationSuccessState) {
          update();
        }
      },
      builder: (context, state) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 0.sp, left: 16.sp, right: 16.sp, bottom: 16.sp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: null,
                              child: Text(
                                'Secondary',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                if (_showDelete == true)
                                  TextButton(
                                    onPressed: () {
                                      showEducationDialog(context, 'Delete 10th dialog', 'Delete 10th Education Details', 'Are you sure you want to delete 10th Education Details?', () {
                                        context.read<AuthenticationBloc>().add(
                                              AuthenticationEducationDetailsEvent(
                                                true,
                                                EducationType.tenth,
                                                clear: true,
                                              ),
                                            );
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: colorRed,
                                    ),
                                  ),
                                TextButton(
                                    onPressed: () {
                                      context.read<ChangeEducationStepBloc>().add(ChangeEducationStepIncrementEvent());
                                    },
                                    child: const Text('Skip'))
                              ],
                            ),
                          ],
                        ),
                        ModalSearchbox(
                          label: 'Board',
                          list: Options.BOARDS,
                          selectedValue: _board,
                          selectedItemRadius: 10,
                          onChanged: (board) {
                            _board = board;
                          },
                          icon: Icons.book_outlined,
                        ),
                        Gap(10.sp),
                        ModalSearchbox(
                          label: 'School Medium',
                          list: Options.MEDIUMS,
                          selectedValue: _medium,
                          onChanged: (medium) {
                            _medium = medium;
                          },
                          icon: Icons.language,
                        ),
                        Gap(10.sp),
                        ModalSearchbox(
                          label: 'Passing Year',
                          list: [for (var i = date.year; i > date.year - 100; i--) "$i"],
                          selectedValue: _passingYear,
                          onChanged: (passingYear) {
                            _passingYear = passingYear;
                          },
                          icon: Icons.calendar_month_outlined,
                        ),
                        Gap(10.sp),
                        ModalSearchbox(
                          label: 'Percentage',
                          suffix: "%",
                          list: [for (var i = 100; i >= 0; i--) "$i"],
                          selectedValue: _percentage,
                          onChanged: (percentage) {
                            _percentage = percentage;
                          },
                          icon: Icons.percent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomElevatedButton(
                onlyUpdate: widget.onlyUpdate,
                onPressed: () {
                  context.read<AuthenticationBloc>().add(
                        AuthenticationEducationDetailsEvent(
                          true,
                          EducationType.tenth,
                          clear: false,
                          board: _board,
                          medium: _medium,
                          passingYear: _passingYear,
                          percentageORmarks: _percentage,
                        ),
                      );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
