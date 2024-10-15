using HorizonSideRobots

robot = Robot(animate=true)

function search(robot)
    i = 1
    while isborder(robot, Nord)
        move!(robot, Ost)
        if isborder(robot, Nord)
            move!(robot, Ost)
            if isborder(robot, Nord)
                move!(robot, Ost)
            else
                break
            end
        else
            break
        end
        if !isborder(robot, Nord)
            return 1
            print("ggfg")
        else
            i += 1
        end
    end 
end