using HorizonSideRobots

robot = Robot(animate=true)

function search_dot(robot)
    n::Int = 1
    while true
        if pin(robot, n) == 1
            break
        end
        n+=1
    end
end

function pin(robot, n)
    for side in (Nord, Ost, Sud, West, Nord, Nord, Ost)
        if side in (Nord, Ost)
            if moveandcheck!(robot, n, side) == 1
                return 1
            end
        else
            if moveandcheck!(robot, n*2, side) == 1
                return 1
            end
        end
    end
    moveandcheck!(robot, n, Sud)
end

function moveandcheck!(robot, n, side)
    while n != 0
        move!(robot, side)
        if ismarker(robot)
            return 1
        end
        n -= 1
    end
    return 0
end