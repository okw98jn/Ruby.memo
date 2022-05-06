require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.to_s
input_number = memo_type.chomp

#1を押した場合
if input_number == "1"
    puts "拡張子を除いたファイルを入力して下さい"
    file_name = gets.chomp
    puts "メモしたい内容を入力してください"
    puts "完了したらcontrol+Dを押してください"
    memo_input =readlines
    
    CSV.open("#{file_name}.csv","w")do |csv|
        memo_input.each do |text|
            memo = text.chomp
            csv << [memo]
        end
    end
    puts "保存しました"
    puts "============メモ============"
    puts CSV.read("#{file_name}.csv")
    puts "============メモ============"

#2を押した場合
elsif input_number == "2"
    puts "既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
    file_name = gets.chomp
    CSV.open("#{file_name}.csv","a")do |csv|
        
        puts "============追加前のメモ============"
        puts CSV.read("#{file_name}.csv")
        puts "============追加前のメモ============"
        puts "追加したい内容を入力してください"
        puts "完了したらcontrol+Dを押してください"
        memo_input =readlines
        memo_input.each do |text|
            memo = text.chomp
            csv << [memo]
        end
        
    end
    puts "保存しました"
    puts "============追加後のメモ============"
    puts CSV.read("#{file_name}.csv")
    puts "============追加後のメモ============"

#1と2以外を押した場合   
else
    puts "1か2を押してください"
end

