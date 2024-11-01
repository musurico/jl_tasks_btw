using HorizonSideRobots

robot = Robot(animate = true)

reverse_side(side::HorizonSide) = HorizonSide((Int(side) + 2) % 4)

ccwise_side(side::HorizonSide) = HorizonSide((Int(side) + 1) % 4)

function LeftDown(robot)
    moves_left, moves_down = 0, 0
    data = [moves_left, moves_down]
    side = West
    for i in 1:2
        while !isborder(robot, side)
            move!(robot, side)
            data[i] += 1
        end
        side = ccwise_side(side)
    end
    return data
end

function moveToBorder(robot, side)
    while !isborder(robot, side)
        move!(robot, side)
    end
end


function moveSteps!(robot, steps, side)
    for _ in 1:steps
        move!(robot, side)
    end
end


function sepr(robot)
    side = Ost
    sql_count = 0
    sql_count_bk = 0
    count = 0

    initial_moves = LeftDown(robot)

    while !isborder(robot, side) && !isborder(robot, Nord)
        while !isborder(robot, side)
            move!(robot, side)
            if isborder(robot, Nord)
                sql_count += 1
                sql_count_bk = 0
            else
                sql_count_bk += 1
                if sql_count_bk > 1 && sql_count != 0
                    sql_count = 0
                    sql_count_bk = 0
                    count += 1
                end
            end
        end
        move!(robot, Nord)
        side = reverse_side(side)
    end

    moveToBorder(robot, Sud)
    moveSteps!(robot, initial_moves[2], Nord)
    moveSteps!(robot, initial_moves[1], Ost)
    println(count)
end
