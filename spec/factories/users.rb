FactoryBot.define do
  factory :user do
    nickname { 'TestUser' }
    email { 'test@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birthday { '2000-01-01' }
  end
end
