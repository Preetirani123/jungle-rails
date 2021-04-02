class Sale < ActiveRecord::Base

  def self.active
    where("sales.starts_on <= ? AND sales.end_on >= ?", Date.current, Date.current)
  end

  def finised?
    end_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !finised? && !upcoming?
  end
end
