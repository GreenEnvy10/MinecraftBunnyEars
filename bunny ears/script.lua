local acc = models.model.root.Headband
acc:setParentType("Head")
acc:setPivot(0, 24, 0)
acc:setPos( xOffset, yOffset, zOffset )
local mainPage = action_wheel:newPage()
action_wheel:setPage(mainPage)

function events.tick()
     local crouching = player:getPose() == "CROUCHING"
     -- This is the same line of code from the previous model
     local walking = player:getVelocity().xz:length() > .01
     -- walking == true when moving, and walking == false when still (or going directly up/down as we excluded the y axis)
     local sprinting = player:isSprinting()
     -- If you want to find more player functions, check out the Player Global page

     -- Now we're going to use a lot of logic to figure out when animations should/shouldn't play
     animations.model.idle:setPlaying(not walking and not crouching)
     -- You're idle when not walking and not crouching
     animations.model.walk:setPlaying(walking and not crouching and not sprinting)
     -- You're walking when... walking and not crouching, but you want to make sure you're not sprinting either
     animations.model.sprint:setPlaying(sprinting and not crouching)
     -- You probably can catch my drift by now
     animations.model.crouch:setPlaying(crouching)
end