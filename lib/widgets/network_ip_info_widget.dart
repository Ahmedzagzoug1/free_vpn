import 'package:flutter/material.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/models/network_ip_info.dart';
class NetworkIpInfoWidget extends StatelessWidget {
   NetworkIpInfoWidget({super.key,required this.networkIpInfo});
  NetworkIpInfo networkIpInfo;

  @override
  Widget build(BuildContext context) {
    screenSize=MediaQuery.of(context).size;
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.symmetric(vertical: screenSize.height*0.01,
      ),
      child: ListTile(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
      ),
      title:Text( networkIpInfo.titleText),
        subtitle: Text(networkIpInfo.subtitleText),
        leading: Icon(networkIpInfo.iconData.icon,
        size: networkIpInfo.iconData.size??28,),
      ),
    );
  }
}
