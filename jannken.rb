def janken
  puts "じゃんけん..."
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"
  jankens = ["グー", "チョキ", "パー"]
  
  input = gets.chomp
  if input.match?(/\A[0-3]\z/) #0~3しか入力できない
    player_hand = input.to_i
  else
    puts "無効な入力です。0~3の数字を入力してください"
    exit(1)
  end

  computer_hand = rand(3)
    
  if player_hand == 3
    puts "じゃんけんを終了します"
    exit
  end

  puts "ホイ!"
  puts "-------------------"  
  puts "あなた: #{jankens[player_hand]}"
  puts "相手： #{jankens[computer_hand]}"

  if player_hand == computer_hand
    puts "あいこ"
    puts "-------------------"
      janken
  elsif (player_hand == 0 && computer_hand == 1) || (player_hand == 1 && computer_hand == 2) || (player_hand == 2 && computer_hand == 0)
    puts "あなたの勝ち"
    puts "-------------------"
    :win
  else 
    puts "あなたの負け"
    puts "-------------------"
    :lose
  end 
end

def attimuitehoi(result)
  puts "あっち向いて.."
  puts "0(上)1(右)2(下)3(左)"
  directions = ["上", "右", "下", "左"]
  
  input = gets.chomp
  if input.match?(/\A[0-3]\z/) #0~3しか入力できない
    player_direction = input.to_i
  else
    puts "無効な入力です。0~3の数字を入力してください"
    exit(1)
  end

  computer_direction = rand(4)
  
  puts "ホイ!"
  puts "--------------"
  puts "あなた: #{directions[player_direction]}"
  puts "相手: #{directions[computer_direction]}"
  
  case result
    when :win
      if player_direction == computer_direction
        puts "あなたの勝ち"
      else
        puts "セーフ"
        puts "-------------------"
        janken
        attimuitehoi(result)
      end
    when :lose
      if player_direction == computer_direction
        puts "あなたの負け"
      else
        puts "セーフ"
        puts "-------------------"
        janken
        attimuitehoi(result)
      end
  end
end
  
result = janken

if result == :win || result == :lose
  attimuitehoi(result)
end
