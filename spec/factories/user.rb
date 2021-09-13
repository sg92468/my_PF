FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
   date { Faker::Date.backward }
   name { person.kanji }
   kana_name { person.katakana }
 end
end