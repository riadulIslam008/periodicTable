String imageDescriptionTrim(input) {
  RegExp regex = RegExp(r'^[^.]+');
  Match? match = regex.firstMatch(input);

  String result = match!.group(0)?.trim() ?? '';
  return result;
}
