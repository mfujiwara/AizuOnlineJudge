n = gets.to_i

def check(ax, ay, bx, by, cx, cy, dx, dy)
    ta = (cx - dx) * (ay - cy) + (cy - dy) * (cx - ax);
    tb = (cx - dx) * (by - cy) + (cy - dy) * (cx - bx);
    tc = (ax - bx) * (cy - ay) + (ay - by) * (ax - cx);
    td = (ax - bx) * (dy - ay) + (ay - by) * (ax - dx);
    return (tc * td <= 0 && ta * tb <= 0) ? 1 : 0
end

n.times do
    x1,y1,x2,y2,x3,y3,xk,yk,xs,ys=gets.chomp.split(" ").map(&:to_i)
    if (check(x1,y1,x2,y2,xk,yk,xs,ys) + check(x2,y2,x3,y3,xk,yk,xs,ys) + check(x3,y3,x1,y1,xk,yk,xs,ys)).odd?
        puts "OK"
    else
        puts "NG"
    end
end
