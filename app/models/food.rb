class Food < ApplicationRecord
  validates :name, presence: true
  validates :name, {length: {maximum:11} }

  mount_uploader :image, ImageUploader
  
  enum management: {賞味期限:1, 消費期限:2, 管理しない:3}
  def limit_day
    now = "#{Time.zone.now.year}年#{Time.zone.now.month}/#{Time.zone.now.day}"

    if management == "管理しない"
      "管理しない"
    else
      now
    end
  end

  def deadline
    years = limit.year - Time.zone.now.year
    days = limit.yday - Time.zone.now.yday

    "#{limit} g #{Time.zone.now}   aaa   #{days + 365}"

    if management == "管理しない"
      ""
    elsif years == 0 && days < 0
      "期限切れ"
    elsif years == 0 && days == 0
      "今日まで"
    elsif years == 0 && days > 0
      "あと#{days}日"
    elsif years < 0
      "期限切れ"
    elsif years > 0 && days < 0
      "あと#{years - 1}年と#{days + 365}日"
    elsif years > 0 && days == 0
      "あと#{years}年"
    elsif years > 0 && days > 0
      "あと#{years}年と#{days}日"
    end
  end
end
