Pod::Spec.new do |s|
s.name        = 'wdyCategory'
s.version     = '1.0.0'
s.authors     = { 'shizidy' => 'wangdongya1990@163.com' }
s.homepage    = 'https://github.com/shizidy/wdyCategory.git'
s.summary      = "A tool for category"
s.description  = <<-DESC
A tool for category 
DESC
s.source      = { :git => 'https://github.com/shizidy/wdyCategory.git',
:tag => 'v1.0.0' }
s.license     = 'MIT'

s.platform = :ios, '8.0'
s.requires_arc = true
s.source_files = 'wdyCategory/*.{h,m}'
s.dependency 'SVProgressHUD'

end