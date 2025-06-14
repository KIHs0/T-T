ball= Class{}

function ball:init(x,y,w,h)
    self.x= x
    self.y=y
    self.w=w
    self.h=h
self.dx =math.random(2) ==1 and 100 or -100 
self.dy=math.random(-50,50)
end
function ball:render()
love.graphics.circle('fill',self.x+radius,self.y, self.w-2*radius,self.h)

end
function ball:update(dt)

self.x = self.x + self.dx * dt
self.y = self.y + self.dy * dt
end


function ball:reset()
self.x= virtualWidth /2 -2
self.y = virtualHeight /2 -2

end

function ball:collision(p)
if(self.x > p.x+p.w )or(p.x> self.x+self.w) then return false
end
if(self.y > p.y+p.h )or(p.y> self.y+self.h) then return false


end
    return true

end