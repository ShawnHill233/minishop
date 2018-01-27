module DateTimeHelper
  extend self
#日期时间
  def common_datetime_with_second(time)
    time.localtime.strftime('%Y-%m-%d %H:%M:%S') unless time.nil?
  end

  def common_datetime_text(time)
    time.localtime.strftime('%Y-%m-%d %H:%M') unless time.nil?
  end

  def common_datetime_without_year(time)
    if time.instance_of?(Fixnum)
      time = Time.at(time)
    end
    time.localtime.strftime('%m/%d %H:%M') unless time.nil?
  end

#日期
  def common_date_text(date)
    date.localtime.strftime('%Y-%m-%d') unless date.nil?
  end

  def common_date_chinese_text(date)
    date.localtime.strftime('%Y年%m月%d日') unless date.nil?
  end

  def common_date(date)
    date.localtime.strftime('%m/%d') unless date.nil?
  end

#时间
  def time_of_day(time)
    time.strftime('%H:%M').to_s unless time.nil?
  end

end