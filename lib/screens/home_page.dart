import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/screens/information_page.dart';

import 'datass.dart';
class HOME_PAGE extends StatefulWidget {
  const HOME_PAGE({super.key});

  @override
  State<HOME_PAGE> createState() => _HOME_PAGEState();
}

class _HOME_PAGEState extends State<HOME_PAGE> {
  TextEditingController namectrl=TextEditingController();
  TextEditingController agectrl=TextEditingController();
  TextEditingController placectrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => INFO_PAGE()),
            );

          } ,child: Icon(Icons.add),),
        appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("TODO",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange,fontSize: 20),),
                SizedBox(
                  width: 10,
                ),
                Text("APP",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20),)

              ],
            )


        ),
        body:
        StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Cleint Details").snapshots(),
            builder:( context,AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context,int index) {
                      final  DocumentSnapshot ds = snapshot.data.docs[index];
                      return  Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(ds["name"],style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                        onTap: (){
                                          namectrl.text= ds["name"];
                                          agectrl.text= ds["age"];
                                          placectrl.text= ds["place"];
                                          EditDetails(ds["id"]);
                                        },
                                        child: Icon(Icons.edit,
                                          color: Colors.blue,
                                          size: 25,)),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    GestureDetector(
                                      onTap: () async{
                                        await DatabaseMethods().deleteEmployeeDetails(ds["id"]);

                                      },
                                      child: Icon(Icons.delete,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    )
                                  ],
                                ),
                                Text(ds["age"],style: TextStyle(color: Colors.black87,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                Text(ds["place"],style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      );



                    }
                );
              }
              return Container();
            }

        )
    );
  }


  // edit

  Future EditDetails(String id)=> showDialog(
      context: context,
      builder: (BuildContext context)=>AlertDialog(
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.cancel),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Text("Edit",style: TextStyle(color: Colors.black,
                      fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                  Text("Details",style: TextStyle(color: Colors.black87,
                      fontSize: 24,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),

              //again the same input fields for popup.....................

              Text("Name",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.bold )),

              SizedBox(
                height: 10.0,
              ),

              Container(
                  padding: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    controller: namectrl,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Age",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.bold )),

              SizedBox(
                height: 10.0,
              ),

              Container(
                  padding: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    controller: agectrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  )
              ),
              SizedBox(
                height: 20,
              ),
              Text("place",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight:FontWeight.bold )),

              SizedBox(
                height: 10.0,
              ),

              Container(
                  padding: EdgeInsets.only(left: 5.0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: TextField(
                    controller: placectrl,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: InputBorder.none
                    ),
                  )
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                  height: 35,
                  width: 300,
                  child: ElevatedButton(onPressed: () async{

                    Map<String,dynamic>updateInfo={
                      "name":namectrl.text,
                      "age":agectrl.text,
                      "id":id,
                      "place":placectrl.text
                    };
                    await DatabaseMethods().updateEmployeeDetails(id, updateInfo).then((value) {
                      Navigator.pop(context);
                    });
                  },

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange
                      ),
                      child: Text("Update",style: TextStyle(color: Colors.white),)))
            ],
          ),
        ),
      )
  );
}




