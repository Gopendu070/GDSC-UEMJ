import 'package:flutter/material.dart';
import 'package:gdscuemj/controller/Members.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberTileWidget extends StatelessWidget {
  int index;
  MemberTileWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(107, 163, 168, 184),
                  Color.fromARGB(102, 211, 213, 223),
                  Colors.white38,
                ])),
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: GestureDetector(
                  onTap: () {
                    showMyImageDialog(
                        context, Members.members[index]["imgUrl"]);
                  },
                  child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(color: Colors.white54),
                      child: Image.asset(
                        Members.members[index]["imgUrl"],
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
            Positioned(
                top: 80,
                left: 75,
                child: InkWell(
                  onTap: () {
                    print("object");
                  },
                  child:
                      Image.asset('lib/asset/image/GDSC_rmbg.png', height: 40),
                )),
            Positioned(
              top: 35,
              left: 130,
              child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Members.members[index]["name"],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      ),
                      Text(
                        "<" + Members.members[index]["position"] + ">",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey),
                      ),
                    ]),
              ),
            ),
            Positioned(
              top: 7,
              right: 15,
              child: GestureDetector(
                onTap: () async {
                  print("object");
                  String in_url = Members.members[index]["linkedinUrl"];
                  Uri url = Uri.parse(in_url);
                  if (await canLaunchUrl(url))
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  else
                    print("Cant launch");
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(70, 158, 158, 158)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.5),
                    child: Image.asset(
                      "lib/asset/image/in_icon.png",
                      height: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMyImageDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                      child: Image.asset(
                    url,
                  ))),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     child: Text("Close"))
          ],
        );
      },
    );
  }
}
