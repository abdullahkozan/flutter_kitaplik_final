import 'package:flutter/material.dart';
import './kitap_detay.dart';
import '../models/kitap.dart';
import 'image_detay.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  static List<Kitap> tumKitaplar = [];

  String? yazarAdi;
  String? kitapAdi;
  int? sayfaSayisi;
  String? ozet;

  @override
  void initState() {
    super.initState();
    tumKitaplar.add(
      Kitap(
          "Robotların Yükselişi (Yapay Zeka ve İşsiz Bir Gelecek Tehlikesi)",
          "Martin Ford, Cem Duran (Çevirmen)",
          336,
          "Yapay zeka, robotik ve bunların ekonomiye ve topluma potansiyel etkileri konusunda uzman olan Martın Ford, “Robotların Yükselişi” kitabıyla robot ile zeki yazılımların insan hayatına etkilerini bir çok yönüyle ele alıyor."),
    );
    tumKitaplar.add(
      Kitap(
          "Eşyanın Dilinden Anlamak (Emeğin Değeri ve Anlamı Üzerine Felsefi Bir Tartışma)",
          "Matthew B. Crawford, Banu Karakaş (Çevirmen), Beste Doğan (Tasarımcı)",
          240,
          "Yazar Crawford kitapta günümüzde eşyalarımızla ilişkilerimiz iden yola çıkarak yaşantımızı, mesleklerimizi irdeliyor."
              "Aslında insanın benliğinde tüketme arzusu kadar üretme arzusunun da varlığını hatırlattı bu kitap. Artık eşyalarımızı tamir etmiyor, onların nasıl çalıştıklarıyla, bakımlarıyla ilgilenmiyor, yalnızca kullanıyoruz. Bir şeylere dokunmuyor, ortaya bir ürün çıkartmıyoruz."),
    );
    tumKitaplar.add(
      Kitap(
          "Kesin İnançlılar",
          "Eric Hoffer, Erkıl Günur (Çevirmen)",
          210,
          "Yazarın kendi hayat hikayesinin bile sinemaya uyarlanabilecek zenginlikte ve farklılıkta olduğunu düşünüyorum."
              "Kör olması, 12 yaşlarında tekrar görmeye başlaması, ABD'de bir limanda hamallık yapması, gözleri tekrar görmeye başlayınca tekrar kör olurum korkusuyla durmaksızın okuması. Hatta kendisini ders vermesi için üniversiteler davet ettiğinde limanda hamallık yaptığını söylemiyor ve hamalliğa devam ediyor. Çünkü oradan toplumun nabzını tutabiliyor."
              "Kesin inanclilar kitabı 1960 li yıllarda yazılmasına rağmen günümüz kargaşalarini ve çatismalarini cok iyi anlatan bir kitap. Ders çıkarılması gereken o kadar çok yer var ki. Bakıyorum da okurken epey bi altını çizdiğim yer olmuş."),
    );
    tumKitaplar.add(
      Kitap(
        "Hayvanlardan Tanrılara: Sapiens (İnsan Türünün Kısa Bir Tarihi)",
        "Yuval Noah Harari, Ertuğrul Genç (Çevirmen)",
        412,
        "- Homo sapiens neden ekolojik bir seri katile dönüştü? - Para neden herkesin güvendiği tek şey? - Geleceğin dini bilim mi?",
      ),
    );
    tumKitaplar.add(
      Kitap("Homo Deus: Yarının Kısa Bir Tarihi", "Yuval Noah Harari", 456,
          "Sizce 21. yüzyılda insanlığa yönelik başlıca tehdit nedir: kamusal/kişisel finansal erimeler, ülkeler arası nükleer savaşlar veya altından kalkılamayacak kadar etkileyici olan ekolojik felaketler veya epidemik hastalıklar? Yazar Yuval Noah Harari'ye göre cevap, yukarıdaki seçeneklerden hiçbirisi değil. Tüm bunların yerine, en büyük varoluşsal mücadelemize yönelik tehdit bugünkü adıyla “Dataizm” olarak bilinen (tekno-din) den gelecektir. Hala ikna olmadınız mı? O zaman hep birlikte incelemeyi okumaya devam edelim."),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Anasayfa'),
        centerTitle: true,
        actions: [
          ButtonBar(
            children: [
              IconButton(
                splashColor: Colors.amber,
                icon: Icon(Icons.menu_book),
                onPressed: () {
                  showModalBottomSheet<void>(
                    isScrollControlled: true,
                    isDismissible: false,
                    enableDrag: true,
                    context: context,
                    builder: (BuildContext context) {
                      return SafeArea(
                        child: Container(
                          height: 350,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: ListView(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Kitap Adi",
                                    hintText: "Kitap Adini Giriniz..",
                                    border: new OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.blue)),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      kitapAdi = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Yazar Adi",
                                    hintText: "Yazar Adini Giriniz..",
                                    border: new OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.blue)),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      yazarAdi = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Sayfa Sayisi",
                                    hintText: "Sayfa Sayisini Giriniz..",
                                    border: new OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.blue)),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      sayfaSayisi = int.parse(value);
                                    });
                                  },
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Özet",
                                    hintText: "Özeti Giriniz..",
                                    border: new OutlineInputBorder(
                                        borderSide:
                                            new BorderSide(color: Colors.blue)),
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      ozet = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        child: const Text(
                                            'Kitap Listesine Kaydet'),
                                        onPressed: () {
                                          setState(() {
                                            tumKitaplar.add(Kitap(
                                                kitapAdi!,
                                                yazarAdi!,
                                                sayfaSayisi!,
                                                ozet!));
                                          });
                                          Navigator.pop(context);
                                        }),
                                    ElevatedButton(
                                      child: const Text('İptal'),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ],

        /* leading: IconButton(icon: Icon(Icons.camera), onPressed: () {}),*/
      ),
      body: SafeArea(
        child: tumKitaplar.length != 0
            ? ListView.builder(
                itemCount: tumKitaplar.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return KitapDetay(
                                  kitap: tumKitaplar[index],
                                );
                              },
                            ),
                          );
                        },
                        leading: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ImageDetayScreen(
                                  imgPath: "assets/images/logo.png" +
                                      index.toString(),
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: "assets/images/logo.png" + index.toString(),
                            child: CircleAvatar(
                              // child: FlutterLogo(),
                              backgroundImage:
                                  AssetImage("assets/images/logo.png"),
                            ),
                          ),
                        ),
                        title: Text(tumKitaplar[index].kitapAdi),
                        subtitle: Text(tumKitaplar[index].yazarAdi),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              tumKitaplar.removeAt(index);
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Text('Kitap Listesi Boş'),
              ),
      ),
    );
  }
}
