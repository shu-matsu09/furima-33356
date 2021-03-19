class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 1, name: '新品・未使用' },
    { id: 1, name: '未使用に近い' },
    { id: 1, name: '目立った傷や汚れなし' },
    { id: 1, name: 'やや傷や汚れあり' },
    { id: 1, name: '傷や汚れあり' },
    { id: 1, name: '全体的に状態が悪い' },
  ]

  include ActiveHash::Associations
  has_many :items

end