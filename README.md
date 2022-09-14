# テーブル設計

## usersテーブル

| colum             | Type    | Options                  |
| ----------------- | ------- | ------------------------ |
|email              | string  | null: false unique: true |
|encrypted_password | string  | null: false              |
|nickname           | string  | null: false              |
|first_name         | string  | null: false              |
|last_name          | string  | null: false              |
|first_name_kana    | string  | null: false              |
|last_name_kana     | string  | null: false              |
|year_id            | integer | null: false              |
|month_id           | integer | null: false              |
|day_id             | integer | null: false              |


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


- has_one :order
- belongs_to :user

## ordersテーブル


| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| item       | references  | null: false, foreign_key: true |
| user       | references  | null: false, foreign_key: true |


### Assosiation


- belongs_to :item
- has_one :addresses
- belongs_to :user


## addressesテーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| post_code       | string      | null: false                    |
| prefectures_id  | integer     | null: false                    |
| address         | string      | null: false                    |
| city            | string      | null: false                    |
| building        | string      |                                |
| phone_number    | string      | null: false                    |
| order           | references  | null: false, foreign_key: true |


### Assosiation


- be_longs_to :order