Pod::Spec.new do |spec|
  spec.name         = "YJHMessageQueue"
  spec.version      = "0.1.6"
  spec.summary      = "Ordered queue"
  spec.homepage     = "https://github.com/yunjinghui123/YJHMessageQueue"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "yunjinghui123" => "1432680302@qq.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/yunjinghui123/YJHMessageQueue.git", :tag => "#{spec.version}" }
  spec.requires_arc = true
  spec.source_files  = "YJHMessageQueue/*.{h,m}"
  spec.resource_bundles = {'YJHMessageQueue' => ['YJHMessageQueue/Resources/PrivacyInfo.xcprivacy']}
end
