# FShare

#SINA https://github.com/sinaweibosdk/weibo_ios_sdk http://open.weibo.com/wiki/首页
#1.对传输安全的支持
#A.建立白名单并添加到你的app的plsit中
<key>NSAppTransportSecurity</key>
<dict>
<key>NSExceptionDomains</key>
<dict>
<key>sina.cn</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>weibo.cn</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>weibo.com</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>sinaimg.cn</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>sinajs.cn</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
<key>sina.com.cn</key>
<dict>
<key>NSIncludesSubdomains</key>
<true/>
<key>NSThirdPartyExceptionAllowsInsecureHTTPLoads</key>
<true/>
<key>NSThirdPartyExceptionRequiresForwardSecrecy</key>
<false/>
</dict>
</dict>
</dict>
#B.强制将NSAllowsArbitraryLoads属性设置为YES，并添加到你应用的plist中
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
</true>
</dict>

#2.对应用跳转的支持 https://developer.apple.com/videos/wwdc/2015/?id=703
<key>LSApplicationQueriesSchemes</key>
<array>
<string>sinaweibohd</string>
<string>sinaweibo</string>
<string>weibosdk</string>
<string>weibosdk2.5</string>
</array>

#3.Scheme
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLName</key>
#<string>com.weibo</string>
<key>CFBundleURLSchemes</key>
<array>
#<string>appkey</string>
</array>
</dict>
</array>

#4.scope权限接口 微博开放平台第三方应用scope，多个scope用逗号分隔
all                                 请求下列所有scope权限
email                               用户的联系邮箱
direct_messages_write               私信发送接口
direct_messages_read                私信读取接口
invitation_write                    邀请发送接口
friendships_groups_read             好友分组读取接口组
friendships_groups_write            好友分组写入接口组
statuses_to_me_read                 定向微博读取接口组
follow_app_official_microblog       关注应用官方微博，该参数不对应具体接口，只需在应用控制台填写官方帐号即可。填写的路径：我的应用-选择自己的应用-应用信息-基本信息-官方运营账号（默认值是应用开发者帐号）












