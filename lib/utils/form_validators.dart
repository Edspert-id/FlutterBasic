String? textFormValidators({
  required String? value,
  required String textName,
}) {
  if (value?.isEmpty == true) {
    return '$textName tidak boleh kosong!';
  } else {
    if (value!.length < 6) {
      return '$textName terlalu pendek!';
    }
  }
  return null;
}
