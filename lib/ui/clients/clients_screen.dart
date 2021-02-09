import 'package:flutter/material.dart';
import 'package:railway_admin/ui/home.dart';
import 'package:railway_admin/utils/colors_file.dart';

class Clients extends StatefulWidget {
  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  String value;
  List items = [
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
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Clients Information",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 30,),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Text("Count :",style: TextStyle(fontSize: 18),),
                        title: Text("10",style: TextStyle(fontSize: 18),),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Add Client",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
      contentPadding: EdgeInsets.only(left: 20, top: 5),
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: primaryAppColor,
        backgroundImage:AssetImage(
          'images/profileImage.jpg',
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
      ),
      title: Text("Mohamed " "Ahmed"),
      subtitle: Text("mohamed.ahmed@gmail.com"),
      trailing: IconButton(
          onPressed: () {},
          icon: Container(
            alignment: Alignment.center,
            width: 350,
            height: 30,
            child: DropdownButton(
              icon: Icon(Icons.linear_scale_rounded, color: blackColor),
              isExpanded: true,
              underline: SizedBox(),
              dropdownColor: whiteColor,
              style: TextStyle(color: blackColor),
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                  value == "delete"
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()))
                      : null;
                });
              },
              items: items.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),
          )),
    );
  }
}
