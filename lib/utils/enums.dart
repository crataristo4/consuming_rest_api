//to add remaining
enum RequestType {
  get,
  post,
  put,
  patch,
  delete,
}

enum BaseModelState { initial, loading, success, error }

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));

    return reverseMap!;
  }
}
