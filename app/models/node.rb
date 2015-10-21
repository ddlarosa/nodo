class Node < ActiveRecord::Base
  has_many :node_results
  
  def get_statistics_per_week
    statistics_per_week={}
      (-6..0).each do |i|
        statistics_per_week[(Time.now.midnight+i.day).strftime("%Y%m%d")]=NodeResult.where(node:self.id,created_at: Time.now.midnight+i.day..(Time.now.midnight+(i+1).day)).distinct.count(:mac)
      end
    return statistics_per_week
  end
end
