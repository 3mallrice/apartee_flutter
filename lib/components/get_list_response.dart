class GetListResponse<T> {
  final List<T> list;
  final int totalPage;

  GetListResponse(this.list, this.totalPage);
}
