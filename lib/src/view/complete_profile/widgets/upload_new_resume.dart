// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import '../../../Providers/firebase_provider.dart';
// import '../../pdf_viewer/views/pdf_screen.dart';

// class UploadResume extends StatefulWidget {
//   const UploadResume({super.key});

//   @override
//   State<UploadResume> createState() => _UploadResumeState();
// }

// class _UploadResumeState extends State<UploadResume> {
//   String pdfUrl = "";
//   bool _isUploaded = false;
//   File? _resumeFile;
//   int _pdfIndex = 0;
//   Future<void> _pickResume() async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['pdf', 'doc', 'docx'],
//       );

//       if (result != null) {
//         setState(() async {
//           _resumeFile = File(result.files.single.path!);
//           FirebaseProvider firebaseProvider = FirebaseProvider();
//           pdfUrl =
//               await firebaseProvider.uploadResumeAndExtractText(_resumeFile!);
//           _isUploaded = true;
//           _pdfIndex = 0; // Reset PDF index when a new resume is uploaded
//         });
//       }
//     } catch (e) {
//       print("Error picking resume: $e");
//     }
//   }

//   Future<void> _updateResume() async {
//     await _pickResume();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload Resume"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           const Center(
//             child: Text(
//               "Upload your resume",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ),
//           const Center(
//             child: Text("Receive 2x job offer after uploading",
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w400,
//                 )),
//           ),
//           const Padding(
//             padding: EdgeInsets.fromLTRB(20, 2, 20, 0),
//             child: Text(
//                 '''Supported file formats .pdf or .docs file only maximum file size  5 MB''',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w300,
//                 )),
//           ),
//           const Gap(20),
//           Center(
//             child: _isUploaded
//                 ? ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PdfScreen(
//                             pdfUrl: pdfUrl,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Text("View Resume"))
//                 : InkWell(
//                     onTap: _pickResume,
//                     child: SizedBox(
//                       width: 300,
//                       height: 350,
//                       child: Image.asset('assets/images/upload_resume.png',
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
