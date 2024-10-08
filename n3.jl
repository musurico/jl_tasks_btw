using HorizonSideRobots

robot = Robot(animate = true)

function cross(robot)
    n::Integer = 0
    m::Integer = 0
    n = border(robot, Sud)
    m = border(robot, West)

    while isborder(robot, Nord) == false
        linia(robot)
    end

    border(robot, West)
    border(robot, Sud)
    move_move!(robot, Ost, m)
    move_move!(robot, Nord, n)
end

function linia(robot)

    while isborder(robot, Nord) == false
        putmarker!(robot)
        move_move_move!(robot, Ost)
        move!(robot, Nord)
        putmarker!(robot)
        move_move_move!(robot, West)
        move!(robot, Nord)
    end
    putmarker!(robot)
    move_move_move!(robot, Ost)
end

function border(robot, side)
    n::Int = 0
    while isborder(robot, side) == false
        move!(robot, side)
        n += 1
    end
    return n
end

function move_move!(robot, side, n)
    for _ in 1:n
        move!(robot, side)
    end
end

function move_move_move!(robot, side)
    while isborder(robot, side) == false
        move!(robot, side)
        putmarker!(robot)  
    end
end