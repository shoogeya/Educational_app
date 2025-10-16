import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class ValidatorUtils {
  static var req = (value) {
    if (value.toString().trim() != "" && value != null) {
      return null;
    } else {
      return "هذا الحقل مطلوب";
    }
  };
  static final email =
      ValidationBuilder(optional: false, requiredMessage: "هذا الحقل مطلوب")
          .email("اكتب البريد الكتروني بشكل صحيح")
          .regExp(
            RegExp(
                r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$'),
        "اكتب البريد الكتروني بشكل صحيح",
          )
          .build();

  static final phone = ValidationBuilder(
    optional: false,
    requiredMessage: "phone_req".tr,
  )
      .minLength(7, "phone_error".tr)
      .maxLength(15, "phone_error".tr)
      .regExp(
        // RegExp(r'^(?:\+91|0)?[0-9]{10}$'),
        RegExp(r'^\+?[0-9]{10}$'),

        'phone_error'.tr,
      )
      .build();

  static  StringValidationCallback password = ValidationBuilder(
          optional: false, requiredMessage: "هذا الحقل مطلوب").regExp(
          RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{10,}$'),
      "\u29bf كلمة المرور يجب أن تكون ١٠ وحدات علي الأقل.\n\u29bf يجب أن تحتوي كلمة المرور علي أرقام و رموز خاصة\n و أحرف كبيرة و صغيرة.")
      .build();
}
