Building = class()

Building.size = 60

function Building:activate()
  self.y = ctx.map.height - ctx.map.ground.height
  self.image = data.media.graphics.dinoland['hut' .. love.math.random(1, 2)]
  self.alpha = 1

  self.personTimer = 6 + love.math.random() * 3
  self.destroyed = false

  self.body = love.physics.newBody(ctx.world, self.x, self.y - self.size / 2, 'dynamic')
  self.shape = love.physics.newRectangleShape(self.size, self.size)
  self.fixture = love.physics.newFixture(self.body, self.shape)

  self.body:setUserData(self)
  self.body:setFixedRotation(true)

  self.fixture:setCategory(ctx.categories.building)
  self.fixture:setMask(ctx.categories.person, ctx.categories.building, ctx.categories.debris)

  self.phlerp = PhysicsInterpolator(self, 'alpha')

  ctx.event:emit('view.register', {object = self})
end

function Building:deactivate()
  self.body:destroy()
  ctx.event:emit('view.unregister', {object = self})
end

function Building:update()
  self.phlerp:update()

  self.personTimer = timer.rot(self.personTimer, function()
    ctx.enemies:add(Caveman, {x = self.x, y = self.y - 20})
    return 6 + love.math.random() * 3
  end)

  if self.destroyed then
    local x, y = self.body:getLinearVelocity()
    if (math.abs(x) < 1 and math.abs(y) < 1) or (math.abs(x) > 2000 and math.abs(y) > 2000) then
      self.alpha = timer.rot(self.alpha)
      if self.alpha < 0 then
        ctx.buildings:remove(self)
      end
    end
  end
end

function Building:draw()
  local g = love.graphics
  local scale = self.size / self.image:getWidth()

  local lerpd = self.phlerp:lerp()
  local x, y = self.body:getPosition()
  local angle = self.body:getAngle()
  g.setColor(255, 255, 255, 255 * math.clamp(lerpd.alpha, 0, 1))
  g.draw(self.image, x, y, angle, scale, scale, self.image:getWidth() / 2, self.image:getHeight() / 2)

  self.phlerp:delerp()
end

function Building:collideWith(other)
  return true
end

function Building:destroy()
  if self.destroyed then return end
  self.destroyed = true
  self.body:setFixedRotation(false)
  self.fixture:setCategory(ctx.categories.debris)
  self.fixture:setFriction(0.25)
  self.body:applyLinearImpulse(-400 + love.math.random() * 800, -800 + love.math.random() * -500)
  self.body:setAngularVelocity(-20 + love.math.random() * 40)
end
