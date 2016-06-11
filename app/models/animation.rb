class Animation < ActiveRecord::Base
	validates :title, 
	presence: { message: "入力してください" },
	length: { minimum: 2, message: "短すぎ！" }
end
