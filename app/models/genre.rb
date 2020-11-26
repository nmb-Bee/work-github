class Genre < ApplicationRecord

  has_many :items

  def status
    if directed_graph == true
      "有効"
    else
      "無効"
    end
  end

end
