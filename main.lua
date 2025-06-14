virtualWidth = 432
virtualHeight = 233
windowHeight = 732 
windowWidth= 1280
Class = require 'class'
Push = require 'push'
require 'paddle'
require 'ball'
radius = 5
paddleSpeed = 240
gameState= 'start'

function love.resize(w,h)
  push.resize(w,h)
end


function love.load()
    love.window.setTitle("T-T")
    sounds = {

        
        
        ['p-hit']= love.audio.newSource('sounds/paddle-hit.wav', 'static'),
        ['score'] = love.audio.newSource('sounds/score.wav','static'),
        ['walhit'] = love.audio.newSource('sounds/wallhit.wav','static'),
        ['victory'] = love.audio.newSource('sounds/victory.mp3','static')
    }
    love.graphics.setDefaultFilter('nearest', 'nearest')
    headingfont = love.graphics.newFont("sunglassfont2.otf",20)
    scorefont = love.graphics.newFont("scorefont.ttf",40)
    heading2font = love.graphics.newFont("pressenterfont.otf",15)
    paddle2 = paddle(virtualWidth - 10 , virtualHeight -30 , 5,20)
    paddle1 = paddle(0,50,5,20)
    ballcenter = ball(virtualWidth/2-2 , virtualHeight/2-2 , 6,6)
    servingplayer=1
    paddle1score=0
    paddle2score=0
        
    Push:setupScreen(virtualWidth,virtualHeight,windowWidth,windowHeight,{resizable=true, vsync=true,fullscreen=false})

end

function love.update(dt) 
        --p1 movement
    if love.keyboard.isDown('w') then
        paddle1.dy = -paddleSpeed
    
     elseif love.keyboard.isDown('s') then 
        paddle1.dy = paddleSpeed
        else 
        paddle1.dy = 0  
    end

    -- p2 movement
    if love.keyboard.isDown('up') then
        paddle2.dy = -paddleSpeed
        elseif love.keyboard.isDown('down') then 
        paddle2.dy = paddleSpeed
        else 
        paddle2.dy = 0  

    end
            -- game centric play paddle collision login
    if(gameState =='serve') then
                if(servingplayer == 1) then 
                        ballcenter.dx= -math.random(100,200)
                        ballcenter.dy = math.random(-50,50)
                    else
                    ballcenter.dx= math.random(100,200)
                    ballcenter.dy = math.random(-50,50)


                end
 
              elseif(gameState == 'play') then

                                            --p1 collision
                    if(ballcenter:collision(paddle1)) then
                            ballcenter.dx = -ballcenter.dx * 1.03
                            ballcenter.x = paddle1.x + 4 
                        sounds['p-hit']:play()


                                -- random y in between playing
                        if(ballcenter.dy<0 ) then
                            ballcenter.dy = -math.random(10,150)
                            else
                            ballcenter.dy= math.random(10,150)
                        end

                                            --p2 collision

                        elseif(ballcenter:collision(paddle2)) then
                            ballcenter.dx = -ballcenter.dx * 1.03
                            ballcenter.x = paddle2.x - 4
                        sounds['p-hit']:play()
                                -- random y in between playing
                            if(ballcenter.dy>0) then
                            ballcenter.dy = -math.random(100,200)
                            else
                            ballcenter.dy =math.random(100,200)
                        end

                
                    end
    end

    -- ballcenter  and paddle update and wall collisions 
    if gameState == 'play' then   
        
        


          -- -Y axis collision[]topcollision 
           if ballcenter.y <=0 then
                ball.y= 0
                ballcenter.dy = -ballcenter.dy
             elseif ballcenter.y >= virtualHeight -6 then 
                ballcenter.y = virtualHeight-6
                ballcenter.dy = -ballcenter.dy
           end
   
          --x X axis collision
            if ballcenter.x < 0 then
                servingplayer =2
                paddle2score = paddle2score+1
                    if(paddle2score==3) then
                        winingplayer = 2
                        sounds['victory']:play()
                        gameState='done'
                    else gameState='serve'
                        ballcenter:reset()
                    end
                    sounds['score']:play()
                    
                elseif  ballcenter.x > virtualWidth then
                    servingplayer = 1
                    paddle1score= paddle1score+1
                    sounds['score']:play()
                    if(paddle1score==10) then 
                        winingplayer = 1
                        sounds['victory']:play()

                        gameState='done'
                    else gameState='serve'
                        ballcenter:reset()

                    end
                    sounds['score']:play()

            end
        

     ballcenter:update(dt)
    end
          -- paddle run 
      paddle1:update(dt)
      paddle2:update(dt)

end  -- end of update(dt) fxxxxxxxx

function love.keypressed(key)

    if key  =='escape' then
      love.event.quit()
        elseif key == "return" or key== "enter" then
          if gameState =='start' then
              gameState = 'serve'
            elseif key == "return" or key== "enter" then
               if gameState =='serve' then 
                 gameState = 'play'
                  else
                    ballcenter:reset()
                    gameState ='start'  
                end
             
     end
    end
end  --end of keypressed(🔑) fxxxx

function love.draw() 


    Push:apply('start')
    -- love.graphics.clear(0,0,50/255,1)

  ----- rendering texts
  love.graphics.clear(0,30/255,55/255,1)
  love.graphics.setFont(scorefont)
  love.graphics.print(tostring(paddle1score), virtualWidth /2 - 40  , virtualHeight /2 -15)
  love.graphics.print(tostring(paddle2score), virtualWidth /2 + 40, virtualHeight /2 -15)



  if(gameState == 'start') then 
    paddle1score=0
    paddle2score=0
   love.graphics.setFont(headingfont)

        love.graphics.printf('Table - Tennis' , 0 , 0 ,virtualWidth, "center")
        love.graphics.setFont(heading2font)
        love.graphics.printf('Press Enter ' , 0 , 20 ,virtualWidth, "center")


 end 

 if (gameState == 'serve') then
        love.graphics.setFont(heading2font)

    love.graphics.printf('Welcome to Serve State' , 0 , 0 ,virtualWidth, "center")
    love.graphics.printf('Player '  ..tostring(servingplayer) .. "'s serve" , 0 , 20 ,virtualWidth, "center")

 end

 if(gameState =='done') then  
     love.graphics.printf(" 🏆winner is player  " .. tostring(winingplayer) , 0, 10 , virtualWidth , 'center')
     love.graphics.setFont(headingfont)
     love.graphics.printf("PRESS  R TO RESTART GAME"  , 0, virtualHeight -20 , virtualWidth , 'center')
     
       
 end

  if (gameState == 'play') then
    love.graphics.setFont(headingfont)
    if(paddle1score==9) then
    
       love.graphics .print("MatchPoint",virtualWidth /2 -50 , virtualHeight /2 - 60)
      elseif(paddle2score==9) then 
         love.graphics .print("MatchPoint" , virtualWidth /2 -50 ,virtualHeight / 2 -60)
      end
   end
                    
                    
  ----- rendering texts

  

    -- rendering rects 
            paddle1:render()
            paddle2:render()
            love.graphics.setColor(1,0,0,1)
            ballcenter:render()
    --renderign rects        
        Push:apply('end')
end

   