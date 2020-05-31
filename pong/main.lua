SCREEN_WIDTH=1280
SCREEN_HEIGHT=720


VIRTUAL_WIDTH=432
VIRTUAL_HEIGHT=243
PADDLE_SPEED=200

push= require 'push'

Class=require 'class'


require 'Ball'
require 'Paddle'
function love.load()
    love.window.setTitle("Pong")

    math.randomseed(os.time())
    player1Score=0
    player2Score=0

    paddle1=Paddle(10,20,5,20)
    paddle2=Paddle(VIRTUAL_WIDTH-20,VIRTUAL_HEIGHT-40,5,20)

    ball=Ball(VIRTUAL_WIDTH/2-2,VIRTUAL_HEIGHT/2-2,4,4)
    
    gameState="start"

    smallFont=love.graphics.newFont('CupertinoIcons.ttf',10)   
    scoreFont=love.graphics.newFont('CupertinoIcons.ttf',32)

   -- love.graphics.setFont(smallFont)
    love.graphics.setDefaultFilter('nearest','nearest')
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,SCREEN_WIDTH,SCREEN_HEIGHT,{
        fullscreen=false,
        vsync=true,
        resizable=false
    })
end

function love.draw()    
    push:apply("start")
        love.graphics.clear(40/255,45/255,52/255,1)

        love.graphics.print(player1Score,VIRTUAL_WIDTH/2-50,VIRTUAL_HEIGHT/3)
        love.graphics.print(player2Score,VIRTUAL_WIDTH/2+30,VIRTUAL_HEIGHT/3)

        paddle1:render()
        paddle2:render()
        ball:render()
        displayFPS()
        displayHint()
    push:apply("end")
end


function love.update(dt)
  if gameState=="play" then

    --Score Setter
        if ball.x<0 then
            player2Score= player2Score+1  
            ball:reset()
            gameState="start"

        elseif ball.x>VIRTUAL_WIDTH-4 then
            player1Score=player1Score+1 
            ball:reset()
            gameState="start"
        end

    --Collision Detection
        if ball:collide(paddle1) or ball:collide(paddle2) then  
            ball.dx=-ball.dx
        end  
        
        if ball.y<=0  then
            ball.dy=-ball.dy
            ball.y=0
        end

        if ball.y>=VIRTUAL_HEIGHT-4 then
            ball.dy=-ball.dy
            ball.y=VIRTUAL_HEIGHT-4
        end

        ball:update(dt)

    end

    --Game Controls 
       if love.keyboard.isDown('w') then
        paddle1.dy=-PADDLE_SPEED
    elseif
        love.keyboard.isDown('s') then
        paddle1.dy=PADDLE_SPEED
    else
        paddle1.dy=0
    end

    if love.keyboard.isDown('up') then
        paddle2.dy=-PADDLE_SPEED    
    elseif love.keyboard.isDown('down') then
        paddle2.dy=PADDLE_SPEED
    else
        paddle2.dy=0
    end
   
    paddle1:update(dt)
    paddle2:update(dt)
    

end



function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    elseif key=="enter" or key=="return" then
        if gameState=="start" then
            gameState="play"
        else
        gameState="start"
        end
    end
end

function displayFPS()
    love.graphics.setColor(0,1,0,1)
    love.graphics.print("FPS: "..tostring(love.timer.getFPS()),20,0)
    love.graphics.setColor(1,1,1,1)
end

function displayHint()
    if gameState=="start" then
        love.graphics.print("Welcome to Pong!",40,10)
        love.graphics.print("Press Enter to Play",40,30)        
        love.graphics.print("Player 1 is controlled by W and S.",40,50)
        love.graphics.print("Player 2 is controlled by UP and DOWN.",40,70)
    end
end