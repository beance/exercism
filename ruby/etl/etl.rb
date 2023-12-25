# frozen_string_literal: true

module ETL
  def self.transform(old)
    old.each_with_object({}) do |(k, v), h|
      v.each do |i|
        h[i.downcase] = k
      end
    end
  end
end
