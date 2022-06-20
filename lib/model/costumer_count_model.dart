class CustomerCountModel{
  late int customerToday;
  late int customerYesterday;

  CustomerCountModel({
    required this.customerToday,
    required this.customerYesterday, 
  });

  CustomerCountModel.fromJson(Map<String, dynamic> json) {
    customerToday = json['customersToday'];
    customerYesterday = json['customersYesterdays'];
  }

  Map<String, dynamic> toJson() {
    return{
      'customersToday': customerToday,
      'customersYesterdays': customerYesterday,
    };
  }
}