# Structure of DataBase

## User
### association
```
has many :articles, comments, articlelikes, commentlikes
```
### table
* name
* e-mail
* password
* profile
* avator
* gender

## Article
### association
```
has_many :comments, articlelikes
belong_to :user
```
### table
* title
* thumbnail
* content
* user_id

## Comment
### association
```
has_many :commentlikes
belong_to: :user, article
```
### table
* content
* user_id
* article_id
* agree

## ArticleLike
### association
```
belong_to :user, article
```
### table
* user_id
* article_id

## CommentLike
### association
```
belong_to :user, comment
```
### table
* user_id
* comment_id

