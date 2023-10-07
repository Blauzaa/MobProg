import 'package:flutter/material.dart';

import 'home.dart';


class Transfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
          },
        ),
        title: Text('Transfer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nomor Rekening Tujuan:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Nomor Rekening Tujuan',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Jumlah Transfer:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Jumlah Transfer',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Balance.deductMoney(amount)
              
              },
              child: Text('Proses Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}

