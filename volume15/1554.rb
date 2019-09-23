# 3~2月の13日
WEEK_OF_MONTHS=[5,1,3,6,1,4,7,2,5,7,2,4]

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

period = (y2 - y1) / 2800
ret = period * 4816
y2 = y2 - period * 2800

y = y1
m = m1
while true do
    while true do
        if y == y2 && m == m2
            puts ret
            exit
        end
        ret += 1 if weekOfDay(y,m,13)==5
        m += 1
        if m == 13
            m = 1
            break
        end
    end
    y += 1
end