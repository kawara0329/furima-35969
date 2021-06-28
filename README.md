
## users テーブル

|Column             |Type    |Options      |
|-------------------|--------|-------------|
|nickname           | string | null: false |
|email              | string | null: false |
|encrypted_password | string | null: false |
|name               | string | null: false |
|name_kana          | string | null: false |
birth_date          | string | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :shippings


## items テーブル

|Column          |Type           |Options|
|----------------|---------------|-------|
|item_image      | ActiveStorage | null: false |
|item_name       | string        | null: false |
|item_detail     | text          | null: false |
|category        | ActiveHash    | null: false |
|item_status     |ActiveHash     | null: false |
|shipping_charges|ActiveHash     | null: false |
|source          |ActiveHash     | null: false |
|date_time       |ActiveHash     | null: false |
|price           | integer       |             |
|seller          | string        | null: false |
|user            | references    | null: false,foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase
- has_many :shippings

## purchases テーブル

|Column|Type        |Options                         |
|------|------------|--------------------------------|
|buyer | string     | null: false                    |
|user  | references | null: false,foreign_key: true  |


### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippings テーブル

|Column      |Type    |Options      |
|------------|--------|-------------|
|postal_code | string | null: false |
|prefectures | string | null: false |
|municipality| string | null: false |
|address     | string | null: false |
|building    | string |             |
|tel         | string | null: false |


### Association
- belongs_to :user
- belongs_to :item
- has_one :purchase
