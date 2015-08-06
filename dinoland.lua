Dinoland = extend(Map)
Dinoland.groundHeight = 100

function Dinoland:init(index)
  self.zones = {}
  self.name = 'dinoland'
  self.index = index

  self.obstacles = {}

  local function makeObstacle(x, y, w, h)
    local obstacle = {}
    obstacle.width, obstacle.height = w, h
    obstacle.body = love.physics.newBody(ctx.world, x, self.height - self.groundHeight - obstacle.height / 2 - y)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)
  end

  if self.index == 1 then
    self.width = 6600
    self.height = 900

    local obstacle = {}
    obstacle.width, obstacle.height = 500, 200
    obstacle.body = love.physics.newBody(ctx.world, 2100, self.height - self.groundHeight - obstacle.height / 2)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)

    obstacle = {}
    obstacle.width, obstacle.height = 1000, 100
    obstacle.body = love.physics.newBody(ctx.world, 1850, self.height - self.groundHeight - obstacle.height / 2)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)

    obstacle = {}
    obstacle.width, obstacle.height = 1000, 100
    obstacle.body = love.physics.newBody(ctx.world, 4000, self.height - self.groundHeight - obstacle.height / 2)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)

    obstacle = {}
    obstacle.width, obstacle.height = 200, 150
    obstacle.body = love.physics.newBody(ctx.world, 4000, self.height - self.groundHeight - obstacle.height / 2 - 100)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)

    obstacle = {}
    obstacle.width, obstacle.height = 200, 300
    obstacle.body = love.physics.newBody(ctx.world, 5100, self.height - self.groundHeight - obstacle.height / 2)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)

    obstacle = {}
    obstacle.width, obstacle.height = 200, 200
    obstacle.body = love.physics.newBody(ctx.world, 4950, self.height - self.groundHeight - obstacle.height / 2)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)

    obstacle = {}
    obstacle.width, obstacle.height = 200, 100
    obstacle.body = love.physics.newBody(ctx.world, 4800, self.height - self.groundHeight - obstacle.height / 2)
    obstacle.shape = love.physics.newRectangleShape(obstacle.width, obstacle.height)
    obstacle.fixture = love.physics.newFixture(obstacle.body, obstacle.shape)
    obstacle.fixture:setCategory(ctx.categories.oneWayPlatform)
    obstacle.body:setUserData(obstacle)
    obstacle.tag = 'platform'
    table.insert(self.obstacles, obstacle)
  elseif self.index == 2 then
    self.width = 5800
    self.height = 900

    makeObstacle(1200, 0, 500, 100)
    makeObstacle(2000, 0, 100, 300)
    makeObstacle(2000, 0, 300, 100)
    makeObstacle(3450, 0, 600, 100)
    makeObstacle(4400, 0, 600, 200)
    makeObstacle(4800, 0, 200, 100)
    makeObstacle(4000, 0, 200, 100)
  end

  Map.init(self)
end

function Dinoland:spawnHuts()
  local function makeBuilding(x, y)
    ctx.buildings:add(Building, {x = x, y = self.height - self.ground.height - y})
  end

  if self.index == 1 then
    ctx.buildings:add(Building, {x = 950, y = self.height - self.ground.height})
    ctx.buildings:add(Building, {x = 2000, y = self.height - self.ground.height - 200})
    ctx.buildings:add(Building, {x = 2200, y = self.height - self.ground.height - 200})
    ctx.buildings:add(Building, {x = 2100, y = self.height - self.ground.height})

    ctx.buildings:add(Building, {x = 2800, y = self.height - self.ground.height})
    ctx.buildings:add(Building, {x = 3000, y = self.height - self.ground.height})
    ctx.buildings:add(Building, {x = 3200, y = self.height - self.ground.height})

    ctx.buildings:add(Building, {x = 3800, y = self.height - self.ground.height - 100})
    ctx.buildings:add(Building, {x = 4200, y = self.height - self.ground.height - 100})

    ctx.buildings:add(Building, {x = 4000, y = self.height - self.ground.height - 250})

    ctx.buildings:add(Building, {x = 5300, y = self.height - self.ground.height})
    ctx.buildings:add(Building, {x = 5400, y = self.height - self.ground.height})
    ctx.buildings:add(Building, {x = 5500, y = self.height - self.ground.height})
    ctx.buildings:add(Building, {x = 5600, y = self.height - self.ground.height})

    for i = 1, 20 do
      ctx.enemies:add(Caveman, {x = 2700 + love.math.random() * 600, y = self.height - self.ground.height})
    end

    for i = 1, 20 do
      ctx.enemies:add(Caveman, {x = 1600 - 150 + love.math.random() * 300, y = self.height - self.ground.height - 200})
    end

    for i = 1, 20 do
      ctx.enemies:add(Caveman, {x = 3500 + love.math.random() * 900, y = self.height - self.ground.height - 150})
    end

    for i = 1, 25 do
      ctx.enemies:add(Caveman, {x = 5100 + love.math.random() * 400, y = self.height - self.ground.height})
    end
  elseif self.index == 2 then
    makeBuilding(1050, 100)
    makeBuilding(1350, 0)
    makeBuilding(1200, 100)

    makeBuilding(2000, 300)

    makeBuilding(2650, 0)

    makeBuilding(3250, 100)
    makeBuilding(3350, 0)
    makeBuilding(3450, 100)
    makeBuilding(3550, 0)
    makeBuilding(3650, 100)

    makeBuilding(4000, 100)
    makeBuilding(4400, 200)
    makeBuilding(4800, 100)

    for i = 1, 20 do
      ctx.enemies:add(Caveman, {x = 1500 + love.math.random() * 300, y = self.height - self.ground.height})
    end

    for i = 1, 10 do
      ctx.enemies:add(Caveman, {x = 1900 + love.math.random() * 200, y = self.height - self.ground.height - 100})
    end

    for i = 1, 20 do
      ctx.enemies:add(Caveman, {x = 2650 + love.math.random() * 400, y = self.height - self.ground.height})
    end

    for i = 1, 20 do
      ctx.enemies:add(Caveman, {x = 4100 + love.math.random() * 600, y = self.height - self.ground.height})
    end

    for i = 1, 20 do
      ctx.enemies:add(Caveman, {x = 4100 + love.math.random() * 600, y = self.height - self.ground.height - 200})
    end
  end
end
