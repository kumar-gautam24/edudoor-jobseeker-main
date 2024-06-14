import 'package:edudoor_jobseeker/src/blocs_cubits/authentication_bloc/authentication_bloc.dart';
import 'package:edudoor_jobseeker/src/blocs_cubits/change_education_bloc/change_education_step_bloc.dart';
import 'package:edudoor_jobseeker/src/constants/options.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/dialog_confirm.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/general_dialog_alert_dialog_loading.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/custom_elevated_btn.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/dynamic_model_search_box.dart';
import 'package:edudoor_jobseeker/src/view/common/widgets/multi_select_btns.dart';
import 'package:edudoor_jobseeker/src/view/complete_profile/widgets/radio_option_selecter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EducationFormLanguageState extends StatefulWidget {
  final bool onlyUpdate;
  const EducationFormLanguageState({super.key, required this.onlyUpdate});

  @override
  State<EducationFormLanguageState> createState() => _EducationFormLanguageStateState();
}

class _EducationFormLanguageStateState extends State<EducationFormLanguageState> {
  int? _selectedLang;
  late List<String> _otherLang;

  @override
  void initState() {
    super.initState();
    final education = context.read<AuthenticationBloc>().jobseekerModel?.education;
    _selectedLang = education?.englishProficiency == -1 ? null : education?.englishProficiency;
    _otherLang = education?.otherLanguages ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Add language you know to increase chance of getting hired',
                            style: TextStyle(fontWeight: FontWeight.w400, color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(.8) ?? Theme.of(context).primaryColor),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              context.read<ChangeEducationStepBloc>().add(ChangeEducationStepIncrementEvent());
                            },
                            child: const Text('Skip'))
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  RadioOptionSelector(
                    title: 'Choose your English Speaking level',
                    options: [
                      SelectableOption(label: 'No English', value: 0, hint: 'Cannot talk in English'),
                      SelectableOption(label: 'Basic', value: 1, hint: 'you can understand/speak basic sentences'),
                      SelectableOption(label: 'Intermediate', value: 2, hint: 'you can have conversation in English on some topic.'),
                      SelectableOption(label: 'Advanced', value: 3, hint: 'you can do your entire job in English and speak fluently.')
                    ],
                    initialValue: _selectedLang,
                    onSelectionChanged: (value) {
                      _selectedLang = value;
                      setState(() {});
                    },
                  ),
                  Gap(10.sp),
                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: ModalSearchbox(
                      label: 'Other language',
                      list: Options.OTHER_LANGUAGES,
                      isMultipleSelect: true,
                      selectedMultipleValue: _otherLang,
                      selectedValue: _selectedLang?.toString(),
                      selectedItemRadius: 50,
                      onChanged: (selectedLang) {
                        _otherLang = selectedLang;
                      },
                      icon: Icons.language_rounded,
                      btnType: SelectBtn.addBtn,
                      addBtnIcon: Icons.add_circle,
                      addBtnTitle: 'Add  Language',
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(
            onlyUpdate: widget.onlyUpdate,
            onPressed: () {
              context.read<AuthenticationBloc>().add(
                    AuthenticationEducationDetailsEvent(
                      true,
                      clear: false,
                      EducationType.english,
                      englishProficiency: _selectedLang,
                      otherLanguage: _otherLang,
                    ),
                  );
            },
          )
        ],
      ),
    );
  }
}
