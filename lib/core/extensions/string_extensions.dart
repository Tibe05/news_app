extension ShortenWords on String {
  String limitWordsLen(int length) {
    return split(" ")
        .map((word) => word.length > length ? word.substring(0, length) : word)
        .join(" ");
  }
}
