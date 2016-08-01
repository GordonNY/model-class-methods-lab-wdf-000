class Array
  def pluck(key)
    map {|obj| obj[key] }
  end
end
