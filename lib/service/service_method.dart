import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

//公共请求

Future _request(url,{formData}) async{
  try{
    print('开始获取数据.........');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if(formData == null){
      response = await dio.post(url);
    }else{
      response = await dio.post(url,data: formData);
    }
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('后端接口出现异常');
    }
  }catch(e){
    return print('ERROR: ==========${e}');
  }
}

//获取首页主体内容

Future getHomePageContent() async{
  var formData = {'lon':'115.02932','lat':'35.76189'};
  return _request(servicePath['homePageContext'], formData:formData);
}

//获取首页商品热卖

Future getHomePageBeloConten(page) async{
  print('开始获取火爆专区数据');
  return _request(servicePath['homePageBelowConten'], formData:page);
}

//获取分类页面数据

Future getCategory() async{
  print('开始获取分类页面数据');
  return _request(servicePath['getCategory']);
}

//获取分类页面商品列表数据

Future getGoodsList(data) async{
  print('开始获取分类页面数据');
  return _request(servicePath['getMallGoods'],formData: data);
}


//获取商品详情数据

Future getGoodsInfoService(data) async{
  print('开始获取详情页面数据');
  return _request(servicePath['getGoodDetailById'],formData: data);
}