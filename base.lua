local controller = peripheral.find("arController")

if controller == nil then error("arController not found") end

local function update()
    local timer = os.startTimer(1)
    local event, id
    repeat
      event, id = os.pullEvent("timer")
    until id == timer
    controller.clear()
    controller.drawRightboundString(os.date(), -10, 10, 0xffffff)
end
