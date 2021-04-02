class Sale < ActiveRecord::Base
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
