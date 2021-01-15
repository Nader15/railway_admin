import 'package:flutter/material.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/utils/colors_file.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  String valueChoosedPhoneCode;
  List phoneCodeItems = [
    "view",
    "update",
    "delete",
  ];

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.red,
            height: 470,
            width: MediaQuery.of(context).size.width / 2.5,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (ctx, index) {
                return Users();
              },
            ),
          ),
          VerticalDivider(thickness: 5,width: 10,color: primaryAppColor,),
          Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width / 2.5,
              padding: EdgeInsets.only(bottom: 20,top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tickets Information",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text("Count :",style: TextStyle(fontSize: 18),),
                        title: Text("17",style: TextStyle(fontSize: 18),),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Add Ticket",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          SizedBox(width: 20,),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              margin: EdgeInsets.only(right: 20),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: blackColor,
                              ),
                              child: Icon(Icons.add,color: whiteColor,size: 30,),
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

  Widget Users() {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20, top: 20),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          'images/ticketIcon.png',
          height: 30,
        ),
      ),
      title: Text("Mohamed Ahmed"),
      subtitle: Text("Alexandria - Aswan"),
      trailing: Text("10113"),
      onTap: () {},
    );
  }
}
