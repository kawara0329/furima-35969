
## users テーブル

|Column             |Type    |Options                    |
|-------------------|--------|---------------------------|
|nickname           | string | null: false               |
|email              | string | null: false, unique: true |
|encrypted_password | string | null: false               |
|first_name         | string | null: false               |
|first_name_kana    | string | null: false               |
|last_name          | string | null: false               |
|last_name_kana     | string | null: false               |
|birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :purchases


## items テーブル

|Column             |Type           |Options      |
|-------------------|---------------|-------------|
|name               | string        | null: false |
|detail             | text          | null: false |
|category_id        | integer       | null: false |
|status_id          | integer       | null: false |
|shipping_charge_id| integer       | null: false |
|prefecture_id      | integer       | null: false |
|delivery_day_id       | integer       | null: false |
|price              | integer       | null: false |
|user               | references    | null: false,foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

|Column|Type        |Options                         |
|------|------------|--------------------------------|
|item  | references | null: false,foreign_key: true  |
|user  | references | null: false,foreign_key: true  |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

|Column         |Type        |Options       |
|---------------|------------|--------------|
|postal_code    | string     | null: false  |
|prefectures_id | integer    | null: false  |
|municipality   | string     | null: false  |
|address        | string     | null: false  |
|building       | string     |              |
|tel            | string     | null: false  |
|purchase       | references | null: false,foreign_key: true |


### Association
- belongs_to :purchase

