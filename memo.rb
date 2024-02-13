require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
puts "文字を入力して下さい"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

  if memo_type == 1
    puts "新規でメモを作成します　拡張子を除いたファイル名を入力して下さい"
  
    file_name = gets.to_s
    puts "テキストを入力して下さい"
    puts "完了したら Ctrl + D を押して下さい"
  
    input = STDIN.read
    memo = input.chomp
    CSV.open("#{file_name}.csv","wb") do |csv|
    csv.puts ["#{memo}"]
  end
  
  elsif memo_type == 2
    puts "既存のメモを編集します　拡張子を除いたファイル名を入力して下さい"
   
    file_name = gets.to_s
    puts "テキストを入力して下さい"
    puts "完了したら Ctrl + Dを押して下さい"
   
    input = STDIN.read
    memo = input.to_s.chomp
    CSV.open("#{file_name}.csv" ,"a") do |csv|
    csv.puts ["#{memo}"]
  end
   
  else
    puts "半角数字で1または2を入力して下さい"
  end