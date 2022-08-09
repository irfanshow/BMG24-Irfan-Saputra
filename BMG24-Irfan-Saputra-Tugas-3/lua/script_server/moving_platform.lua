local moving_platform = {}

local part = nil

local maxPos = Vector3.new(0,0,-5)

local minPOs = Vector3.new(0,0,5)

local intPos = Vector3.new(0,0,0)

local speed = 0.05

local timer = nil

local nextPosition = nil

local intervalVector = nil

local function move()
  local distance = Vector3.Distance(part.WorldPosition,nextPosition)
  
  if distance < 5 then
    local isMinPos = nextPosition == minPOs
    nextPosition = isMinPos and maxPos or minPOs
    
    local direction = nextPosition- part.WorldPosition
    intervalVector = direction.Normalize * speed
    
  else
      part.WorldPosition = part.WorldPosition + intervalVector
  end
  
  
  
  end

function moving_platform:Start(Map)
  part = map.Root:FindFirstChild("moving_platform",true)
  part.WorldPosition = intPos
  
  nextPosition = minPOs
  local direction = nextPosition- part.WorldPosition
  intervalVector = direction.Normalize * speed
  
  timer = Timer.new(1,move)
  timer.Loop = true
  timer:Start()

return moving_platform