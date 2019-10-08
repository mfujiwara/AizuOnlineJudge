N,T=gets.chomp.split(" ").map(&:to_i)
def to_minute(time)
    h,m=time.split(":").map(&:to_i)
    h*60+m
end
ret = []
now = nil
N.times do
    st_time, st_name, ar_time, ar_name=gets.chomp.split(" ")
    st_minute = to_minute(st_time)
    ar_minute = to_minute(ar_time)
    if now != nil && st_minute -now >= T
        ret.push("#{st_name} #{st_minute-now}")
    end
    now = ar_minute
end
puts ret.length
puts ret