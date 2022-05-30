-- fuel for 1
turtle.select(1);
while AutoRefuel() and AutoSwitchForBuilding() do
    AutoPlace()
end

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
    for i = 2, 16 do -- loop through the slots
        if turtle.getItemCount(selectedSlot) > 0 then
            turtle.select(i) -- change to the slot
            break
        end
    end
    return turtle.getItemCount(turtle.getSelectedSlot()) > 0;
end

function AutoRefuel()
    if turtle.getFuelLevel() > 0 then return true end
    local selectedSlot = turtle.getSelectedSlot();
    for i = 1, 16 do -- loop through the slots
        turtle.select(i) -- change to the slot
        if turtle.refuel(0) and turtle.getFuelLevel() ~= "unlimited" and turtle.getFuelLevel() < 1 then
            turtle.refuel(1);
            break
        end
    end
    turtle.select(selectedSlot);
    return turtle.getFuelLevel() > 0;

end
