using HorizonSideRobots

robot = Robot(animate = true)

function chess_cross!(robot, n)
    aba = 0
    side = Ost
    for _i in 1:n
        for _j in 1:n-1
            if(aba % 2 == 0)
                putmarker!(robot)
            end
            move!(robot, side)
            aba += 1
        end
        if(aba % 2 == 0)
            putmarker!(robot)
        end
        move!(robot, Nord)
        aba += 1
        side = inverse(side)
    end

    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)