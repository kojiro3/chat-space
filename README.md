# B設計

## users table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false, unique: true              |
| email     | string  | null: false, unique: true              |
| password  | string  | null: false                            |

## Association

* has_many :groups, through: members

* has_many :messages

* has_many :members
