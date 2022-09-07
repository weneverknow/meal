class ResponseApi<T> {
  final T? data;
  final int? responseCode;
  final String? message;

  const ResponseApi({this.data, this.responseCode = 200, this.message});
}
