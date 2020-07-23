FactoryBot.define do
  factory :user do
    id { 1 }
    email { "example@test.com" }
    encrypted_password { "999999" }
    name { "test" }
    #実際にはない項目だが、deviceを通しているためか、blankでエラーになる。この対応
    password {"9999999"}
  end
end