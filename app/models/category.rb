class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 1, name: 'レディース' },
    { id: 1, name: 'メンズ' },
    { id: 1, name: 'ベビー・キッズ' },
    { id: 1, name: 'インテリア・住まい・小物' },
    { id: 1, name: '本・音楽・ゲーム' },
    { id: 1, name: 'おもちゃ・ホビー・グッズ' },
    { id: 1, name: '家電・スマホ・カメラ' },
    { id: 1, name: 'スポーツ・レジャー' },
    { id: 1, name: 'ハンドメイド' },
    { id: 1, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :items
  
end