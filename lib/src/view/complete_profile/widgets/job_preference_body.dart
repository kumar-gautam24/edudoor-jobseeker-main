// import 'package:edudoor/src/blocs_cubits/change_register_step_block/change_register_step_bloc.dart';
// import 'package:edudoor/src/views/Widgets/drop_down_and_search.dart';
// import 'package:edudoor/src/views/Widgets/drop_down.dart';
// import 'package:edudoor/src/views/Widgets/location_selection.dart';
// import 'package:edudoor/src/views/custom_widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
// import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';
// import '../Blocs_Cubits/User_Bloc/user_bloc.dart';

// class JobPreferencesBody extends StatefulWidget {
//   final bool onlyUpdate;
//   const JobPreferencesBody({
//     super.key,
//     this.onlyUpdate = false,
//   });

//   @override
//   State<JobPreferencesBody> createState() => _JobPreferencesBodyState();
// }

// class _JobPreferencesBodyState extends State<JobPreferencesBody> {
//   late bool readOnly;
//   String? _board;
//   final List<String> _schoolMediumOption = [for (var i = 0; i < 100; i++) "$i"];
//   List<String> _selectedTechnicalDegree = [];

//   String? _selectedValue = null;

//   @override
//   void initState() {
//     super.initState();
//     readOnly = widget.onlyUpdate;
//     _locationController = TextEditingController();
//   }

//   late final TextEditingController _locationController;
//   double? _lat;
//   double? _lng;

//   void setLatLong(double? lat, double? lng) {
//     _lat = lat;
//     _lng = lng;
//   }

//   void onSelectedTechnicalDegreeSelected(value) {
//     _selectedTechnicalDegree = value;
//   }

//   void _onBoardSelected(dynamic value) {
//     setState(() {
//       _board = value;
//     });
//   }

//   int _selectedLocationOption = 0;

//   List<String> buttonList = ["Anywhere", "Desired Location"];

//   List<String> _genderOptions = ["Male", "Female", "Other"];

//   RangeValues _rangeValues = new RangeValues(0, 500);

//   String? _gender;
//   void setGender(value) {
//     setState(() {
//       _gender = value;
//     });
//   }

//   @override
//   void dispose() {
//     _locationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 children: [
//                   const Gap(10),
//                   DynamicModalSearchbox(
//                     label: 'Desire Job Title',
//                     options: _schoolMediumOption,
//                     onSelected: _onBoardSelected,
//                     readOnly: readOnly,
//                     icon: Icons.book_outlined,
//                     selectedValue: _board,
//                   ),
//                   const Gap(10),
//                   DynamicModalSearchbox(
//                     label: 'Teaching Subjects',
//                     isMultipleSelect: true,
//                     selectedMultipleValue: _selectedTechnicalDegree,
//                     options: _schoolMediumOption,
//                     onSelected: onSelectedTechnicalDegreeSelected,
//                     readOnly: readOnly,
//                     icon: Icons.language,
//                   ),
//                   const Gap(10),
//                   DynamicModalSearchbox(
//                     label: 'Teaching Classes',
//                     isMultipleSelect: true,
//                     selectedMultipleValue: _selectedTechnicalDegree,
//                     options: _schoolMediumOption,
//                     onSelected: onSelectedTechnicalDegreeSelected,
//                     readOnly: readOnly,
//                     icon: Icons.language,
//                   ),
//                   const Gap(10),
//                   DynamicModalSearchbox(
//                     label: 'Desired Job Type',
//                     options: _schoolMediumOption,
//                     onSelected: _onBoardSelected,
//                     readOnly: readOnly,
//                     icon: Icons.calendar_month_outlined,
//                   ),
//                   const Gap(10),
//                   const Align(
//                     alignment: AlignmentDirectional.centerStart,
//                     child: Text(
//                       'Preferred Location',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     width: MediaQuery.of(context).size.width,
//                     child: CustomRadioButton(
//                       elevation: 2,
//                       buttonLables: buttonList,
//                       buttonValues: buttonList,
//                       radioButtonValue: readOnly
//                           ? null
//                           : (value, index) {
//                               _selectedLocationOption = index;
//                               setState(() {});
//                             },
//                       horizontal: true,
//                       enableShape: true,
//                       buttonSpace: 5,
//                       buttonColor: Colors.white,
//                       selectedColor: Colors.cyan,
//                     ),
//                   ),

//                   if (_selectedLocationOption == 1)
//                     Column(
//                       children: [
//                         const Gap(10),
//                         LocationSelection(
//                           controller: _locationController,
//                           hint: "Desired Location",
//                           suffix: const Icon(Icons.location_on),
//                           setLatLong: setLatLong,
//                           readOnly: readOnly,
//                           errorString: null,
//                         ),
//                       ],
//                     ),
//                   const Gap(10),
//                   const Align(
//                     alignment: AlignmentDirectional.centerStart,
//                     child: Text(
//                       'Desired Salary',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Min: ${_rangeValues.start.round()}",
//                         style: const TextStyle(color: Colors.blue),
//                       ),
//                       Text(
//                         "Max: ${_rangeValues.end.round()}",
//                         style: const TextStyle(color: Colors.blue),
//                       )
//                     ],
//                   ),
//                   RangeSlider(
//                     values: _rangeValues,
//                     max: 500,
//                     divisions: 500,
//                     activeColor: Colors.blue,
//                     overlayColor: const MaterialStatePropertyAll(
//                         Color.fromARGB(255, 144, 196, 238)),
//                     labels: RangeLabels(
//                       _rangeValues.start.round().toString(),
//                       _rangeValues.end.round().toString(),
//                     ),
//                     onChanged: readOnly
//                         ? null
//                         : (RangeValues values) {
//                             _rangeValues = values;
//                             setState(() {});
//                           },
//                   ),
//                   DropDown(
//                     hint: "Salary Numerals",
//                     onChanged: setGender,
//                     suffix: null,
//                     readOnly: readOnly,
//                     errorString: null,
//                     value: _gender,
//                     options: _genderOptions,
//                     icon: Icons.people,
//                   ),
//                   const Gap(10),
//                   DropDown(
//                     hint: "Salary D",
//                     onChanged: setGender,
//                     suffix: null,
//                     readOnly: readOnly,
//                     errorString: null,
//                     value: _gender,
//                     options: _genderOptions,
//                     icon: Icons.people,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Container(
//           decoration: const BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Color.fromARGB(71, 156, 229, 228),
//               ),
//             ],
//           ),
//           child: SizedBox(
//             height: 60,
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   if (widget.onlyUpdate)
//                     IconButton(
//                       onPressed: () {
//                         setState(
//                           () {
//                             readOnly = !readOnly;
//                           },
//                         );
//                       },
//                       icon: Icon(
//                         readOnly ? Icons.edit : Icons.edit_off,
//                       ),
//                     ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8.0,
//                       ),
//                       child: BlocConsumer<UserBloc, UserState>(
//                         listener: (context, state) {
//                           if (state is UserDataSuccess) {
//                             context.read<ChangeRegisterStepBloc>().add(
//                                   ChangeRegisterStepUpdateEvent(activeStep: 1),
//                                 );
//                           }
//                           if (state is UserDataError) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(state.errorMessage),
//                               ),
//                             );
//                           }
//                         },
//                         builder: (context, state) {
//                           if (state is UpdateUserDataLoading) {
//                             return const Center(
//                                 child: CircularProgressIndicator());
//                           }
//                           return CustomElevatedButton(
//                             onPressed: readOnly
//                                 ? null
//                                 : () {
//                                     // context.read<UserBloc>().add(UpdateUserData(
//                                     //       convertToJson(),
//                                     //     ));

//                                     // print(_image.toString());
//                                     // print(_nameController.text);
//                                     // print(_emailController.text);
//                                     // print(_locationController.text);
//                                     // print(_birthdayController.text);
//                                     // print(_birthday);
//                                     // print(_gender);
//                                     // print(_lat! + _lng!);
//                                   },
//                             color: readOnly ? Colors.blue[200] : Colors.blue,
//                             child: Text(
//                               widget.onlyUpdate ? "Update" : 'Next',
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
