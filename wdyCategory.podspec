Pod::Spec.new do |s|
s.name        = 'wdyCategory'
s.version     = '1.0.0'
s.authors     = { 'macmini' => 'wangdongya1990@163.com' }
s.homepage    = 'https://github.com/shizidy/wdyCategory.git'
s.summary     = 'category'
s.source      = { :git => 'https://github.com/shizidy/wdyCategory.git',
:tag => 1.0.0 }
s.license     = { :type => "MIT", :file => "LICENSE" }

s.platform = :ios, '8.0'
s.requires_arc = true
s.source_files = 'wdyCategory/*'
s.ios.deployment_target = '8.0'

s.dependency 'SVProgressHUD'

end