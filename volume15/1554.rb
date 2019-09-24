# 3/1が index 曜日の時の １年間の 13th Fri の数
NUM_OF_13FRI = [2, 1, 2, 1, 2, 2, 2]

def weekOfDay(year, month, day)
    Time.gm(year, month, day).wday
end

y1,m1,d1,y2,m2,d2=gets.chomp.split(" ").map(&:to_i)

if d1 > 13
    if m1 == 12
        m1 = 1
        y1 += 1
    else
        m1 += 1
    end
end

if d2 >= 13
    if m2 == 12
        m2 = 1
        y2 += 1
    else
        m2 += 1
    end
end

period = (y2*100 - y1*100 + m2 - m1) / 280000
ret = period * 4816
y2 = y2 - period * 2800

y = y1
m = m1
while true do
    if y == y2 && m == m2
        puts ret
        break
    elsif m == 3 && y2 > y && m2 > 2
        ret += NUM_OF_13FRI[weekOfDay(y,3,1)]
        y += 1
    else
        ret += 1 if weekOfDay(y,m,13)==5

        m += 1
        if m == 13
            y += 1
            m = 1
        end
    end
end
