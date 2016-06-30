# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
=begin
Day.create(day: '日')
Day.create(day: '月')
Day.create(day: '火')
Day.create(day: '水')
Day.create(day: '木')
Day.create(day: '金')
Day.create(day: '土')

Ad.create(ad: 2015)
Ad.create(ad: 2016)
Ad.create(ad: 2017)
Ad.create(ad: 2018)
Ad.create(ad: 2019)

Season.create(season: '春')
Season.create(season: '夏')
Season.create(season: '秋')
Season.create(season: '冬')
=end
User.create(name: 'admin', password_digest: BCrypt::Password.create('admin'))
