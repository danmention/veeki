import 'package:flutter/material.dart';
import 'package:veeki/AcceptRejectScreen.dart';

class AcceptRejectDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function() onAccept;
  final Function() onReject;

  AcceptRejectDialog({
    required this.title,
    required this.message,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 50.0,
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
          ),
          margin: EdgeInsets.only(top: 50.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                message,
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: onReject,
                    child: Text(
                      'Reject',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      onAccept();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcceptRejectScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Make Payment',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0.0,
          left: 20.0,
          right: 20.0,
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 50.0,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ),
      ],
    );
  }
}
