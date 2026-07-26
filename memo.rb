require "csv"

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = nil
loop do
  print "番号を入力してください: "
  memo_type = gets.to_i

  if memo_type == 1 || memo_type == 2
    break
  else
    puts "1か2を入力してください。1で新規ファイルの作成、2で既存ファイルの編集を行います。"
  end
end

file_mode = memo_type == 1 ? "w" : "a"

puts "メモの内容を入力してください（複数行入力できます。Ctrl+Dで保存します。）"

lines = STDIN.readlines.map(&:chomp)

CSV.open("memo.csv", file_mode) do |csv|
  lines.each do |line|
    csv << [line]
  end
end

puts "memo.csv に保存しました。"