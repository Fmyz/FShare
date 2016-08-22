# FShare
微信SDK v1.7.3

#weixin https://open.weixin.qq.com
#1.对传输安全的支持
key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
</true>
</dict>
#2.对应用跳转的支持 https://developer.apple.com/videos/wwdc/2015/?id=703
<key>LSApplicationQueriesSchemes</key>
<array>
<string>weixin</string>
</array>

#3.Scheme
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleURLName</key>
#<string>weixin</string>
<key>CFBundleURLSchemes</key>
<array>
#<string>appid</string>
</array>
</dict>
</array>