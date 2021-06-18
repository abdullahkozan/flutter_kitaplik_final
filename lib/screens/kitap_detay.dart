import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kitaplik/screens/satis.dart';
import '../models/kitap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'dart:math';

class KitapDetay extends StatefulWidget {
  final Kitap? kitap;

  const KitapDetay({this.kitap});

  @override
  _KitapDetayState createState() => _KitapDetayState();
}

class _KitapDetayState extends State<KitapDetay> {
  String tempUrl = "";
  String imageUrl = "";
  bool inputShow = false;
  bool yontemSecimi = false;

  int max = 50;

  var _image; // File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        imageUrl = "";
        _image = File(pickedFile.path);
        // widget.kitap.resim = _image;
        inputShow = false;
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGalery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        imageUrl = "";
        _image = File(pickedFile.path);
        inputShow = false;
        // widget.kitap.resim = _image;
      } else {
        print('No image selected.');
      }
    });
  }

  double n1 = 1;
  double n2 = 1;
  double n3 = 1;
  double n4 = 1;
  double n5 = 1;

  List<_SalesData> data = [];

  double randomUret() {
    Random random = new Random();
    double rndNumber = random.nextInt(40).toDouble();
    rndNumber = rndNumber + 50;
    return rndNumber;
  }

  TextStyle buttonStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFe88710));

  void imageUrlAdd() {}

  void openInput() {
    setState(() {
      inputShow = true;
    });
  }

  void resimYuklemeYontemiSec() {
    setState(() {
      yontemSecimi = !yontemSecimi;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    n1 = randomUret();
    n2 = randomUret();
    n3 = randomUret();
    n4 = randomUret();
    n5 = randomUret();

    data = [
      _SalesData('Şubat', n1),
      _SalesData('Mart', n2),
      _SalesData('Nisan', n3),
      _SalesData('Mayis', n4),
      _SalesData('Haziran', n5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kitap!.kitapAdi),
        centerTitle: true,
        actions: [
          ButtonBar(
            children: [
              IconButton(
                  onPressed: () {
                    // openInput();
                    resimYuklemeYontemiSec();
                  },
                  icon: Icon(Icons.add_a_photo))
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Visibility(
                  visible: yontemSecimi,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      // height: MediaQuery.of(context).size.height / 1.25,
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //TODO gesture yap bunları 5 tane gesture isteniyor
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await getImageFromGalery();
                                print("galeri");
                              },
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Galeri',
                                    style: buttonStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await getImage();

                                print("kamera");
                              },
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Kamera',
                                    style: buttonStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  inputShow = true;
                                  print("İnternet");
                                });
                              },
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'İnternet',
                                    style: buttonStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  yontemSecimi = false;
                                  print("iptal");
                                });
                              },
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'İptal',
                                    style: buttonStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: yontemSecimi && _image != null ? true : false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          print("resmi sil");
                          setState(() {
                            _image = null;
                            imageUrl = "";
                            tempUrl = "";
                            // yontemSecimi = false;
                            inputShow = false;
                          });
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Resmi Sil',
                              style: buttonStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: inputShow,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      // width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            // height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: "Resim Url",
                                hintText: "Resim Url Giriniz..",
                                border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.blue),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  tempUrl = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                inputShow = false;
                                setState(() {
                                  imageUrl = tempUrl;
                                  _image = true;
                                  print("image -> $imageUrl");
                                });
                              });
                            },
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Ekle',
                                  style: buttonStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color(0xFFB0D1FD),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // widget.kitap!.resim == ""
                        _image == null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'Bu kitap için henüz resim yüklenmedi, yükleme yöntemi seçmek için ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(
                                            Icons.add_a_photo,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' tıklayınız..',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ],
                                  ),
                                ))
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                // child: Image.asset(""),
                                child: imageUrl == ""
                                    ? Image.file(_image!)
                                    : Image.network(imageUrl),
                              ),
                        Divider(
                          color: Colors.white,
                          thickness: 1.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Eserin Adi :",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.kitap!.kitapAdi,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Yazar Adi :",
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.kitap!.yazarAdi,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Sayfa Sayisi :",
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.kitap!.sayfaSayisi.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            color: Colors.white,
                            thickness: 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Özet"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 300,
                            child: SingleChildScrollView(
                              child: Text(widget.kitap!.kitapOzet),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1.5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Satis(
                                  n1: n1, n2: n2, n3: n3, n4: n4, n5: n5);
                            }));
                          },
                          child: Card(
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              // Chart title
                              title: ChartTitle(
                                  text: 'Son 5 aydaki satış miktari'),
                              // Enable legend
                              legend: Legend(isVisible: true),
                              // Enable tooltip
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <ChartSeries<_SalesData, String>>[
                                LineSeries<_SalesData, String>(
                                    dataSource: data,
                                    xValueMapper: (_SalesData sales, _) =>
                                        sales.year,
                                    yValueMapper: (_SalesData sales, _) =>
                                        sales.sales,
                                    name: 'Satış',
                                    // Enable data label
                                    dataLabelSettings:
                                        DataLabelSettings(isVisible: true))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
