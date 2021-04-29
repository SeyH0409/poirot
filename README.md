# テーブル設計

## usersテーブル

| Column             | Type   | options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
-has_many :novels
-has_many :tips

## novelsテーブル

| Column             | Type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
-has_many :tips
-belongs_to :user

## tipsテーブル

| Column             | Type       | options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| novel              | references | null: false, foreign_key: true |
| price              | integer    | null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :novel
