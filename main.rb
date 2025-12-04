require_relative 'dice' 

class RpgCharacter
    attr_accessor :name, :hp, :atk, :prt
    def initialize(name, hp, atk, prt)
        @name = name
        @hp = hp
        @atk = atk
        @prt = prt
        puts "#{@name}が誕生した!!（HP:#{@hp},ATK:#{@atk},DEF:#{@prt}）"
    end
end

class Hero < RpgCharacter
    include Dice_roll
end

class Enemy < RpgCharacter
end

hero = Hero.new("勇者", 100, 8, 4)
slime = Enemy.new("スライム", 20, 4, 2)
