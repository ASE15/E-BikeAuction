class Bike < ActiveRecord::Base
  belongs_to :user
  has_one :auction
  has_many :pictures, :inverse_of => :bike, :dependent => :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  def self.search(query)
    where("name LIKE ? OR brand LIKE ? OR color LIKE ? ", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.search_each(query)

    @bikes = self.search(query).all

    keywords = query.split(" ")
    keywords.each do |q|
      bikes_tmp = self.search(q).all
      if not bikes_tmp.empty?
        for b in bikes_tmp
          @bikes << b
        end
      end
    end
    @bikes = @bikes.flatten.uniq(&:id)
    return @bikes
  end
end