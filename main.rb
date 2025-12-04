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

    def attack
        puts "#{@name}の攻撃"
        crit_damage = Dice_roll.critical(@crit)
        total_damage = @atk + crit_damage
        puts "敵に#{total_damage}ダメージを与えた"
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
    puts "#{@name}は#{total_damage}を受けた!!"
    @hp -= damage
    end
end

class Hero < RpgCharacter
end

class Enemy < RpgCharacter
end

# ----テスト----
hero = Hero.new("勇者", 100, 8, 4, 10)
slime = Enemy.new("スライム", 20, 4, 2)

hero.attack
