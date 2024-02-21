import 'package:durum_yonetimi/checkbox_provider.dart';
import 'package:durum_yonetimi/view/yonlendirme_butonu.dart';
import 'package:durum_yonetimi/view_model/birinci_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirinciSayfa extends StatefulWidget {
  @override
  State<BirinciSayfa> createState() => _BirinciSayfaState();
}

class _BirinciSayfaState extends State<BirinciSayfa> {
  @override
  Widget build(BuildContext context) {
    print("Sayfa baştan oluşturuldu");
    return Consumer<BirinciViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: viewModel.renk,
          appBar: AppBar(
            title: Text("Birinci Sayfa"),
          ),
          body: child,
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlutterLogo(
            size: 96,
          ),
          _buildBaslik(),
          _buildYaziyiDegistirButton(context),
          _buildRenkDegistirButton(context),
          YonlendirmeButonu(),
          _buildCheckboxRow(context),
        ],
      ),
    );
  }

  Widget _buildBaslik() {
    print("Başlık - Consumer oluşturuldu");
    return Consumer<BirinciViewModel>(
      builder: (context, viewModel, child) {
        print("Başlık - Consumer oluşturuldu");
        return Text(
          viewModel.yazi,
          style: TextStyle(fontSize: 28),
        );
      },
    );
  }

  Widget _buildYaziyiDegistirButton(BuildContext context) {
    print("Yazıyı değiştir butonu oluşturuldu");
    BirinciViewModel viewModel = Provider.of<BirinciViewModel>(
      context,
      listen: false,
    );
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Yazıyı Değiştir"),
        onPressed: () {
          viewModel.yazi = "Butona tıklandı";
        },
      ),
    );
  }

  Widget _buildRenkDegistirButton(BuildContext context) {
    print("Renk değiştir butonu oluşturuldu");
    BirinciViewModel viewModel = Provider.of<BirinciViewModel>(
      context,
      listen: false,
    );
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text("Rengi Değiştir"),
        onPressed: () {
          viewModel.renk = Colors.blueAccent;
        },
      ),
    );
  }

  Widget _buildCheckboxRow(BuildContext context) {
    print("Checkbox satırı oluşturuldu");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Checkbox",
          style: TextStyle(fontSize: 18),
        ),
        Consumer<CheckboxProvider>(builder: (context, viewModel, child) {
          print("Checkbox - Consumer satırı oluşturuldu");
          return Checkbox(
              value: viewModel.checkboxSeciliMi,
              onChanged: (bool? yeniDeger) {
                if (yeniDeger != null) {
                  viewModel.checkboxSeciliMi = yeniDeger;
                }
              });
        })
      ],
    );
  }
}
