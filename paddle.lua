paddle = Class{}

function paddle:init(x,y,w,h)
    self.x=x
    self.y=y
    self.dy=0
    self.w=w
    self.h=h

end


function paddle:render()
love.graphics.rectangle('fill',self.x,self.y,self.w,self.h)

end



function paddle:update(dt)
    if(self.dy<0) then
self.y = math.max(0,self.y + self.dy * dt )
else
    self.y= math.min(virtualHeight-self.h, self.y + self.dy *dt)
end
end