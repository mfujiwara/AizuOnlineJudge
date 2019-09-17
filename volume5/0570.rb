a = gets.chomp
b = gets.chomp
M = gets.to_i

# k: 桁（n桁の数字について調べているときは n-1 は1の位を表す）
# f: 上限と等しい場合 0 そうでない場合 1
# u: 1（より大きい数字を探す）or 0（より小さい数字を探す）
# pre: 一桁左の数字
# mod: m での mod
# zero: 調べている位より上が全部0の場合 true そうでない場合 false
def get(k, f, u, pre, mod, zero)
    if k == @n
        return zero ? 0
         : mod==0 ? 1
         : 0
    end
    res = 0
    if zero
        res += get(k+1,1,0,0,0,true);
        (1..9).each do |i|
            res += get(k+1,1,0,i, i % M,false);
            if k+1 != @n
                res += get(k+1,1,1,i,i % M,false);
            end
        end
        return res % 10000
    end
    if @dp[k][f][u][pre][mod] != nil
        return @dp[k][f][u][pre][mod]
    end
    if f == 1
        if u == 1
            ((pre+1)..9).each do |i|
                res += get(k+1,1,0,i,(mod*10+i) % M,false)
            end
        else
            (0..(pre-1)).each do |i|
                # puts "#{k+1},#{1},#{1},#{p},(mod*10+i) % M"
                res += get(k+1,1,1,i,(mod*10+i) % M,false)
            end
        end
    else
        if u == 1
            ((pre+1)..@s[k]).each do |i|
                if i == @s[k]
                    res += get(k+1,0,0,i,(mod*10+i) % M,false)
                else
                    res += get(k+1,1,0,i,(mod*10+i) % M,false)
                end
            end
        else
            (0..[pre-1, @s[k]].min).each do |i|
                if i == @s[k]
                    res += get(k+1,0,1,i,(mod*10+i) % M,false)
                else
                    res += get(k+1,1,1,i,(mod*10+i) % M,false)
                end
            end
        end
    end
    res = res % 10000
    @dp[k][f][u][pre][mod] = res
    return res
end

def calc(r)
    @n = r.length
    @s = r.split("").map(&:to_i)
    @dp = Array.new(@n+1)
    (0..@n).each do |i|
        @dp[i] = Array.new(2)
        (0..1).each do |j|
            @dp[i][j] = Array.new(2)
            (0..1).each do |k|
                @dp[i][j][k] = Array.new(10)
                (0..9).each do |l|
                    @dp[i][j][k][l] = Array.new(M)
                end
            end
        end
    end
    res = 0
    res += get(1, 1, 0, 0, 0, true)
    (1..@s[0]).each do |i|
        if i == @s[0]
            res += get(1,0,0,i,i % M,false)
            if @n != 1
                res += get(1,0,1,i,i % M,false)
            end
        else
            res += get(1,1,0,i,i % M,false)
            if @n != 1
                res += get(1,1,1,i,i % M,false)
            end
        end
    end
    return res % 10000
end

def judge(r)
    array = r.split("").map(&:to_i)
    pre_diff = nil
    (0..(array.length-2)).each do |i|
        diff = array[i] - array[i+1]
        return false if diff == 0
        if pre_diff == nil
            pre_diff = diff
            next
        end

        if pre_diff * diff < 0
            pre_diff = diff
        else
            return false
        end
    end
end

puts (calc(b) - calc(a) + 10000 + (judge(a) ? 1 : 0)) % 10000 
