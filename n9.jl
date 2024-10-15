using HorizonSideRobots

robot = Robot(animate=true)

function chess_board(robot)
    x, y  = diag(robot)
    tochci(robot, ((x + y) % 2 == 0))
    nikita(robot, x, y)
end

function diag(robot)
    x::Int = 0
    y::Int = 0

    while !isborder(robot, West) == true
        move!(robot, West)
        x += 1

    while !isborder(robot, Sud) == true
        move!(robot, Sud)
        y+=1
    end

    end

    return x, y
end
inverse(side::HorizonSide) = HorizonSide((Int(side)+2)%4)

function tochci(robot, flag)
    dv::Int = 2
    side = Ost
    if flag == true
        while !isborder(robot, Nord) || !isborder(robot, Ost)
            while !isborder(robot, side)
                if dv % 2 == 0
                    putmarker!(robot)
                    move!(robot, side)
                else
                    move!(robot, side)
                end
                dv += 1          
            end
            if dv % 2 == 0
                putmarker!(robot)
            end
            if !isborder(robot, Nord) || !isborder(robot, Ost)
                side = inverse(side)
                move!(robot, Nord)
                dv += 1
            end
        end
    else
        move!(robot,Ost)
        return tochci(robot, true)
    end    
end

function nikita(robot, x, y)
    for side in (Sud, West)
        while !isborder(robot, side)
            move!(robot, side)
        end
    end
    for _ in 1:x
        move!(robot, Ost)
    end
    for _ in 1:y
        move!(robot, Nord)
    end
end