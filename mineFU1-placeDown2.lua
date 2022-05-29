turtle.select(1);
local fuel = turtle.getItemCount();
while (fuel > 0) do
    turtle.select(1);
    turtle.refuel();
    fuel = turtle.getItemCount();
    turtle.select(2);
    local idx = turtle.getItemCount();
    while (idx > 0) do
        turtle.placeDown();
        turtle.forward();
        idx = turtle.getItemCount();
    end
end
