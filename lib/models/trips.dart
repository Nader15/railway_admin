class TripsModel {
  List<Success> success;

  TripsModel({this.success});

  TripsModel.fromJson(Map<String, dynamic> json) {
    if (json['success'] != null) {
      success = new List<Success>();
      json['success'].forEach((v) {
        success.add(new Success.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Success {
  int id;
  String departTime;
  String arrivalTime;
  int baseId;
  int destinationId;
  int trainId;
  String createdAt;
  String updatedAt;
  List<BaseStation> stations;
  BaseStation baseStation;
  BaseStation destinationStation;

  Success(
      {this.id,
        this.departTime,
        this.arrivalTime,
        this.baseId,
        this.destinationId,
        this.trainId,
        this.createdAt,
        this.updatedAt,
        this.stations,
        this.baseStation,
        this.destinationStation});

  Success.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departTime = json['depart_time'];
    arrivalTime = json['arrival_time'];
    baseId = json['base_id'];
    destinationId = json['destination_id'];
    trainId = json['train_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['stations'] != null) {
      stations = new List<Null>();
      json['stations'].forEach((v) {
        stations.add(new BaseStation.fromJson(v));
      });
    }
    baseStation = json['base_station'] != null
        ? new BaseStation.fromJson(json['base_station'])
        : null;
    destinationStation = json['destination_station'] != null
        ? new BaseStation.fromJson(json['destination_station'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['depart_time'] = this.departTime;
    data['arrival_time'] = this.arrivalTime;
    data['base_id'] = this.baseId;
    data['destination_id'] = this.destinationId;
    data['train_id'] = this.trainId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.stations != null) {
      data['stations'] = this.stations.map((v) => v.toJson()).toList();
    }
    if (this.baseStation != null) {
      data['base_station'] = this.baseStation.toJson();
    }
    if (this.destinationStation != null) {
      data['destination_station'] = this.destinationStation.toJson();
    }
    return data;
  }
}

class BaseStation {
  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  BaseStation({this.id, this.name, this.createdAt, this.updatedAt});

  BaseStation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
