Pod::Spec.new do |s|
s.name        = 'wdyCategory'
s.version     = '1.0.0'
s.authors     = { 'macmini' => '287929070@qq.com' }
s.homepage    = 'https://github.com/shizidy/wdyCategory'
s.summary     = 'category'
s.source      = { :git => 'https://github.com/shizidy/wdyCategory.git',
:tag => s.version.to_s }
s.license     = { :type => "MIT", :file => "LICENSE" }

s.platform = :ios, '7.0'
s.requires_arc = true
s.public_header_files = 'lujhPrivate/lujh.h'
s.source_files = 'lujhPrivate/lujh.h'
s.ios.deployment_target = '7.0'

s.dependency 'SVProgressHUD'

s.subspec 'B' do |ss|
   
    ss.source_files = 'lujhPrivate/B/**/*.{h,m}'
    ss.public_header_files = 'lujhPrivate/B/**/*.h'
    
  end

s.subspec 'C' do |ss|
   
    ss.dependency 'lujhPrivate/B'

    ss.source_files = 'lujhPrivate/C/**/*.{h,m}'
    ss.public_header_files = 'lujhPrivate/C/**/*.h'
    
  end

end