import 'package:flutter/material.dart';
class Terms_Service extends StatefulWidget {
  const Terms_Service({super.key});

  @override
  State<Terms_Service> createState() => _Terms_ServiceState();
}

class _Terms_ServiceState extends State<Terms_Service> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: const Color(0xff93bffe),
          title: const Text(
            "Terms & Services",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0C0A0B),
            ),
          ),centerTitle: true,
        ),
        body: const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Thank you for choosing Tasks :",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "Tasks Service is provided by Pocket Brilliance Limited and by using the Service you are agreeing to our privacy policies and these Terms of Service.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  "Software in Our Service:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "When the Tasks Service requires or includes downloadable software, this software may be updated automatically on your device when a new version or features are available to you. Pocket Brilliance Limited gives you a personal, worldwide, royalty-free, non-assignable and non-exclusive license to use the software provided by us as part of the Service. You may not copy, modify, distribute, sell, or lease any part of our Service or included software, nor may you reverse engineer or attempt to extract the source code of the software, unless local laws prohibit those restrictions or you have our written permission.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  "Privacy Protection:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "Tasks privacy policy explains how we use your personal data and protect your privacy when using the Tasks Service.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  "Modifying and Termination of Service:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "Pocket Brilliance Limited may add or remove functionality or features at any time. We may also suspend or stop the Service at any time with at least thirty days notice. You can choose to stop using the Service at any time. It is your responsibility to cancel your subscription as this must be done by the end user and cannot be done by Tasks support.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Text(
                  "Using the Service:",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "You must follow any policies made available to you within the Service. You may only use our Service as permitted by law. Pocket Brilliance Limited may investigate and/or suspend or terminate our Service to you at any time if we find your use of our Service violates the Terms and/or any policies. Using our Service does not grant you any ownership of any intellectual property rights in our Service or the content you may have access to. You may not use any copyrighted content in our Service unless you have permission from the content owner. You must not abuse and or misuse our Service in any way. This includes but is not limited to: Using the Service for any unlawful purposes or activities, Accessing or tampering with the Service server system, Interfering with or disrupting the access of any user, host or network, Abusing or submitting excessive requests to the Service via its API. Pocket Brilliance Limited will determine any abuse or misuse of our Service.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        )
    );
  }
}