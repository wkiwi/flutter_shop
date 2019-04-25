import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context,child,val){
        var goodsInfo = Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
        if(goodsInfo != null){
          return Container(
            margin: EdgeInsets.only(top:10.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                _goodsPrice(goodsInfo.presentPrice),
                _goodsOPrice(goodsInfo.oriPrice)
              ],
            ),
          );
        }else{
          return Text('正在加载....');
        }
      },
    );
  }

  //商品价格
  Widget _goodsPrice(price){
    return Container(
      padding: EdgeInsets.only(right: 30.0),
      child: Text(
        '¥${price}',
        style:TextStyle(
          color: Colors.red,
          fontSize:ScreenUtil().setSp(30),
        )
      ),
    );
  }
  //商品原来价格
  Widget _goodsOPrice(price){
    return Text(
        '市场价：¥${price}',
        style:TextStyle(
          color: Colors.black12,
          fontSize:ScreenUtil().setSp(20),
          decoration: TextDecoration.lineThrough
        )
      );
  }
}