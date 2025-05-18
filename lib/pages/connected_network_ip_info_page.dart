import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/api_vpn_gate/api_vpn_gate.dart';
import 'package:vpn_basic_project/models/ip_info.dart';
import 'package:vpn_basic_project/models/network_ip_info.dart';
import 'package:vpn_basic_project/widgets/network_ip_info_widget.dart';
class ConnectedNetworkIpInfoPage extends StatelessWidget {
  const ConnectedNetworkIpInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ipInfo=IpInfo.fromJson({}).obs;
    ApiVpnGate.retrieveIpDetails(ipInfo);
    print(ipInfo.value.query+'city');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Connected Network Ip Info'
              ,style: TextStyle(color: Colors.redAccent,fontSize: 14),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10,right: 10),
        child: FloatingActionButton(onPressed: (){
          ipInfo.value=IpInfo.fromJson({});
          ApiVpnGate.retrieveIpDetails(ipInfo);
        },child: Icon(CupertinoIcons.refresh_circled, color: Colors.white,

          size: 40,),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          backgroundColor: Colors.red,),
      ),
      body: Obx (()=>
      ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(3),
children: [
  //Ip address
  NetworkIpInfoWidget(networkIpInfo: NetworkIpInfo(
      titleText:  'IP Address',
      subtitleText:ipInfo.value.query,
      iconData:Icon( Icons.my_location_outlined)
  )),
  //Internet Service Provider
  NetworkIpInfoWidget(networkIpInfo: NetworkIpInfo(
      titleText:  'Internet Service Provider',
      subtitleText:ipInfo.value.internetServerProvider,
      iconData:Icon( Icons.account_tree)
  )),
        //location
        NetworkIpInfoWidget(networkIpInfo: NetworkIpInfo(
      titleText:  'Location',
      subtitleText:ipInfo.value.country.isEmpty ?
            'Retrieve....' :
            '${ipInfo.value.country}, ${ipInfo.value.region},${ipInfo.value.city}',
      iconData:Icon( CupertinoIcons.location_solid)
  )),
  //Zip Code
  NetworkIpInfoWidget(networkIpInfo: NetworkIpInfo(
      titleText:  'Zip Code',
      subtitleText:ipInfo.value.zip,
      iconData:Icon( CupertinoIcons.map_pin_ellipse)
  )),
  //timeZone
  NetworkIpInfoWidget(networkIpInfo: NetworkIpInfo(
      titleText:  'timeZone',
      subtitleText:ipInfo.value.timezone,
      iconData:Icon( Icons.share_arrival_time_outlined)
  )),
],
      ))
    );
  }
}
