# Furima-30930のER図

## users テーブル

| Column             | Type        | Options     |
|:------------------:|:-----------:|:-----------:|
| nickname           | string      | null: false |
| email              | string      | null: false , unique: true |
| encrypted_password | string      | null: false |
| family_name        | string      | null: false |
| last_name          | string      | null: false |
| j_family_name      | string      | null: false |
| j_last_name        | string      | null: false |
| birthday           | date        | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type        | Options     |
|:-------------------:|:-----------:|:-----------:|
| name                | string      | null: false |
| explanation         | text        | null: false |
| category_id         | integer      | null: false |
| state_id            | integer     | null: false |
| shipping_charge_id  | integer     | null: false |
| shipping_area_id    | integer     | null: false |
| shipping_date_id    | integer     | null: false |
| price               | integer     | null: false |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column         | Type       | Options     |
|:--------------:|:----------:|:-----------:|
| user           | references | null: false |
| item           | references | ----------- |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options     |
|:--------------:|:----------:|:-----------:|
| postal_code    | string     | null: false |
| prefectures    | integer    | null: false |
| municipalities | string     | null: false |
| residence      | string     | null: false |
| building       | string     | ----------- |
| phone_number   | string     | null: false |
| purchase       | references | ----------- |

### Association

- belongs_to :purchase