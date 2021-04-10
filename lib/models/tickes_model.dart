class TicketsModel {
  List<Success> success;

  TicketsModel({this.success});

  TicketsModel.fromJson(Map<String, dynamic> json) {
    if (json['success'] != null) {
      success = new List<Success>();
      json['success'].forEach((v) { success.add(new Success.fromJson(v)); });
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
  UserData userData;
  TripData tripData;
  String ticketTime;
  int seatId;

  Success({this.userData, this.tripData, this.ticketTime, this.seatId});

  Success.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null ? new UserData.fromJson(json['user_data']) : null;
    tripData = json['trip_data'] != null ? new TripData.fromJson(json['trip_data']) : null;
    ticketTime = json['ticket_time'];
    seatId = json['seat_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData.toJson();
    }
    if (this.tripData != null) {
      data['trip_data'] = this.tripData.toJson();
    }
    data['ticket_time'] = this.ticketTime;
    data['seat_id'] = this.seatId;
    return data;
  }
}

class UserData {
  int id;
  String name;
  String email;
  Null emailVerifiedAt;
  String createdAt;
  String updatedAt;
  String phoneNumber;

  UserData({this.id, this.name, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt, this.phoneNumber});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
class TripData {
  Trip trip;
  String Class;
  int price;

  TripData({this.trip, this.Class, this.price});

  TripData.fromJson(Map<String, dynamic> json) {
    trip = json['trip'] != null ? new Trip.fromJson(json['trip']) : null;
    Class = json['class'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trip != null) {
      data['trip'] = this.trip.toJson();
    }
    data['class'] = this.Class;
    data['price'] = this.price;
    return data;
  }
}

class Trip {
  int id;
  String departTime;
  String arrivalTime;
  String status;
  int baseId;
  int destinationId;
  int trainId;
  String createdAt;
  String updatedAt;
  Pivot pivot;
  BaseStation baseStation;
  BaseStation destinationStation;
  List<Levels> levels;

  Trip(
      {this.id, this.departTime, this.arrivalTime, this.status, this.baseId, this.destinationId, this.trainId, this.createdAt, this.updatedAt, this.pivot, this.baseStation, this.destinationStation, this.levels});

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departTime = json['depart_time'];
    arrivalTime = json['arrival_time'];
    status = json['status'];
    baseId = json['base_id'];
    destinationId = json['destination_id'];
    trainId = json['train_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    baseStation = json['base_station'] != null ? new BaseStation.fromJson(
        json['base_station']) : null;
    destinationStation =
    json['destination_station'] != null ? new BaseStation.fromJson(
        json['destination_station']) : null;
    if (json['levels'] != null) {
      levels = new List<Levels>();
      json['levels'].forEach((v) {
        levels.add(new Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['depart_time'] = this.departTime;
    data['arrival_time'] = this.arrivalTime;
    data['status'] = this.status;
    data['base_id'] = this.baseId;
    data['destination_id'] = this.destinationId;
    data['train_id'] = this.trainId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    if (this.baseStation != null) {
      data['base_station'] = this.baseStation.toJson();
    }
    if (this.destinationStation != null) {
      data['destination_station'] = this.destinationStation.toJson();
    }
    if (this.levels != null) {
      data['levels'] = this.levels.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class BaseStation {
  int id;
  String name;

  BaseStation({this.id, this.name});

  BaseStation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Levels {
  int id;
  dynamic createdAt;
  dynamic updatedAt;
  Pivot pivot;

  Levels({this.id,  this.createdAt, this.updatedAt, this.pivot});

  Levels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int tripId;
  int levelId;
  int price;

  Pivot({this.tripId, this.levelId, this.price});

  Pivot.fromJson(Map<String, dynamic> json) {
    tripId = json['trip_id'];
    levelId = json['level_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trip_id'] = this.tripId;
    data['level_id'] = this.levelId;
    data['price'] = this.price;
    return data;
  }
}

