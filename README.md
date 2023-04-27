# README


DBの生成
下記のrailsコマンドを実行
rails generate scaffold user user_name:string user_password:string control_level:integer
rails generate scaffold status display_text:string
rails generate scaffold task user_id:integer display_text:string discription:text start_date_time:datetime end_date_time:datetime status_id:integer level:integer label:string