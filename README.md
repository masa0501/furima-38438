# テーブル設計

## usersテーブル

| colum             | Type   | Options                  |
| ----------------- | ------ | ------------------------ |
|email              | string | null: false unique: true |
|password           | string | null: false              |
|encrypted_password | string | null: false              |
|nickname           | string | null: false              |


### Association

- has_many :items
- has_many :orders

## itemsテーブル


| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| name               | string      | null: false                    |
| explanation        | text        | null: false                    |
| price              | integer     | null: false                    |
| category_id        | string      | null: false                    |
| condition_id       | string      | null: false                    |
| delivery_charge_id | string      | null: false                    |
| area_id            | string      | null: false                    |
| days_id            | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association


- belongs_to :orders
- belongs_to :users

## ordersテーブル


| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| item       | references  | null: false, foreign_key: true |
| user       | references  | null: false, foreign_key: true |


### Assosiation


- has_many :items
- has_one :addresses
- belongs_to :users


## addressesテーブル

| Column          | Type        | Options     |
| --------------- | ----------- | ----------- |
| post_code       | string      | null: false |
| prefectures_id  | integer     | null: false |
| address         | string      | null: false |
| city            | string      | null: false |
| building        | string      | null: false |
| phone_number    | string      | null: false |


### Assosiation


- be_longs_to :orders