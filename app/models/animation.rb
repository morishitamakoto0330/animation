class Animation < ActiveRecord::Base
	validates :title, 
	presence: { message: "タイトルを入力してください" }
end
