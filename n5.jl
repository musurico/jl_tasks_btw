using HorizonSideRobots

robot = Robot(animate = true)

function cross(robot)
    d::Int = 0
    l::Int = 0
    k::Int = 0
    d, l = left_ugol(robot, West)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            putmarker!(robot)
            move!(robot, side)
        end
    end
    side1 = West
    f::Int = 0
    while f != 1
        for side in (Ost, West)
            if f == 1
                break
            end
            n::Int = 1
            while !isborder(robot, side)
                move!(robot, side)
                n += 1
            end
            if n == 12
                move!(robot, Nord)
            else
                f = 1
                side1 = side
            end
        end
    end
    if side1 == West
        k = 1
    end
    perimetr!(robot, side1)
    all_v(robot,d,l)
end

function left_ugol(robot, side1)
    d::Int = 0
    l::Int = 0
    while !isborder(robot, side1) || !isborder(robot, Sud)
        for side in (Sud, side1)
            while !isborder(robot, side)
                move!(robot, side)
                if side == Sud
                    d += 1
                else
                    l += 1
                end
            end
        end
    end
    return d, l
end

function perimetr!(robot, side1)
    for side in (Nord, side1, Sud, inverse(side1))
        if side == Nord
            side2 = side1
        elseif side == side1
            side2 = Sud
        elseif side == Sud
            side2 = inverse(side1)
        elseif side == inverse(side1)
            side2 = Nord
        end
        while isborder(robot, side2)
            putmarker!(robot)
            move!(robot, side)
        end
        putmarker!(robot)
        move!(robot,side2)
    end
    while !ismarker(robot)
        putmarker!(robot)
        move!(robot, Nord)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side)+2)%4)

function all_v(robot, d, l)
    d1::Int = d
    l1::Int = 11 - l
    left_ugol(robot, West)
    while d != 0
        move!(robot, Nord)
        d -= 1
    end
    while l != 0
        if isborder(robot, Ost)
            left_ugol(robot, Ost)
            while d1 != 0 
                move!(robot, Nord)
                d1 -= 1
            end
            while l1 != 0
                move!(robot, West)
                l1 -=1
            end
            break
        end
        move!(robot, Ost)
        l -= 1
    end
end