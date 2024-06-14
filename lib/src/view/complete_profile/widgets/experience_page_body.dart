import 'dart:io';
import 'package:edudoor_jobseeker/src/blocs_cubits/all_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/constants/options.dart';
import 'package:edudoor_jobseeker/src/helper/date_timer_helper.dart';
import 'package:edudoor_jobseeker/src/models/jobseeker_model.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/themes/app_decorations.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/general_dialog_alert_dialog_loading.dart';
import 'package:edudoor_jobseeker/src/view/common/gradients/all_gradient.dart';
import 'package:edudoor_jobseeker/src/view/common/snack_bar/custom_get_snack_bar.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/circular_avatar.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/custom_elevated_btn.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/custom_radio_btn.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/date_time_selection.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/dynamic_model_search_box.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/location_selection.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/email_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:edudoor_jobseeker/src/view/common/image_picker/image_picker.dart';
import 'package:get/get.dart';

class ExperiencePageBody extends StatefulWidget {
  final bool onlyUpdate;
  const ExperiencePageBody({super.key, this.onlyUpdate = false});

  @override
  State<ExperiencePageBody> createState() => _ExperiencePageBodyState();
}

class _ExperiencePageBodyState extends State<ExperiencePageBody> {
  File? _image;
  String? _gender;
  DateTime? _birthday;
  double? _lat;
  double? _lng;
  String? _profilePicLinkBlurHash;
  String? _profilePicLink;

  late bool _isExperience;
  late String _experienceIn;
  String? _totalYearOfExperience;

  update() {
    final latestExperience = context.read<AuthenticationBloc>().jobseekerModel?.latestExperience;
    _isExperience = latestExperience?.isExperienced ?? true;
    _experienceIn = latestExperience?.experienceIn ?? Options.JOB_CATEGORY[0];
    _totalYearOfExperience = latestExperience?.totalYearOfExperience?.toString();
  }

  @override
  void initState() {
    final JobseekerModel? jobseekerModel = AllBloc.authenticationBloc.jobseekerModel;
    AllBloc.authenticationBloc.nameController.text = jobseekerModel?.fullName?.capitalize ?? '';
    AllBloc.authenticationBloc.emailController.text = jobseekerModel?.email ?? '';
    AllBloc.authenticationBloc.locationController.text = jobseekerModel?.address ?? '';
    AllBloc.authenticationBloc.birthdayController.text = jobseekerModel?.dob?.formattedDate ?? '';

    super.initState();
    update();
  }

  @override
  Widget build(BuildContext context) {
    final jobseekerModel = context.watch<AuthenticationBloc>().jobseekerModel;
    _gender = jobseekerModel?.gender;
    _lat = jobseekerModel?.lat;
    _lng = jobseekerModel?.lng;
    _birthday = jobseekerModel?.dob;
    _profilePicLink = jobseekerModel?.profilePicLink;
    _profilePicLinkBlurHash = jobseekerModel?.profilePicLinkBlurHash;

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationSuccessState) {
          update();
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Gap(10.sp),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Do You have work Experience',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CustomRadioBtn(
                        buttonList: const ['No', 'Yes'],
                        buttonValues: const [false, true],
                        initialSelection: _isExperience ? 1 : 0,
                        radioButtonValue: (value, index) {
                          setState(() {
                            _isExperience = value;
                          });
                        },
                      ),
                      if (_isExperience == true)
                        Column(
                          children: [
                            Gap(10.sp),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Text(
                                'Experience In',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            CustomRadioBtn(
                              buttonList: Options.JOB_CATEGORY,
                              buttonValues: Options.JOB_CATEGORY,
                              initialSelection: Options.JOB_CATEGORY.indexOf(_experienceIn),
                              radioButtonValue: (value, index) {
                                setState(() {
                                  _experienceIn = value;
                                });
                              },
                            ),
                            Gap(10.sp),
                            ModalSearchbox(
                              label: 'Total Experience',
                              suffix: " Years",
                              list: [for (var i = 0; i <= 40; i++) "$i"],
                              selectedValue: _totalYearOfExperience?.toString(),
                              onChanged: (percentage) {
                                setState(() {
                                  _totalYearOfExperience = percentage;
                                });
                              },
                              icon: Icons.percent,
                            ),
                            if (_totalYearOfExperience != null && int.parse(_totalYearOfExperience!) > 0)
                              const Column(
                                children: [
                                   Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      'Latest Experience Details',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                          ],
                        ),
                      TextFormField(
                        inputFormatters: [
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            return newValue.copyWith(
                              text: newValue.text.capitalize,
                            );
                          }),
                        ],
                        controller: context.read<AuthenticationBloc>().nameController,
                        cursorRadius: Radius.circular(25.sp),
                        decoration: AppDecoration.inputFieldDecoration(
                          context,
                          suffix: Icon(
                            Icons.person,
                            color: Theme.of(context).primaryColor,
                          ),
                          hint: "name".tr,
                        ).inputDecoration,
                      ),
                      Gap(10.sp),
                      TextFormField(
                        controller: context.read<AuthenticationBloc>().emailController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        cursorRadius: Radius.circular(25.sp),
                        decoration: AppDecoration.inputFieldDecoration(
                          context,
                          suffix: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                                  builder: (context, state) {
                                    final isVerified = jobseekerModel?.isEmailVerified == true && context.read<AuthenticationBloc>().emailController.text == jobseekerModel?.email;
                                    return TextButton(
                                      onPressed: () {
                                        if (context.read<AuthenticationBloc>().emailController.text.isEmpty) {
                                          CustomGetSnackBar(title: "Email required", subTitle: "Please enter a valid email", backgroundGradient: AllGradient.infoGradient).show();
                                          return;
                                        }
                                        context.read<AuthenticationBloc>().emailOtpController.text = '';
                                        if (!isVerified) {
                                          context.read<AuthenticationBloc>().add(AuthenticationSendEmailOtpEvent(email: context.read<AuthenticationBloc>().emailController.text));
                                        }
                                        dialogAnimationWrapper(
                                            context: context,
                                            slideMode: SlideMode.right,
                                            isTransparent: true,
                                            child: EmailOtpScreen(
                                              email: context.read<AuthenticationBloc>().emailController.text,
                                            ),
                                            barrierLabel: 'email_verification_dialog');
                                      },
                                      child: isVerified
                                          ? Icon(
                                              Icons.verified,
                                              color: colorGreen,
                                            )
                                          : Text(
                                              "verify".tr,
                                              style: const TextStyle(fontSize: 12),
                                            ),
                                    );
                                  },
                                ),
                                Icon(
                                  Icons.email,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                          ),
                          hint: "email".tr,
                        ).inputDecoration,
                      ),
                      Gap(10.sp),
                      LocationSelection(
                        controller: context.read<AuthenticationBloc>().locationController,
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
                      DateTimeSelection(
                        controller: context.read<AuthenticationBloc>().birthdayController,
                        hint: "birthday".tr,
                        suffix: Icon(
                          Icons.calendar_month,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChange: (pickedDate) {
                          _birthday = pickedDate;
                        },
                      ),
                      const Gap(10),
                      ModalSearchbox(
                        label: 'gender'.tr,
                        list: Options.GENDER,
                        icon: Icons.person,
                        selectedValue: _gender,
                        onChanged: (value) {
                          _gender = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CustomElevatedButton(
              onlyUpdate: widget.onlyUpdate,
              onPressed: () {
                context.read<AuthenticationBloc>().add(AuthenticationUpdateBasicDetailsEvent(false,
                    fullName: context.read<AuthenticationBloc>().nameController.text,
                    email: context.read<AuthenticationBloc>().emailController.text,
                    address: context.read<AuthenticationBloc>().locationController.text,
                    lat: _lat,
                    lng: _lng,
                    dob: _birthday,
                    gender: _gender));
              },
            )
          ],
        );
      },
    );
  }
}
