class Image < Attachment

  def full_url
    "http://pcyc-public.oss-cn-beijing.aliyuncs.com/" + url
  end
end
