# Furima-30930のER図

## users テーブル

| Column          | Type        | Options     |
|:---------------:|:-----------:|:-----------:|
| nickname        | string      | null: false |
| email           | string      | null: false |
| password        | string      | null: false |
| fmily_name      | string      | null: false |
| last_name       | string      | null: false |
| j_fmily_name    | string      | null: false |
| j_last_name     | string      | null: false |
| birthday_year   | date_select | null: false |
| birthday_month  | date_select | null: false |
| birthday_day    | date_select | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type        | Options     |
|:----------------:|:-----------:|:-----------:|
| image            | string      | null: false |
| name             | string      | null: false |
| explanation      | text        | null: false |
| category         | string      | null: false |
| state            | string      | null: false |
| shipping_charges | string      | null: false |
| shipping_area    | string      | null: false |
| shipping_date    | string      | null: false |
| price            | integer     | null: false |

### Association

- belongs_to :user
- has_many :purchases

## purchases テーブル

| Column         | Type       | Options     |
|:--------------:|:----------:|:-----------:|
| user_id        | references | null: false |
| item_id        | references | ----------- |
| purchase_state | boolean    | ----------- |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## address テーブル

| Column         | Type       | Options     |
|:--------------:|:----------:|:-----------:|
| postal_code    | integer    | null: false |
| prefectures    | integer    | null: false |
| municipalities | string     | null: false |
| address        | string     | null: false |
| building       | string     | ----------- |
| phone_number   | integer    | null: false |

### Association

- belongs_to :purchase