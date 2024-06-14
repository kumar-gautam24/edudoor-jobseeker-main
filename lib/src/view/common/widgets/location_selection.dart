import 'package:edudoor_jobseeker/src/configurations/application.dart';
import 'package:edudoor_jobseeker/src/permissions/app_permission.dart';
import 'package:edudoor_jobseeker/src/routes/app_navigator.dart';
import 'package:edudoor_jobseeker/src/sizer/extension.dart';
import 'package:edudoor_jobseeker/src/themes/app_colors.dart';
import 'package:edudoor_jobseeker/src/themes/app_decorations.dart';
import 'package:edudoor_jobseeker/src/types/enums.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/general_dialog_alert_dialog_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:geolocator/geolocator.dart';

class LocationSelection extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? suffix;
  final Function setLatLong;
  const LocationSelection({
    super.key,
    required this.controller,
    required this.hint,
    required this.suffix,
    required this.setLatLong,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: true,
      readOnly: true,
      style: TextStyle(
        fontSize: 16.sp,
      ),
      onTap: () async {
        if (context.mounted) {
          CustomLocationPermission permission = await AppPermission.geoLocationPermissionRequest();
          if (permission == CustomLocationPermission.granted) {
            if (context.mounted) {
              _showLocationModal(context);
            }
          } else if (permission == CustomLocationPermission.denied) {
            if (context.mounted) {
              dialogAnimationAlertWrapper(context: context, slideMode: SlideMode.top, alertDialog: requestLocationPermission(permission), barrierLabel: "location_permission_dialog");
            }
          } else if (permission == CustomLocationPermission.disable) {
            if (context.mounted) {
              dialogAnimationAlertWrapper(context: context, slideMode: SlideMode.top, alertDialog: requestLocationPermission(permission), barrierLabel: "location_permission_dialog");
            }
          }
        }
      },
      decoration: AppDecoration.inputFieldDecoration(
        context,
        suffix: suffix,
        hint: hint,
      ).inputDecoration,
    );
  }

  Future<void> _showLocationModal(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const BeveledRectangleBorder(),
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PlacePicker(
                apiKey: Application.googleMapApiKey,
                searchForInitialValue: true,
                hintText: "search_location".tr,
                onPlacePicked: (PickResult result) {
                  setLatLong(result.geometry?.location.lat, result.geometry?.location.lng);
                  controller?.text = result.formattedAddress ?? "";
                  AppNavigator.pop();
                },
                selectInitialPosition: true,
                initialPosition: const LatLng(25.612677, 85.158875),
                useCurrentLocation: true,
                resizeToAvoidBottomInset: false,
                autocompleteRadius: 30.sp),
          ),
        );
      },
    );
  }

  AlertDialog requestLocationPermission(CustomLocationPermission permission) {
    return AlertDialog(
      elevation: 100,
      title: Text(
        'show_nearby'.tr,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_outlined, size: 40.sp),
          SizedBox(height: 10.sp),
          Text('find_location'.tr, style: TextStyle(color: colorGreen)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => AppNavigator.pop(),
          child: Text('not_now'.tr),
        ),
        TextButton(
          onPressed: () async {
            if (permission == CustomLocationPermission.denied) {
              Geolocator.openAppSettings();
            } else {
              Geolocator.openLocationSettings();
            }
            AppNavigator.pop();
          },
          child: Text('allow_location'.tr),
        ),
      ],
    );
  }
}
