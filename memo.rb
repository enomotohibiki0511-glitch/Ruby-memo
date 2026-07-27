require "csv"

loop do
  puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
  memo_type = gets.to_i

  if memo_type == 1
    puts "新しく作成するファイル名を入力してください（拡張子不要）"
    file_name = gets.chomp + ".csv"

    puts "メモしたい内容を入力してください。"
    puts "入力を終了する場合は Ctrl+D を押してください。"

    memo = readlines.map(&:chomp)

    CSV.open(file_name, "w") do |csv|
      memo.each do |line|
        csv << [line]
      end
    end

    puts "#{file_name} を作成しました。"
    break

  elsif memo_type == 2
    puts "編集するファイル名を入力してください（拡張子不要）"
    file_name = gets.chomp + ".csv"

    puts "追記する内容を入力してください。"
    puts "入力を終了する場合は Ctrl+D を押してください。"

    memo = readlines.map(&:chomp)

    CSV.open(file_name, "a") do |csv|
      memo.each do |line|
        csv << [line]
      end
    end

    puts "#{file_name} に追記しました。"
    break

  else
    puts "1か2を入力してください。1で新規ファイルの作成、2で既存ファイルの編集を行います。"
  end
end