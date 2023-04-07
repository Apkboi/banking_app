import 'package:intl/intl.dart';

extension StringX on String{
  // String get toFirstUppercase => AppUtils.capitalizeFirstCharacter(this);
}
extension DateTimeExtention on DateTime{
  get formatToDate => DateFormat('yyyy-MM-dd – kk:mm').format(this);
  get formatToSringDate => DateFormat.yMMMMd('en_US').format(this);
}