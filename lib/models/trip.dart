import 'package:flutter/material.dart';

class Trip {
  final String location, destination, timeFrom, timeTo;

  Trip({
    this.timeFrom,
    this.timeTo,
    this.location,
    this.destination,
  });
}

List<Trip> trips = [
  Trip(
    location: "Cairo",
    destination: "Alexandria",
    timeFrom: "13:35 pm",
    timeTo: "16:30 pm",
  ),
  Trip(
    location: "Qina",
    destination: "Aswan",
    timeFrom: "11:30 pm",
    timeTo: "01:30 am",
  ),
  Trip(
    location: "Giza",
    destination: "Matrouh",
    timeFrom: "06:05 am",
    timeTo: "09:30 am",
  ),
  Trip(
    location: "Zagazig",
    destination: "Mansoura",
    timeFrom: "17:15 pm",
    timeTo: "19:30 pm",
  ),
  Trip(
    location: "PortSaid",
    destination: "Banha",
    timeFrom: "13:35 pm",
    timeTo: "16:30 pm",
  ),
  Trip(
    location: "Sharm",
    destination: "awsan",
    timeFrom: "11:35 pm",
    timeTo: "14:30 pm",
  ),
];
