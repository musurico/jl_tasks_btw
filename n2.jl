using HorizonSideRobots

robot = Robot(animate = true)

function perimetr(robot)
    n::Int = 0
    m::Int = 0
    while isborder(robot, Sud) == false
        move!(robot, Sud)
        n += 1
    end
    while isborder(robot, West) == false
        move!(robot, West)
        m += 1
    end

    for side in (Ost, Nord, West, Sud)
        border(robot, side)
    end

    move2!(robot, Ost, m)
    move2!(robot, Nord, n)

end
function move2!(robot, side, n)
    for _ in 1:n
        move!(robot, side)
    end
end

function border(robot, side)
    while isborder(robot, side) == false
        putmarker!(robot)
        move!(robot, side)
    end
end