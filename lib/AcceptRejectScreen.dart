import 'package:flutter/material.dart';

import 'models/businessLayer/base.dart';

class AcceptRejectScreen  extends Base {
   AcceptRejectScreen ({Key? key,this.status});
final int? status;

  @override
  _AcceptRejectScreenState createState() => _AcceptRejectScreenState(this.status);
}

class _AcceptRejectScreenState extends BaseState{

  _AcceptRejectScreenState(this.status);
  int? status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                status == 1 ? Icons.check_circle : Icons.cancel,
                size: 120,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text(
                status == 1 ? 'Accepted' : 'Rejected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to previous screen
                  Navigator.pop(context);
                },
                child: status == 1 ?
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('Make Payment')

                )

                    :Text('Back to search') ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
