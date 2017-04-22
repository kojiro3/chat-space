# DB設計

## users table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false, unique: true              |

## Association

* has_many :groups, through: groups_users

* has_many :messages

* has_many :groups_users

## groups table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| name      | string  | null: false,                           |

## Association

* has_many :users, through: groups_users

* has_many :messages

* has_many :groups_users

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

## groups_users table

|  Column   |  Type   |              Option                    |
|:----------|:-------:|:---------------------------------------|
| group_id  | integer | foreign_key: true                      |
| user_id   | integer | foreign_key: true                      |

## Association

* belongs_to :group

* belongs_to :user
