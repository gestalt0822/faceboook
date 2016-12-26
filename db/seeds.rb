# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


n = 1
while n <= 10
  Topic.create(
    title: "Dive into Coooooode #{n}",
    user_id: 13,
    content: "#{n}回目のテスト投稿"
    )
    n = n + 1
end
