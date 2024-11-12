using HorizonSideRobots

robot = Robot(animate = true)

inverse(side::HorizonSide) = HorizonSide((Int(side)+2)%4)

function cross!(robot)
    for side in (Nord, Ost, Sud, West)
    num_steps = mark!(robot, side)
    side = inverse(side)
    move!(robot, side, num_steps)
    end
end

function HorizonSideRobots.move!(robot, side, num_steps::Integer)
    for _ in 1:num_steps
        move!(robot, side)
    end
end

function mark!(robot, side)::Int
    n = 0
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
        n += 1
    end
    return n
end