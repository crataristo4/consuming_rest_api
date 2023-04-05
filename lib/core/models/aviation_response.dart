import 'dart:convert';

AviationResponse aviationResponseFromJson(String str) => AviationResponse.fromJson(json.decode(str));

String aviationResponseToJson(AviationResponse data) => json.encode(data.toJson());

class AviationResponse {
  AviationResponse({
    required this.pagination,
    this.data,
  });

  Pagination pagination;
  dynamic data;

  factory AviationResponse.fromJson(Map<String, dynamic> json) => AviationResponse(
        pagination: Pagination.fromJson(json["pagination"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": data,
      };
}

class Pagination {
  Pagination({
    required this.offset,
    required this.limit,
    required this.count,
    required this.total,
  });

  int offset;
  int limit;
  int count;
  int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        offset: json["offset"],
        limit: json["limit"],
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "count": count,
        "total": total,
      };
}
