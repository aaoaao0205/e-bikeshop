# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false,unique: true|
| password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |


### Association

- has_many :items 
- has_many :orders

## items テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name       | string | null: false |
| description        | text   | null: false |
| prefecture_id      | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## addresses テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture_id      | integer | null: false |
| city               | string | null: false |
| street_address     | string | null: false |
| building_name      | string |             |
| phone_number       | string | null: false |
| order             | references | null: false foreign_key: true |

### Association

- belongs_to :order

## orders テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item               | string | references | null: false foreign_key: true |
| user               | string | references | null: false foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## test_drive_reservations テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false,unique: true|
| phone              | string | null: false |
| desired_product    | string | null: false |
| desired_date       | string | null: false |
| desired_time       | string | null: false |
| item_id            | bigint | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_many :test_drive_reservations
