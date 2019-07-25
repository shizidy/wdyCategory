Pod::Spec.new do |s|
s.name        = 'wdyCategory'
s.version     = '1.0.0'
s.authors     = { 'shizidy' => 'wangdongya1990@163.com' }
s.homepage    = 'https://github.com/shizidy/wdyCategory'
s.summary      = "category"
s.description  = <<-DESC
A tool for category 
DESC
s.source      = { :git => 'https://github.com/shizidy/wdyCategory.git',
:tag => '#{s.version}' }
s.license     = {type:'MIT', file:'LICENSE'}
s.platform = :ios, '8.0'
s.requires_arc = true
s.source_files = 'wdyCategory/*'
s.dependency 'SVProgressHUD'

end