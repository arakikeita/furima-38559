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

##usersテーブル

| Column     | Type      | Option         |
| ---------- | --------- | -------------- |
| email      | string    | null: false, unique:true | ユニーク制約
| encrypted_password  | string    | null: false    | 
| name       | string    | null: false    |
| profile    | text      | null: false    |
| occupation | text      | null: false    |
| position   | text      | null: false    |

### Association

-has_many :prototypes
-has_many :comments