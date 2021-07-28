class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ゲーム' }, { id: 2, name: 'ＳＮＳ' }, { id: 3, name: 'ショッピング' },
    { id: 4, name: 'マッチング' }, { id: 5, name: '娯楽' }, { id: 6, name: '教育' },
    { id: 7, name: '位置情報' }, { id: 8, name: '写真' }, { id: 9, name: 'ＥＣ' },
    { id: 10, name: 'ニュース' }, { id: 11, name: 'その他' },
  ]
  # dbに保存せず、上記のデータを取り出し可能。
end
