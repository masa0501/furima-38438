# テーブル設計

## usersテーブル

| colum             | Type   | Options     |
| ----------------- | ------ | ----------- |
|email              | string | null: false |
|encrypted_password | string | null: false |
|nickname           | string | null: false |


### Association

- has_many :items

## itemsテーブル


| Column      | Type        | Options                        |
| ----------- | ----------- | ------------------------------ |
| name        | string      | null: false                    |
| explanation | text        | null: false                    |
| price       | integer     | null: false                    |
| user        | references  | null: false, foreign_key: true |

### Association


- belongs_to :orders
- belongs_to :users

## ordersテーブル


| Column     | Type        | Options                        |
| ---------- | ----------- | ------------------------------ |
| items       | references  | null: false, foreign_key: true |


### Assosiation


- has_many :items
- has_one :addresses


## addressesテーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| post_code    | string      | null: false |
| prefectures  | text        | null: false |
| address      | integer     | null: false |
| city         | string      | null: false |
| building     | string      | null: false |
| phone_number | integer     | null: false |


### Assosiation


- be_longs_to :orders