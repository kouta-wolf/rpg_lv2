require_relative 'dice' 

class RpgCharacter
    attr_accessor :name, :hp, :atk, :prt, :crit
    def initialize(name, hp, atk, prt, crit = 13)
        @name = name
        @hp = hp
        @atk = atk
        @prt = prt
        @crit = crit
        puts "#{@name}が誕生した!!（HP:#{@hp},ATK:#{@atk},DEF:#{@prt},CRI:#{@crit}）"
    end

    def reset_status
        @is_defending = false
    end

    def attack
        puts "#{@name}の攻撃"
        crit_damage = Dice_roll.critical(@crit)
        total_damage = @atk + crit_damage
        return total_damage
    end

    def defense
        puts "#{@name}は防御した"
        @is_defending = true
    end

    def take_damage(total_damage)
        if @is_defending
            total_damage -= @prt * 2
        else
            total_damage -= @prt
        end

        if total_damage > 0
            puts "#{@name}は#{total_damage}ダメージを受けた!!"
            @hp -= total_damage
        else
            puts "#{@name}は攻撃を受け流した!!"
        end

    end
end

class Hero < RpgCharacter
end

class Enemy < RpgCharacter
end


hero = Hero.new("勇者", 100, 8, 4, 11)
slime = Enemy.new("スライム", 20, 4, 2)
puts "敵が現れた"
loop do

    # 戦闘の初期化
    hero.reset_status

    puts "あなたのターンです。何をしますか？"
    puts "1.攻撃  2.防御"
    battle_select = gets.to_i
    if battle_select == 1
        damage_val = hero.attack
        slime.take_damage(damage_val)
    end
    
    puts "-------------------------"
    
    if slime.hp <= 0
        puts "スライムを倒しました"
        puts "あなたの勝利です"
        break
    end
    
    puts "敵の攻撃です"
    damage_val = slime.attack
    hero.take_damage(damage_val)
    puts "-------------------------"

    # ----テスト----
    puts "HERO_HP:#{hero.hp}, SLIME_HP:#{slime.hp}"
end

