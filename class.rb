class Rpgcharacter
    attr_accessor :name, :hp, :atk, :prt
    def initialize(name, hp, atk, prt)
        @name = name
        @hp = hp
        @atk = atk
        @prt = prt
        puts "#{@name}が誕生した!!（HP:#{@hp},ATK:#{@atk},DEF:#{@prt}）"
    end
end

class Hero < Rpgcharacter
    attr_accessor :name, :hp, :atk, :prt
end

class Enemy < RpgCharacter
    attr_accessor :name, :hp, :atk, :prt
end

hero = Hero.new("勇者", 100, 8, 4)
