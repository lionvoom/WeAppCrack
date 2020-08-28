#### 背景
在研究/升级wept后,目前已实现**XX小程序框架**跑通了**devtools模式**
* 支持了大部分微信小程序常用API, [微信官方文档-小程序-开发-API](https://developers.weixin.qq.com/miniprogram/dev/api/)
* 支持小游戏

⚠️但是**XX小程序框架**很多下**基础API**跑不起来,比如无法使用原生播放器/蓝牙等;  
原因: 微信小程序**ios/android模式**下, 是通过原生去支撑这些**基础API**.


#### 目标
参考微信小程序**ios/android模式**, **XX小程序框架**支持**ios/android模式**, 进而通过原生去支撑这些**基础API**.


#### 思路
1. 逆向微信小程序
* ios端通过tweak工具, 编写动态库注入的方式, hook JSContext/WKWebview 的相关配置
* IDA/hopper查看微信小程序ios端实现伪代码
2. **XX小程序框架** 参考微信小程序实现ios/android模式

#### 研究微信小程序ios/android模式实现步骤
#####  ios/andriod 原生模块支撑
* 通过tweak hook JSContext，可以看出微信小程序原生模块支撑：
```
NativeGlobal
WeixinCanvas
WeixinJSCore
systemLog
WeixinNativeBuffer
SharedBufferCore
WeixinArrayBuffer
WeixinJSContext
WeixinWorker
WeAppWorker
```

#####  service初始化配置
* service之`app-service`初始化配置:
1.  原生模块支撑
2.  js初始化配置
```
var __wxConfig = {"platform":"ios"}; __wxConfig.clientVersion=385879598; __wxConfig.clientDebug = 0; __wxConfig.preload = true; __wxConfig.env = {}; __wxConfig.system = "iOS 13.6"; __wxConfig.env.USER_DATA_PATH = "wxfile://usr"; __wxConfig.isIsolateContext=true;__wxConfig.env.HAS_SPLASHSCREEN=false;__wxConfig.exportBaseMethods=true;__wxConfig.model = "iPhone 7<iPhone9,1>";__wxConfig.pixelRatio = 2.000000;__wxConfig.version = "7.0.14";__wxConfig.language = "zh_CN";
```
3.  加载WASubContext.js
4.  加载app-service.js

* service之`main`初始化配置:
1.  原生模块支撑
2.  js初始化配置
```
var __wxConfig = {"insertToWebLayer":1,"entryPagePath":"pages/index/index.html","pages":["pages/index/index","pages/invoice_apply/invoice_apply","pages/invoice_list/invoice_list","pages/invoice_details/invoice_details","pages/fapiao_view/fapiao_view","pages/check_info/check_info","pages/preview/preview","pages/info/info","pages/check_result/check_result","pages/edit/edit","pages/check_input/check_input","pages/check_scan/check_scan","pages/friend/friend","pages/wv/wv"],"navigateToMiniProgramAppIdList":["wx313490c64bc53c00","wx831049a35e7cdb69","wxb17f5d5d01db8949","wx34c1a56b500384ad"],"insertMapToWebLayer":1,"insertTextAreaToWebLayer":1,"insertCameraToWebLayer":1,"global":{"window":{"navigationBarTitleText":"WeChat","backgroundTextStyle":"light","navigationBarTextStyle":"black","navigationBarBackgroundColor":"#fff"}},"platform":"ios","debug":false,"downloadDomain":["https://696e-invoice-assistant-fe-1s0k8-1300683535.tcb.qcloud.la","https://696e-invoicehelper-production-1300683535.tcb.qcloud.la"],"insertLivePlayerToWebLayer":1,"insertVideoToWebLayer":1,"insertCanvasToWebLayer":1};__wxConfig.appLaunchInfo={"nativeExtraData":{"isPrivateMessage":false},"clickTimestamp":1598255543,"scene":1007,"isSticky":false,"prescene":1,"path":"pages/index/index.html","mode":"default","usedstate":2,"sessionid":"Session@1147285926_460126_1598255543763","preloadType":100,"prescene_note":"peng139_155","clickTimestampInMs":619948343818,"scene_note":"peng139_155:0_wx1af4f6aa3a537c1a_8821d5a58bc773477ba54d4fa895f54d_1597981247_0"};__wxConfig.clientVersion=385879847;__wxConfig.clientDebug = 0;__wxConfig.wxAppInfo = {"maxRequestConcurrent":10,"maxDownloadConcurrent":10,"subContextImgDomain":["https://wx.qlogo.cn/","https://thirdwx.qlogo.cn/"],"maxWorkerConcurrent":1,"template":[],"maxUploadConcurrent":10};__wxConfig.appType=0;__wxConfig.system = "iOS 13.6";__wxConfig.env = {};__wxConfig.env.USER_DATA_PATH = "wxfile://usr";__wxConfig.env.OPEN_DATA_PATH = "wxfile://opendata";__wxConfig.appContactInfo={"call_plugin_info":[],"user_version":"v2.0.3"};__wxConfig.isIsolateContext=true;__wxConfig.accountInfo={"appId":"wx1af4f6aa3a537c1a","nickname":"微信发票助手","icon":"http://mmbiz.qpic.cn/mmbiz_png/JCC5IkKbGqyezFTbGLPCHiciaZGNnCq7CEKlMV8icrjrA1jnIW50NYSIGl0rMCx8d8PNKxNrWiallt7l7qo8nW1iaWQ/640?wx_fmt=png&wxfrom=200"};__wxConfig.envVersion = "release";__wxConfig.appContactInfo.operationInfo = {};__wxConfig.appContactInfo.operationInfo.jsonInfo = {"bgKeepAlive":{"music":0},"privacy":{"banGetWifiListIfEmptyDesc":1,"banLocationIfEmptyDesc":1},"apiAvailable":{"navigateToMiniProgramConfig":0,"gameSceneFromMyApp":0,"shareCustomImageUrl":1,"h5PayDisableForward":0,"share":0,"authorize":0,"navigateToMiniProgram":1,"getUserInfo":0,"screenCanvasReadPixelsFreely":0,"openSetting":0},"misc_ban_info":{"minigame_freeze_status":0},"warning_info":{"jsapi_alter":[]},"jumpWeAppFromLongPressCodeBanInfo":{"banJumpApp":0,"banJumpGame":0},"op_info":{},"navigate_ban_info":{"navigate_ban_rule_list":[],"do_report":0}};__wxConfig.appContactInfo.passThroughInfo = {"forceUpdate":false};__wxConfig.env.HAS_SPLASHSCREEN=false;__wxConfig.model = "iPhone 7<iPhone9,1>";__wxConfig.pixelRatio = "(null)";__wxConfig.version = "7.0.15";__wxConfig.language = "zh_CN";__wxConfig.isLazyLoad=false;__wxConfig.menuButtonInfo = {};__wxConfig.menuButtonInfo.zIndex=1000;__wxConfig.host = {"env":"WeChat","appId":"","version":385879847};__wxConfig.screenWidth = 375.000000;__wxConfig.screenHeight = 667.000000;__wxConfig.safeArea = {"bottom":667,"height":647,"top":20,"width":375,"left":0,"right":375};__wxConfig.statusBarHeight = 20;
```
3.  js注入timer
4.  加载`WAServiceMainContext.js`

* 疑问: 一个小程序起两个service(JSContext),分别起什么作用?这两个service怎么相互配合的?

#####  webview配置
1.  webview初始化配置
```
var __wxConfig = {"insertToWebLayer":1,"system":"iOS 13.6","version":"7.0.15","insertMapToWebLayer":1,"clientVersion":385879845,"insertTextAreaToWebLayer":1,"insertCameraToWebLayer":1,"pixelRatio":2,"language":"zh_CN","insertLivePlayerToWebLayer":1,"insertVideoToWebLayer":1,"model":"iPhone 7<iPhone9,1>","insertCanvasToWebLayer":1};__wxConfig.screenTop = 64.000000;__wxConfig.preload = true;__wxConfig.host = {"env":"WeChat","appId":"","version":385879845};
```
2.  ⚠️待研究。。。

#### 参考微信小程序实现ios/android模式
* [ ]  模拟微信小程序配置JSContext/WKWebview
