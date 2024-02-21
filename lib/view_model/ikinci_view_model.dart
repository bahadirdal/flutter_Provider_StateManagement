import 'package:flutter/material.dart';
import 'package:durum_yonetimi/model/siparis.dart';

class IkinciViewModel with ChangeNotifier {
  List<Siparis> siparisler = [];

  IkinciViewModel(){
    for(int i = 1; i<=5 ; i++){
      Siparis siparis = Siparis("Siparis $i", "Onay bekleniyor..");
      siparisler.add(siparis);
    }
  }
}