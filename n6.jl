using HorizonSideRobots

robot=Robot(animate=true)

function pole(robot)
    d::Int = 0
    l::Int = 0
    left_ugol(robot)
    perimetr(robot)
end

function left_ugol(robot)
    while !isborder(robot, West) || !isborder(robot, Sud)
        for side in (Sud, West)
            while !isborder(robot, side)
                move!(robot, side)
            end
        end
    end
end

function perimetr(robot)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            putmarker!(robot)
            move!(robot, side)
        end
    end
end
