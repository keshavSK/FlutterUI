class CategoryResponse {
  int status;
  String message;
  String cartCount;
  List<Categories> categories;

  CategoryResponse(
      {this.status, this.message, this.cartCount, this.categories});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['Message'];
    cartCount = json['CartCount'];
    if (json['Categories'] != null) {
      categories = new List<Categories>();
      json['Categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Message'] = this.message;
    data['CartCount'] = this.cartCount;
    if (this.categories != null) {
      data['Categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String categoryId;
  String category;
  String sequenceNo;
  String mediaUrl;
  String iconMediaUrl;

  Categories(
      {this.categoryId,
        this.category,
        this.sequenceNo,
        this.mediaUrl,
        this.iconMediaUrl});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['CategoryId'];
    category = json['Category'];
    sequenceNo = json['SequenceNo'];
    mediaUrl = json['MediaUrl'];
    iconMediaUrl = json['IconMediaUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryId'] = this.categoryId;
    data['Category'] = this.category;
    data['SequenceNo'] = this.sequenceNo;
    data['MediaUrl'] = this.mediaUrl;
    data['IconMediaUrl'] = this.iconMediaUrl;
    return data;
  }
}