class Service < ActiveRecord::Base
  belongs_to :classification

  def comp_lions_in?(location)
    comps_for(location).exists?
  end

  def comp_percentage_in(location)
    comps_for(location).maximum(:percentage)
  end

  private

  def comps_for(location)
    Comp.where(location_id: location).
      joins(:classification).
      where("classifications.path @> :path", path: self.classification.path)
  end
end

