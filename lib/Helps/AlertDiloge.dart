import 'package:flutter/material.dart';
import 'package:azkar/Base/DataBaseHelper.dart';
import 'package:azkar/Base/User.dart';
import 'package:azkar/Helps/AppBar.dart';
import 'package:azkar/Helps/Container.dart';

class Alert extends StatefulWidget{
  final Student student;
  Alert(this.student);
  @override
  _Alert createState()=>_Alert();
}

class _Alert extends State<Alert>{
  DBHelper db=new DBHelper();
  TextEditingController _namecontroller;

  @override
  void initState() {
    _namecontroller =new TextEditingController(text: widget.student.name);
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.student.id != null) ? myAppBar(text: 'تعديل الذكر') : myAppBar(text: 'اضافة ذكر'),
      backgroundColor: Colors.white38,
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.black26,
              ),
              child: TextField(
                maxLines: 15,
                textDirection: TextDirection.rtl,
                controller: _namecontroller,
                decoration: InputDecoration(
                  labelText: 'النص',
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
              child: Divider(),
            ),
            RaisedButton(
                color: color1,
                child: (widget.student.id != null) ? Text('تعديل') : Text('حفظ'),
                onPressed: (){
                  if(widget.student.id != null){
                    db.update(Student.fromMap({
                      'id' : widget.student.id,
                      'name' : _namecontroller.text,
                    })).then((_){
                      Navigator.pop(context,'update');
                    });
                  }
                  else{
                    db.add(Student(_namecontroller.text)).then((_){
                      Navigator.pop(context,'save');
                    });
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}