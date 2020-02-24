import 'package:flutter/material.dart';
import 'package:azkar/Helps/AppBar.dart';
import 'package:azkar/Helps/BottomBar.dart';
import 'package:azkar/Base/DataBaseHelper.dart';
import 'package:azkar/Base/User.dart';
import 'package:azkar/Helps/AlertDiloge.dart';
import 'package:azkar/Helps/Container.dart';

class Slide9 extends StatefulWidget{

  @override
  _Slide9 createState() => _Slide9();
}

class _Slide9 extends State<Slide9>{

  List<Student> items=new List();
  DBHelper db=new DBHelper();

  @override
  void initState() {
    super.initState();
    db.getstudents().then((students){
      setState(() {
        students.forEach((student){
          items.add(Student.fromMap(student));
        });
      });
    });
  }

  _deleteemployee(BuildContext context,Student student,int position)async{
    db.delete(student.id).then((students){
      setState(() {
        items.removeAt(position);
      });
    });
  }

  _navogatetoemployee(BuildContext context,Student student)async{
    String result=await Navigator.push(
        context,MaterialPageRoute(builder: (context)=>Alert(student))
    );
    if(result=='update'){
      db.getstudents().then((students){
        setState(() {
          items.clear();
          students.forEach((student){
            items.add(Student.fromMap(student));
          });
        });
      });
    }
  }
    _createnewemployee(BuildContext context)async{
    String result=await Navigator.push(
        context,MaterialPageRoute(builder: (context)=>Alert(
        Student('')))
    );
    if(result=='save'){
      db.getstudents().then((students){
        setState(() {
          items.clear();
          students.forEach((student){
            items.add(Student.fromMap(student));
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: myAppBar(text: 'أذكاري'),
      body: ListView.builder(
          itemCount: items.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context,position){
            return Column(
              children: <Widget>[
                Divider(height: 5.0,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    color: color1,
                  ),
                  child: ListTile(
                    subtitle: Text(items[position].name,textDirection: TextDirection.rtl,),
                    leading: IconButton(icon:
                    Icon(Icons.delete,color: Colors.red,),
                      onPressed: ()=>_deleteemployee(context,items[position],position),
                    ),
                    onTap: ()=> _navogatetoemployee(context,items[position]),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color2,
        child: Icon(Icons.add),
        onPressed: ()=>_createnewemployee(context),
      ),
      bottomNavigationBar: Bar(1),
    );
  }
}