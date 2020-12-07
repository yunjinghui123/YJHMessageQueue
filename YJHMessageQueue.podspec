Pod::Spec.new do |spec|
  spec.name         = "YJHMessageQueue"
  spec.version      = "0.1.3"
  spec.summary      = "Ordered queue"
  spec.homepage     = "https://github.com/yunjinghui123/YJHMessageQueue"
  spec.license      = "MIT"
  spec.author       = { "yunjinghui123" => "1432680302@qq.com" }
  spec.platform     = :ios, "8.0"
  spec.source       = { :git => "https://github.com/yunjinghui123/YJHMessageQueue.git", :tag => "#{spec.version}" }
  spec.source_files  = "YJHMessageQueue", "YJHMessageQueue/**/*.{h,m}"
  spec.requires_arc = true
end
