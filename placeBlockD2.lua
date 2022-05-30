
function AutoPlace()
    if (turtle.detectDown()) then
        turtle.forward()
    else
        turtle.placeDown()
    end
end

function AutoSwitchForBuilding()
    local selectedSlot = turtle.getSelectedSlot();
    if selectedSlot ~= 1 and turtle.getItemCount(selectedSlot) > 0 then return true end
    for i = 2, 16 do 
        if turtle.getItemCount(selectedSlot) > 0 then
            turtle.select(i) 
            break
        end
    end
    return turtle.getItemCount(turtle.getSelectedSlot()) > 0;
end

function AutoRefuel()
    if turtle.getFuelLevel() > 0 then return true end
    local selectedSlot = turtle.getSelectedSlot();
    for i = 1, 16 do 
        turtle.select(i) 
        if turtle.refuel(0) and turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
            turtle.refuel(1);
            break
        end
    end
    turtle.select(selectedSlot);
    return turtle.getFuelLevel() > 0;

end

turtle.select(1);
while AutoRefuel() and AutoSwitchForBuilding() do
    AutoPlace()
end
