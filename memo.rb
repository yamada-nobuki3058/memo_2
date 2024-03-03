require "csv"
answer = nil

while answer != "n" do
  puts "新規作成か編集か選んでください"
  puts "1..新規でメモを書く、2..既存のメモを編集する"
  memo_type = gets.to_s.chomp
  while memo_type != "1" && memo_type != "2" do
    puts "無効な入力です。もう１度入力してください"
    puts "1..新規でメモを書く、2..既存のメモを編集する" 
    memo_type = gets.to_s.chomp
  end

  if memo_type == "1"
    puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
    file_name = gets.chomp
  
    puts "メモの内容を記入してください。Ctrl + dで保存します。"
    imput_memo = STDIN.read
    memo = imput_memo.chomp
  
    CSV.open("#{file_name}.csv" , "w") do |csv|
      csv.puts ["#{memo}"]
    end

  elsif memo_type == "2"
    puts "既存のメモを上書きします。上書きしたいメモの拡張子を除いたファイル名を入力してください。"
    file_name = gets.chomp
    puts "メモの内容を記入してください。Ctrl + dで保存します。"
    imput_memo = STDIN.read
    memo = imput_memo.chomp

    CSV.open("#{file_name}.csv" , "a") do |csv|
      csv.puts ["#{memo}"]
   end
  end
  puts "メモを続けますか？ y..続ける、n..終了する" 
  answer = gets.chomp

  while answer != "y" and answer != "n" do
    puts "無効な入力です。もう１度入力してください"
    puts "メモを続けますか？ y..続ける、n..終了する"
    answer = gets.chomp
  end
end