using HorizonSideRobots

robot = Robot(animate = true)

function krest(robot)
    putmarker!(robot)
    n::Integer = 0
    for side1 in (Nord, Sud)
        for side2 in (West, Ost)
            while !isborder(robot, side1) && !isborder(robot, side2)
                move!(robot, side1)
                move!(robot, side2)
                n += 1
                putmarker!(robot)
            end
            move2!(robot, n, side1, side2)
            n = 0
        end
    end
end

function move2!(robot, n, side1, side2)
    while n != 0
        move!(robot, inverse(side1))
        move!(robot, inverse(side2))
        n -= 1
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side)+2)%4)