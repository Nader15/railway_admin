import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway_admin/ApiFunctions/Api.dart';
import 'package:railway_admin/models/stations.dart' as stationModelImport;
import 'package:railway_admin/models/trip.dart';
import 'package:railway_admin/models/trips.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/utils/colors_file.dart';
import 'package:railway_admin/utils/custom_button.dart';
import 'package:railway_admin/utils/global_vars.dart';

class Trips extends StatefulWidget {
  final Trip trip;

  const Trips({Key key, this.trip}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  stationModelImport.StationsModel stationsModel;
  List<stationModelImport.Success> stationsList = List();

  TripsModel tripsModel;
  List<Success> tripsList = List();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      gettingData();
      gettingData2();
    });
//    showHud();
  }

  gettingData2() {
    setState(() {
      Api(context).stationApi(_scaffoldKey).then((value) {
        stationsModel = value;
        stationsModel.success.forEach((element) {
          setState(() {
            stationsList.add(element);
          });
        });
      });
    });
  }

  gettingData() {
    setState(() {
      Api(context).tripsApi(_scaffoldKey).then((value) {
        tripsModel = value;
        tripsModel.success.forEach((element) {
          setState(() {
            tripsList.add(element);
          });
        });
      });
    });
  }

  var departmentDateController = TextEditingController();
  var departmentTimeController = TextEditingController();
  var arrivalDateController = TextEditingController();
  var arrivalTimeController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDateDepart(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        departmentDateController.text =
            selectedDate.toIso8601String().split("T")[0];
        trip_departmentTime = departmentDateController.text;
      });
  }

  Future<void> _selectDateArrival(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        arrivalDateController.text =
            selectedDate.toIso8601String().split("T")[0];
        trip_departmentTime = arrivalDateController.text;
      });
  }

  Future<void> _selectTimeDepart(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
        departmentTimeController.text =
            selectedTime.format(context).split(" ")[0];
        trip_arrivalTime = arrivalDateController.text;
      });
  }

  Future<void> _selectTimeArrival(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
        arrivalTimeController.text = selectedTime.format(context).split(" ")[0];
        trip_arrivalTime = arrivalDateController.text;
      });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          tripsList.length == 0
              ? Center(
            child: Container(
              child: Text("The System Has No Trips. "),
            ),
          )
              :Container(
            alignment: Alignment.center,
            // color: Colors.red,
            height: 470,
            width: MediaQuery.of(context).size.width / 2.5,
            child: ListView.builder(
              itemCount: tripsList.length,
              itemBuilder: (ctx, index) {
                return TripsBody(
                  success: tripsList[index],
                );
              },
            ),
          ),
          VerticalDivider(
            thickness: 5,
            width: 10,
            color: primaryAppColor,
          ),
          Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width / 2,
              padding: EdgeInsets.only(bottom: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trips Information",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text(
                          "Count :",
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(
                          "${tripsList.length}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          hint: Text(
                            "Choose Base Station",
                            style: TextStyle(
                                // color: Color(0xffb8c3cb).withOpacity(0.5),
                                ),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xffb8c3cb)),
                          isExpanded: true,
                          underline: SizedBox(),
                          dropdownColor: whiteColor,
                          style: TextStyle(color: blackColor),
                          value: trip_base_id,
                          onChanged: (newValue) {
                            setState(() {
                              trip_base_id = newValue;
                              print(trip_base_id);
                            });
                          },
                          items: stationsList.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem.id,
                              child: Text(valueItem.name),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: DropdownButton(
                          hint: Text(
                            "Choose Destination Station",
                            style: TextStyle(
                                // color: Color(0xffb8c3cb).withOpacity(0.5),
                                ),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xffb8c3cb)),
                          isExpanded: true,
                          underline: SizedBox(),
                          dropdownColor: whiteColor,
                          style: TextStyle(color: blackColor),
                          value: trip_destination_id,
                          onChanged: (newValue) {
                            setState(() {
                              trip_destination_id = newValue;
                              print(trip_destination_id);
                            });
                          },
                          items: stationsList.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem.id,
                              child: Text(valueItem.name),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6.5,
                              child: TextFormField(
                                controller: departmentDateController,
                                onTap: () => _selectDateDepart(context),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.withOpacity(.1),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5)),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    hintText: "Department Date",
                                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                                        color: Color(0xffb8c3cb)),
                                    hintStyle: TextStyle(
                                        color: blackColor, fontSize: 13)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6.5,
                              child: TextFormField(
                                controller: departmentTimeController,
                                onTap: () => _selectTimeDepart(context),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.withOpacity(.1),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5)),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    hintText: "Department time",
                                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                                        color: Color(0xffb8c3cb)),
                                    hintStyle: TextStyle(
                                        color: blackColor, fontSize: 13)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6.5,
                              child: TextFormField(
                                controller: arrivalDateController,
                                onTap: () => _selectDateArrival(context),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.withOpacity(.1),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5)),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    hintText: "Arrival Date",
                                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                                        color: Color(0xffb8c3cb)),
                                    hintStyle: TextStyle(
                                        color: blackColor, fontSize: 13)),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 6.5,
                              child: TextFormField(
                                controller: arrivalTimeController,
                                onTap: () => _selectTimeArrival(context),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey.withOpacity(.1),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5)),
                                    contentPadding: new EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    hintText: "Arrival time",
                                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                                        color: Color(0xffb8c3cb)),
                                    hintStyle: TextStyle(
                                        color: blackColor, fontSize: 13)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      // CustomButton(
                      //   bttnName: 'Save',
                      //   bttnHeight: 55,
                      //   bttnWidth: 368,
                      //   bttnNameSize: 20,
                      //   onPress: () {
                      //     Api(context)
                      //         .addTripApi(
                      //       _scaffoldKey,
                      //       trip_base_id,
                      //       trip_destination_id,
                      //       departmentDateController.text+" "+departmentTimeController.text,
                      //       arrivalDateController.text+" "+arrivalTimeController.text,
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Add Trip",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Api(context).addTripApi(
                                _scaffoldKey,
                                trip_base_id,
                                trip_destination_id,
                                departmentDateController.text +
                                    " " +
                                    departmentTimeController.text,
                                arrivalDateController.text +
                                    " " +
                                    arrivalTimeController.text,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: blackColor,
                              ),
                              child: Icon(
                                Icons.add,
                                color: whiteColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class TripsBody extends StatelessWidget {
  final Success success;

  TripsBody({Key key, this.success}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(0xff1D1D1D),
                title: Text(
                  "Delete Trip ?",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Api(context).deleteTripApi(_scaffoldKey, success.id);
                      },
                      child: Text(
                        "delete",
                      )),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "cancel",
                      ))
                ],
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Center(
                    child: Text(
                      " Delete This Trip ?",
                      style: TextStyle(
                          fontFamily: 'custom_font', color: Colors.white),
                    ),
                  ),
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: 150,
          child: Card(
            elevation: 10,
            color: primaryAppColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    success.baseStation.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Start Time",
                                style: TextStyle(color: whiteColor),
                              ),
                              Text(
                                success.departTime,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: primaryAppColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'images/train.png',
                                color: whiteColor,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Text("Arrival Time",
                                  style: TextStyle(color: whiteColor)),
                              Text(
                                success.arrivalTime,
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    success.destinationStation.name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
