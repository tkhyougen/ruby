#①player = Player.newの記述の意味=> Playerというクラスを使用して新たにplayerオブジェクト（インスタンス）を作成し、変数playerに代入
#② 大文字のPlayerと小文字のplayerの違い=>大文字はPlayerというクラス名、小文字は変数

class Player
  def hand
    #コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理
    while true
      puts"数字を入力してください"
      puts"[0]グー、[1]チョキ、[2]パー"
      janken_hand=gets.to_i
      if janken_hand<=2&&janken_hand>=0
        return janken_hand
      else
        puts "1-3を入力してください"
      end
    end
  end
end


class Enemy
  def hand
# グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    janken_enemy_hand=rand(3)
    return janken_enemy_hand
  end
end


class Janken
  def pon(player_hand, enemy_hand)

      choice_hand=["グー","チョキ","パー"]
      player_hand_choice=choice_hand[player_hand]
      puts"あなたの選択は#{player_hand_choice}です"
      enemy_hand_choice=choice_hand[enemy_hand]
      puts"相手の選択は#{enemy_hand_choice}です"
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
      result=(player_hand-enemy_hand+3)%3
      if result==2
        puts"あなたの勝ちです"
        return false
      elsif result==1
        puts "あなたの負けです"
        return false
      else
        puts"あいこです"
        return true
      end

  end# def pon
end#class



player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
while janken.pon(player.hand, enemy.hand) do
  janken.pon(player.hand, enemy.hand)
end
