
import 'package:edudoor_jobseeker/src/view/common/dialogs/dialog_confirm.dart';
import 'package:edudoor_jobseeker/src/view/common/dialogs/general_dialog_alert_dialog_loading.dart';

void showEducationDialog(context, barrierLable, title, subTitle, handleConfirm) {
  dialogAnimationWrapper(context: context, barrierLabel: "barrierLabel", child: DialogConfirm(title: title, subTitle: subTitle, handleConfirmBtn: handleConfirm));
}
