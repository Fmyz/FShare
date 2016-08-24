# FTencentSDK
腾讯QQSDK v3.1.0

#weixin http://wiki.open.qq.com
#1.对传输安全的支持
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
<key>NSExceptionDomains</key>
<dict>
<key>idqqimg.com</key>
<dict>
<key>NSExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSIncludesSubdomains</key>
<string>YES</string>
<key>NSExceptionRequiresForwardSecrecy</key>
<string>NO</string>
</dict>
<key>qlogo.cn</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>qplus.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSExceptionRequiresForwardSecrecy</key>
<false/>
<key>NSExceptionAllowsInsecureHTTPLoads</key>
<true/>
</dict>
<key>qq.com</key>
<dict>
<key>NSExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSExceptionRequiresForwardSecrecy</key>
<false/>
<key>NSIncludesSubdomains</key>
<true/>
</dict>
<key>gtimg.cn</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
</dict>
</dict>

#2.对应用跳转的支持 https://developer.apple.com/videos/wwdc/2015/?id=703
<key>LSApplicationQueriesSchemes</key>
<array>
<string>mqq</string>
<string>mqqapi</string>
<string>mqqwpa</string>
<string>mqqbrowser</string>
<string>mttbrowser</string>
<string>mqqOpensdkSSoLogin</string>
<string>mqqopensdkapiV2</string>
<string>mqqopensdkapiV3</string>
<string>mqqopensdkapiV4</string>
<string>wtloginmqq2</string>
<string>mqzone</string>
<string>mqzoneopensdk</string>
<string>mqzoneopensdkapi</string>
<string>mqzoneopensdkapi19</string>
<string>mqzoneopensdkapiV2</string>
<string>mqqapiwallet</string>
<string>mqqopensdkfriend</string>
<string>mqqopensdkdataline</string>
<string>mqqgamebindinggroup</string>
<string>mqqopensdkgrouptribeshare</string>
<string>tencentapi.qq.reqContent</string>
<string>tencentapi.qzone.reqContent</string>
</array>

#3.Scheme
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLName</key>
#<string>tencent</string>
<key>CFBundleURLSchemes</key>
<array>
#<string>tencent222222</string>
</array>
</dict>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLName</key>
#<string>qzoneScheme</string>
<key>CFBundleURLSchemes</key>
<array>
#<string>mqzone</string>
</array>
</dict>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLName</key>
#<string>tencentApiIdentifier</string>
<key>CFBundleURLSchemes</key>
<array>
#<string>tencent222222.content</string>
</array>
</dict>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLName</key>
#<string>mqqapi</string>
<key>CFBundleURLSchemes</key>
<array>
#<string>QQ0003640E</string>
</array>
</dict>
</array>

#4. permissions
kOPEN_PERMISSION_GET_USER_INFO,获取用户信息;
kOPEN_PERMISSION_GET_SIMPLE_USER_INFO, 移动端获取用户信息;
kOPEN_PERMISSION_GET_INFO,获取登录用户自己的详细信息;
kOPEN_PERMISSION_GET_VIP_RICH_INFO,     获取会员用户详细信息;
kOPEN_PERMISSION_GET_VIP_INFO,          获取会员用户基本信息;
kOPEN_PERMISSION_GET_OTHER_INFO,        获取其他用户的详细信息;  
kOPEN_PERMISSION_ADD_TOPIC,             发表一条说说到 QQ 空间 (需要申请权限);
kOPEN_PERMISSION_ADD_ONE_BLOG,          发表一篇日志到 QQ 空间 (需要申请权限);
kOPEN_PERMISSION_ADD_ALBUM,             创建一个 QQ 空间相册 (需要申请权限);
kOPEN_PERMISSION_UPLOAD_PIC,            上传一张照片到 QQ 空间相册 (需要申请权限);
kOPEN_PERMISSION_LIST_ALBUM,            获取用户 QQ 空间相册列表 (需要申请权限);
kOPEN_PERMISSION_ADD_SHARE,             同步分享到 QQ 空间、腾讯微博;
kOPEN_PERMISSION_CHECK_PAGE_FANS,       验证是否认证空间粉丝;
