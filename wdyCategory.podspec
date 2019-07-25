Pod::Spec.new do |s|
s.name        = 'wdyCategory'
s.version     = '1.0.0'
s.license     = 'MIT'
s.authors     = { 'shizidy' => 'wangdongya1990@163.com' }
s.homepage    = 'https://github.com/shizidy/wdyCategory'
s.summary     = 'category tool'
s.source      = { :git => 'https://github.com/shizidy/wdyCategory.git',
:tag => 'v1.0.0' }
s.platform    = :ios, '8.0'
s.requires_arc = true
s.source_files = 'wdyCategory/*'
s.dependency 'SVProgressHUD'

end