// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';


// class ExperiencePageBody extends StatefulWidget {
//   final bool onlyUpdate;
//   const ExperiencePageBody({
//     super.key,
//     this.onlyUpdate = false,
//   });

//   @override
//   State<ExperiencePageBody> createState() => _ExperiencePageBodyState();
// }

// class _ExperiencePageBodyState extends State<ExperiencePageBody> {
//   late bool readOnly;
//   String? _board;
//   final List<String> _schoolMediumOption = [for (var i = 0; i < 100; i++) "$i"];
//   List<String> _selectedTechnicalDegree = [];
//   late final TextEditingController _nameController;
//   late final TextEditingController _birthdayController;
//   late final DateTime _birthday;

//   String? _selectedValue = null;

//   @override
//   void initState() {
//     super.initState();
//     readOnly = widget.onlyUpdate;
//     _nameController = TextEditingController();
//     _locationController = TextEditingController();
//     _birthdayController = TextEditingController();
//     _birthday = DateTime.now();
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
//   int _selectedExperienceOption = 0;

//   List<String> buttonList = ["Yes", "No"];

//   List<String> _experienceOption = ["Teaching", "Non-Teaching", "Both"];

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
//     _nameController.dispose();
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

//                   Container(
//                     padding: const EdgeInsets.all(10),
//                     width: MediaQuery.of(context).size.width,

//                   if (_selectedLocationOption == 0)
//                     Column(
//                       children: [
//                         const Gap(10),
//                         if (_selectedExperienceOption != 1)
//                           Column(
//                             children: [
//                               const Gap(10),
//                               const Align(
//                                 alignment: AlignmentDirectional.centerStart,
//                                 child: Text(
//                                   'Latest Experience',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               const Gap(10),
//                               DynamicModalSearchbox(
//                                 label: 'Job Title',
//                                 isMultipleSelect: true,
//                                 selectedMultipleValue: _selectedTechnicalDegree,
//                                 options: _schoolMediumOption,
//                                 onSelected: onSelectedTechnicalDegreeSelected,
//                                 readOnly: readOnly,
//                                 icon: Icons.language,
//                               ),
//                               const Gap(10),
//                               CustomTextInput(
//                                 controller: _nameController,
//                                 hint: "Organization",
//                                 suffix: const Icon(
//                                   Icons.person,
//                                 ),
//                                 readOnly: readOnly,
//                                 errorString: null,
//                               ),
//                               const Gap(10),
//                               CustomTextInput(
//                                   controller: _nameController,
//                                   hint: "Salary",
//                                   suffix: const Icon(
//                                     Icons.person,
//                                   ),
//                                   readOnly: readOnly,
//                                   errorString: null,
//                                   inputType: TextInputType.number),
//                               const Gap(10),
//                               DropDown(
//                                 hint: "Salary Numerals",
//                                 onChanged: setGender,
//                                 suffix: null,
//                                 readOnly: readOnly,
//                                 errorString: null,
//                                 value: _gender,
//                                 options: _genderOptions,
//                                 icon: Icons.people,
//                               ),
//                               const Gap(10),
//                               DropDown(
//                                 hint: "Salary D",
//                                 onChanged: setGender,
//                                 suffix: null,
//                                 readOnly: readOnly,
//                                 errorString: null,
//                                 value: _gender,
//                                 options: _genderOptions,
//                                 icon: Icons.people,
//                               ),
//                               const Gap(10),
//                               LocationSelection(
//                                 controller: _locationController,
//                                 hint: "Organization Location",
//                                 suffix: const Icon(Icons.location_on),
//                                 setLatLong: setLatLong,
//                                 readOnly: readOnly,
//                                 errorString: null,
//                               ),
//                               const Gap(10),
//                               DateTimeSelection(
//                                 controller: _birthdayController,
//                                 hint: "Start Date",
//                                 suffix: const Icon(
//                                   Icons.calendar_month,
//                                 ),
//                                 readOnly: readOnly,
//                                 errorString: null,
//                                 onChange: (pickedDate) {
//                                   print(pickedDate);
//                                 },
//                               ),
//                               const Gap(10),
//                               DateTimeSelection(
//                                 controller: _birthdayController,
//                                 hint: "End Date",
//                                 suffix: const Icon(
//                                   Icons.calendar_month,
//                                 ),
//                                 readOnly: readOnly,
//                                 errorString: null,
//                                 onChange: (pickedDate) {
//                                   print(pickedDate);
//                                 },
//                               ),
//                               const Gap(10),
//                               const Align(
//                                 alignment: AlignmentDirectional.centerStart,
//                                 child: Text(
//                                   'Notice Period',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.all(10),
//                                 width: MediaQuery.of(context).size.width,
//                                 child: CustomRadioButton(
//                                   elevation: 2,
//                                   buttonLables: buttonList,
//                                   buttonValues: buttonList,
//                                   radioButtonValue: readOnly
//                                       ? null
//                                       : (value, index) {
//                                           _selectedLocationOption = index;
//                                           setState(() {});
//                                         },
//                                   horizontal: true,
//                                   enableShape: true,
//                                   buttonSpace: 5,
//                                   buttonColor: Colors.white,
//                                   selectedColor: Colors.cyan,
//                                 ),
//                               ),
//                             ],
//                           )
//                       ],
//                     )
//                 ],
//               ),
//             ),
//           ),
//         ),

//        ],
//     );
//   }
// }
