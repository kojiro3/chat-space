# DB設計

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

## groups table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false,                           |

## Association

* has_many :users, through: members

* has_many :messages

* has_many :members

## messages table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| body      | text    | null: false                            |
| image     | string  |                                        |
| group_id  | integer | foreign_key: true                      |
| user_id   | integer | foreign_key: true                      |

## Association

* belongs_to :group

* belongs_to :user

## members table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| group_id  | integer | foreign_key: true                      |
| user_id   | integer | foreign_key: true                      |

## Association

* belongs_to :group

* belongs_to :user
