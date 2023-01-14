# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



#テーブル設計

## usersテーブル

| Column     | Type        | Option         |
| ---------- | ---------   | -------------- |
| nickname   | string      | null: false    |
| email      | string      | null: false, unique:true | ユニーク制約
| encrypted_password  | string    | null: false    | 
| surname    | string      | null: false    |
| name       | string      | null: false    |
| surnamek   | string      | null: false    |
| namek      | string      | null: false    |
| birthday   | string      | null: false    |

### Association

-has_many :items
-has_many :buys


## itemsテーブル

| Column     | Type        | Option         |
| ---------- | ---------   | -------------- |
| name       | string      | null: false    |
| content    | string      | null: false    |

| category   | string      | null: false    |
| state      | string      | null: false    |
| load       | string      | null: false    |
| area       | string      | null: false    |
| days       | string      | null: false    |

| price      | integer     | null: false    | 
| user_id    | references  | null: false,foreign_key: true    |


### Association

-belongs_to :user
-has_one :item


## buysテーブル

| Column     | Type         | Option         |
| ---------- | ---------    | -------------- |
| user_id    | references   | null: false, foreign_key: true  |
| item_id    | references   | null: false, foreign_key: true  |

### Association

-belongs_to :user
-belongs_to :buy
-has_one :address

# addressテーブル

| Column      | Type         | Option         |
| ----------  | ---------    | -------------- |
| post        | integer      | null: false    |
| prefectures | string       | null: false    |
| city        | string       | null: false    |
| num         | integer      | null: false    | 
| building    | string       |                |
| telephone   | string       | null: false    |

### Association

-belongs_to :buy
  