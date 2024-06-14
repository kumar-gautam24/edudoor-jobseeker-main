import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_education_bloc/change_education_step_bloc.dart';
import 'package:edudoor_jobseeker/src/constants/options.dart';
import 'package:edudoor_jobseeker/src/logs/logger.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/delete_education.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/custom_elevated_btn.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/dynamic_model_search_box.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/location_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class EducationGraduateState extends StatefulWidget {
  final bool onlyUpdate;
  const EducationGraduateState({super.key, required this.onlyUpdate});

  @override
  State<EducationGraduateState> createState() => _EducationGraduateState();
}

class _EducationGraduateState extends State<EducationGraduateState> {
  String? _degreeName;
  String? _fieldOfStudy;
  String? _collegeUniversity;
  String? _degreeType;
  double? _lat;
  double? _lng;
  late TextEditingController _locationController;
  String? _passingYear;
  String? _percentage;
  final date = DateTime.now();
  bool? _showDelete = false;

  update() {
    final jobseekerModel = context.read<AuthenticationBloc>().jobseekerModel;

    _degreeName = jobseekerModel?.education?.graduate?.degreeName;
    _fieldOfStudy = jobseekerModel?.education?.graduate?.fieldOfStudy;
    _collegeUniversity = jobseekerModel?.education?.graduate?.collegeORuniversity;
    _degreeType = jobseekerModel?.education?.graduate?.degreeType;
    _lat = jobseekerModel?.education?.graduate?.lat;
    _lng = jobseekerModel?.education?.graduate?.lng;
    _passingYear = jobseekerModel?.education?.graduate?.passingYear?.toString();
    _percentage = jobseekerModel?.education?.graduate?.percentageORmarks?.toString();
    _locationController.text = jobseekerModel?.education?.graduate?.address ?? "";
    _showDelete = _degreeName != null || _fieldOfStudy != null || _collegeUniversity != null || _degreeType != null || _lat != null || _lng != null || _passingYear != null || _percentage != null;
  }

  @override
  void initState() {
    super.initState();
    _locationController = TextEditingController();
    update();
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
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
        print("refreshed");
        return Expanded(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: null,
                              child: Text(
                                'Bachelor\'s Degree',
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
                                      showEducationDialog(context, 'Delete graduate dialog', 'Delete graduate Education Details', 'Are you sure you want to delete graduate Education Details?', () {
                                        context.read<AuthenticationBloc>().add(
                                              AuthenticationEducationDetailsEvent(
                                                true,
                                                EducationType.graduation,
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
                          label: 'Degree Name',
                          list: Options.GRADUATE_DEGREE_NAME,
                          selectedValue: _degreeName,
                          selectedItemRadius: 10,
                          onChanged: (degreeName) {
                            setState(() {
                              _degreeName = degreeName;
                            });
                          },
                          icon: Icons.cast_for_education_outlined,
                        ),
                        Gap(10.sp),
                        ModalSearchbox(
                          label: 'Field of Study',
                          list: _degreeName != null ? Options.FIELD_OF_STUDIES_OBJECT[_degreeName]! : [],
                          selectedValue: _fieldOfStudy,
                          selectedItemRadius: 10,
                          onChanged: (fieldOfStudy) {
                            _fieldOfStudy = fieldOfStudy;
                          },
                          isShowProgress: _degreeName == null,
                          progressWidget: const Center(
                            child: Text("Please choose degree name first.."),
                          ),
                          icon: Icons.school,
                        ),
                        Gap(10.sp),
                        ModalSearchbox(
                          label: 'College/University',
                          list: Options.COLLEGE_UNIVERSITY,
                          selectedValue: _collegeUniversity,
                          selectedItemRadius: 10,
                          onChanged: (collegeUniversity) {
                            _collegeUniversity = collegeUniversity;
                          },
                          icon: Icons.corporate_fare,
                        ),
                        Gap(10.sp),
                        ModalSearchbox(
                          label: 'Degree Type',
                          list: Options.DEGREE_TYPE,
                          selectedValue: _degreeType,
                          selectedItemRadius: 10,
                          onChanged: (degreeType) {
                            _degreeType = degreeType;
                          },
                          icon: Icons.description_outlined,
                        ),
                        Gap(10.sp),
                        LocationSelection(
                          controller: _locationController,
                          hint: "location".tr,
                          suffix: Icon(
                            Icons.location_on,
                            color: Theme.of(context).primaryColor,
                          ),
                          setLatLong: (lat, lng) {
                            _lat = lat;
                            _lng = lng;
                          },
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
                          EducationType.graduation,
                          clear: false,
                          degreeName: _degreeName,
                          fieldOfStudy: _fieldOfStudy,
                          collegeUniversity: _collegeUniversity,
                          passingYear: _passingYear,
                          percentageORmarks: _percentage,
                          degreeType: _degreeType,
                          lat: _lat,
                          lng: _lng,
                          address: _locationController.text,
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
