module Dice_roll
    def critical(crit)
        dice_1 = rand(1..6)
        dice_2 = rand(1..6)
        current_total = dice_1 + dice_2
        puts "出目: [#{dice_1}, #{dice_2}] 合計: #{current_total}"
        if current_total >= crit
            return current_total + critical(crit)
        else
            return current_total
        end
    end
end
