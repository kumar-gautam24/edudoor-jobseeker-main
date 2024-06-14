// import 'package:edudoor/src/Blocs_Cubits/User_Bloc/user_bloc.dart';
// import 'package:edudoor/src/blocs_cubits/change_register_step_block/change_register_step_bloc.dart';
// import 'package:edudoor/src/views/Widgets/drop_down_and_search.dart';
// import 'package:edudoor/src/views/Widgets/education_form_advance.dart';
// import 'package:edudoor/src/views/Widgets/education_form_basic.dart';
// import 'package:edudoor/src/views/Widgets/education_form_language.dart';
// import 'package:edudoor/src/views/Widgets/education_form_other_course.dart';
// import 'package:edudoor/src/views/Widgets/education_levels.dart';
// import 'package:edudoor/src/views/Widgets/input_decoration_function.dart';
// import 'package:edudoor/src/views/Widgets/location_selection.dart';
// import 'package:edudoor/src/views/Widgets/radio_option_selecter.dart';
// import 'package:edudoor/src/views/custom_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EducationPageBody extends StatefulWidget {
//   final bool onlyUpdate;

//   const EducationPageBody({
//     super.key,
//     this.onlyUpdate = false,
//   });

//   @override
//   State<EducationPageBody> createState() => _EducationPageBodyState();
// }

// class _EducationPageBodyState extends State<EducationPageBody> {
//   late bool readOnly;

//   int selectedLevel = 0;
//   void changeSelectedLevel(int level) {
//     setState(() {
//       selectedLevel = level;
//     });
//   }

//   late final TextEditingController _locationController;
//   String? _board;
//   String? _selectedValue = null;

//   List<String> _schoolMediumOption = [for (var i = 0; i < 100; i++) "$i"];
//   List<String> _selectedTechnicalDegree = [];
//   double? _lat;
//   double? _lng;
//   void setLatLong(double? lat, double? lng) {
//     _lat = lat;
//     _lng = lng;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _locationController = TextEditingController();
//     readOnly = widget.onlyUpdate;
//   }

//   void _onBoardSelected(dynamic value) {
//     setState(() {
//       _board = value;
//     });
//   }

//   @override
//   void dispose() {
//     _locationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           EducationLevels(
//               selectedLevel: selectedLevel,
//               changeSelectedLevel: changeSelectedLevel),
//           switch (selectedLevel) {
//             0 => EducationFormBasic(
//                 readOnly: readOnly,
//               ),
//             1 => EducationFormBasic(
//                 readOnly: readOnly,
//               ),
//             2 => EducationFormAdvance(
//                 readOnly: readOnly,
//               ),
//             3 => EducationFormAdvance(
//                 readOnly: readOnly,
//               ),
//             4 => EducationFormAdvance(
//                 readOnly: readOnly,
//               ),
//             5 => EducationFormLanguage(
//                 readOnly: readOnly,
//               ),
//             6 => EducationFormOtherCourse(
//                 readOnly: readOnly,
//               ),
//             _ => const SizedBox.shrink()
//           },
//           Container(
//             decoration: const BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Color.fromARGB(71, 156, 229, 228),
//                 ),
//               ],
//             ),
//             child: SizedBox(
//               height: 60,
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     if (widget.onlyUpdate)
//                       IconButton(
//                         onPressed: () {
//                           setState(
//                             () {
//                               readOnly = !readOnly;
//                             },
//                           );
//                         },
//                         icon: Icon(
//                           readOnly ? Icons.edit : Icons.edit_off,
//                         ),
//                       ),
//                     Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8.0,
//                         ),
//                         child: BlocConsumer<UserBloc, UserState>(
//                           listener: (context, state) {
//                             if (state is UserDataSuccess) {
//                               context.read<ChangeRegisterStepBloc>().add(
//                                     ChangeRegisterStepUpdateEvent(
//                                         activeStep: 1),
//                                   );
//                             }
//                             if (state is UserDataError) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text(state.errorMessage),
//                                 ),
//                               );
//                             }
//                           },
//                           builder: (context, state) {
//                             if (state is UpdateUserDataLoading) {
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             }
//                             return Row(
//                               children: [
//                                 TextButton(
//                                   onPressed: readOnly && selectedLevel > 5
//                                       ? null
//                                       : () {
//                                           changeSelectedLevel(
//                                               selectedLevel + 1);
//                                         },
//                                   child: Text(
//                                     "Skip",
//                                     style: TextStyle(
//                                       color: readOnly && selectedLevel > 5
//                                           ? Colors.blue[200]
//                                           : Colors.blue,
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: CustomElevatedButton(
//                                     onPressed: readOnly
//                                         ? null
//                                         : () {
//                                             // context.read<UserBloc>().add(UpdateUserData(
//                                             //       convertToJson(),
//                                             //     ));

//                                             // print(_image.toString());
//                                             // print(_nameController.text);
//                                             // print(_emailController.text);
//                                             // print(_locationController.text);
//                                             // print(_birthdayController.text);
//                                             // print(_birthday);
//                                             // print(_gender);
//                                             // print(_lat! + _lng!);
//                                           },
//                                     color: Colors.blue,
//                                     child: Text(
//                                       widget.onlyUpdate ? "Update" : 'Next',
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
