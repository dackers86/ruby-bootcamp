class Wait
  def until(retry_time, max_attempts=5)

    max_attempts.times do |count| 
      return if yield

      raise("boom") if (count*retry_time) >= 5

      sleep(retry_time)
    end
  end
end