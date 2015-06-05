-- inculdes
local sound = require 'vendor/TEsound'
local Timer = require('vendor/timer')
local tween = require 'vendor/tween'
local character = require 'character'
local Gamestate = require 'vendor/gamestate'
local utils = require 'utils'
local anim8 = require 'vendor/anim8'
local Dialog = require 'dialog'
local prompt = require 'prompt'
local controls = require('inputcontroller').get()
local Emotion = require 'nodes/emotion'
local Quest = require 'quest'
local quests = require 'npcs/quests/princessquest'

return {
  width = 32,
  height = 48,
  run_offsets = {{x=700, y=0}, {x=620, y=0}},
  greeting = 'Hello, i am {{red_light}}princess{{white}}!',
  animations = {
    default = {
      'loop',{'1,1','11,1'},.5,
    },
    walking = {
      'loop',{'1,1','2,1','3,1'},.2,
    },
    sleeping = {
      'once',{'8,1','7,3','7,3'},.2,
    },
    spacetimerpg = {
      'once',{'7-10,4','10,4'},.2,
    },
    birth = {
      'once',{'9-11,1'},.5,
    },
    dancing = {
      'loop',{'9-11,1', '9-11,1','9-11,2', '9-11,2', '7-8,1', '8,2', '7-8,1', '8,2'},.15,
    },
    undress = {
      'once',{'1,1','1,3','2,3','3,3','4,3','3,3','2,3','1,3'},.25,
    },
    fight = {
      'once',{'1,1','12,1'},.35,
    },
    crying = {
      'loop',{'4,1','5,1','6,1'},.25,
    },
    yelling = {
      'loop',{'5,3','6,3'}, 0.5,
    },
    sad = {
      'loop',{'5,3','6,3'}, 0.5,
    }
  },
  walking = true,
  talk_items = {
  { ['text']='i am done with you' },
  { ['text']='Hello!' },
  { ['text']='Any useful info for me?', ['option']={
    { ['text']='more...', ['option']={
      { ['text']='Dig Areas?' },
      { ['text']='Town guard?' },
      { ['text']='Bull testicles?' },
      { ['text']='Russell Borchert?' },
      { ['text']='Stalagmites?' },
      { ['text']='the chef?' },
      { ['text']='Staff Only Key?' },
      { ['text']='Cave Keys?' },
      { ['text']='The Guide Family?' },
    }},
    { ['text']='flowers', freeze = true },
    { ['text']='King Crab', freeze = true },
    { ['text']='Marrying you', freeze = true},
  }},
  { ['text']='stand aside' },
  },
  talk_commands = {
    ['King Crab'] = function (npc, player)
      Quest:activate(npc, player, quests.monkeydoll)
    end,
    ['Marrying you']=function(npc, player)
      local affection = player.affection.princess or 0
      npc.walking = false
      npc.stare = false
      if affection < 1000 and player.married == false then
        Dialog.new("I cannot marry someone whom I do not truly love and trust.  My current affection for you is " .. affection .. ".", function()
          npc.walking = true
          npc.menu:close(player)
        end)
      elseif player.married and not player.married == 'princess' then
        sound.playSfx( "dbl_beep" )
        Dialog.new("How dare you! You're already married!", function ()
          npc.walking = true
          Dialog.currentDialog = nil
          npc.menu:close(player)
        end)

      elseif player.married == 'princess' then
        Dialog.new("I live in the village.  I love {{orange}}" .. player.character.name .. "{{white}}." , function()
          npc.walking = true
          Dialog.currentDialog = nil
          npc.menu:close(player)
        end)
      elseif affection >= 1000 and not player.married then
        npc.walking = false
        npc.stare = false
        sound.playSfx( "dbl_beep" )
        Dialog.new("Yes yes a thousand times yes! We will have so many adorable babies together.", function()
          npc.emotion = Emotion.new(npc, "love")
          player.married = 'princess'
          npc.walking = true
          npc.menu:close(player)
        end)
      end
    end,
  },
  talk_responses = {
    ["Hello!"]={
      "Hello."
    },
    ['stand aside']={
      "I'm sorry to see you go.",
    },
    ["Your name is princess?"]={
      "Yes, my father the chef named me",
      "After my grandfather.",
    },
    ["Dig Areas?"]={
      "My Father has a journal i read.",
      "It said there are some places with soft enough soil to dig with your bare hands.",


      "Somewhere in the forest.",


      "Parts in the valley of laziness.",


      "Beside a Shrub in the abandoned village.",    },
    ["Town guard?"]={
      "I don't know much about him."
    },
    ["Bull testicles?"]={
      "My Father Collects Them.",
      "And offers them.",
    },
    ["Russell Borchert?"]={
      " computer genius, anti-deodorant activist,",
      "and millionaire.",
      "He was rich for having invented the 9-track cassette, which the 8-track industry paid to keep quiet",
      "He funneled that wealth into a computer school called Greendale,",
      "where he obsessively pursued a new project, a machine that can process feelings.",
      "He apparently used nothing but gold to assemble his circuitry,",
      " believing it to be a better conductor of human emotion.",
      "It was a weird time.",
    },
    ["Stalagmites?"]={
      "They form as water drips from the cave roof.",
      "Some big ones you can Grab onto and climb.",    },
    ["the chef?"]={
      "My Father is the chef.",
      "He refuses to clean his kitchen.",    },
    ["Staff Only Key?"]={
      "My parents keep it hidden under the third table at the eatery."
    },


    ["King Crab?"]={
      "I Think the crab stole some stuff from us but my dad does not believe me."
    },
    ["Cave Keys?"]={
      "The miners keep the key in the deadbodys pockets."
    },
    ["The Guide Family?"]={
      "Mr Guide has three sons and a daughter.",
      "His sons are around the town.",      "his daughter Grettel married Mr Miner.",      "They have a room at the towerblock but they spend most of there time at the mine.",
    },
  },
  tickImage = love.graphics.newImage('images/npc/hilda_heart.png'),
  command_items = {
    { ['text']='more', ['option']={
      { ['text']='custom', ['option']={
        { ['text']='more', ['option']={
          { ['text']='more', ['option']={
            { ['text']='more'},
            { ['text']='make baby', freeze = true},
            { ['text']='spacetime rpg'},
            { ['text']='handshake'},
            },},
          { ['text']='hug'},
          { ['text']='kickpunch', freeze = true},
          { ['text']='undress', freeze = true},
          },},
        { ['text']='repair'},
        { ['text']='defend'},
        { ['text']='fight', freeze = true},
        },},
      { ['text']='dance', freeze = true },
      { ['text']='rest'},
      { ['text']='heal'},
      },},
    { ['text']='go home' },
    { ['text']='stay' },
    { ['text']='follow' },
  },
  command_commands = {
    ['follow']=function(npc, player)
      npc.walking = true
      npc.stare = true
      npc.minx = npc.maxx
    end,
    ['stay']=function(npc, player)
      npc.walking = false
      npc.stare = false
    end,
    ['go home']=function(npc, player)
      npc.walking = true
      npc.stare = false
      npc.minx = npc.maxx - (npc.props.max_walk or 48)*2
    end,
    ['heal']=function(npc, player)
      player.health = player.max_health
      sound.playSfx( "healing_quiet" )
      npc:affectionUpdate(100)
      player:affectionUpdate('princess',100)
    end,
    ['rest']=function(npc, player)
      npc.walking = false
      npc.stare = false
      npc.state = "sleeping"
      npc.busy = true
      npc:affectionUpdate(100)
      player:affectionUpdate('princess',100)
    end,
    ['dance']=function(npc, player)
      npc.walking = false
      npc.stare = false
      npc.state = "dancing"
      npc.busy = true
      Timer.add(5, function()
        npc.state = "walking"
        npc.busy = false
        npc.walking = true
        npc:affectionUpdate(10)
        player:affectionUpdate('princess',10)
        npc.menu:close(player)
      end)
    end,
    ['fight']=function(npc, player)
      npc.walking = false
      npc.state = 'fight'
      npc.busy = true
      player:hurt(5)
      Timer.add(.5, function()
        npc.state = "walking"
        npc.busy = false
        npc.walking = true
        npc:affectionUpdate(-50)
        player:affectionUpdate('princess',-50)
        npc.menu:close(player)
      end)
    end,
    ['defend']=function(npc, player)
      sound.playSfx( "dbl_beep" )
    end,
    ['repair']=function(npc, player)
      sound.playSfx( "dbl_beep" )
    end,
    ['undress']=function(npc, player)
      npc.walking = false
      npc.state = "undress"
      npc.busy = true
      Timer.add(2, function()
        npc.state = "walking"
        npc.busy = false
        npc.walking = true
        npc:affectionUpdate(10)
        player:affectionUpdate('princess',10)
        npc.menu:close(player)
      end)
    end,
    ['kickpunch']=function(npc, player)
      npc.walking = false
      npc.stare = false
      npc.prompt = prompt.new("Do you want to learn to kickpunch?", function(result)
        if result == 'Yes' then
          player.canSlideAttack = true
          Dialog.new("To kickpunch run forward then press {{yellow}}".. string.upper(controls:getKey('DOWN')) .."{{white}} then {{yellow}}".. string.upper(controls:getKey('ATTACK')) .."{{white}}.", function()
            Dialog.currentDialog = nil
            npc.menu:close(player)
          end)
          npc.walking = true
        end
        if result == 'No/Unlearn' then
          player.canSlideAttack = false
          npc.walking = true
        end
        npc.fixed = result == 'Yes'
        Timer.add(2, function() npc.fixed = false end)
        npc.prompt = nil
        npc.walking = true
        npc.menu:close(player)
      end)
    end,
    ['hug']=function(npc, player)
      sound.playSfx( "dbl_beep" )
    end,
    ['handshake']=function(npc, player)
      sound.playSfx( "dbl_beep" )
    end,
    ['spacetime rpg']=function(npc, player)
      npc.walking = false
      npc.stare = false
      npc.state = "spacetimerpg"
      npc.busy = true
      npc:affectionUpdate(250)
      player:affectionUpdate('princess',250)
    end,
    ['make baby']=function(npc, player)
      npc.walking = false
      npc.stare = false
      if player.married == 'princess' then
        npc.state = "birth"
        npc.busy = true
        Timer.add(.5, function()
          npc.walking = true
          npc.state = "walking"
          npc.busy = false
          local NodeClass = require('nodes/npc')
          local node = {
            type = 'npc',
            name = 'babyprincess',
            x = npc.position.x + npc.width/2 - 12,
            y = 240,
            width = 32,
            height = 25,
            properties = {}
            }
          local spawnedNode = NodeClass.new(node, npc.collider)
          local level = Gamestate.currentState()
          level:addNode(spawnedNode)
          npc.menu:close(player)
        end)
      elseif player.married and not player.married == 'princess' then
        sound.playSfx( "dbl_beep" )
        Dialog.new("How dare you!  You're already married!", function()
          npc.walking = true
          Dialog.currentDialog = nil
          npc.menu:close(player)
        end)
      else
        sound.playSfx( "dbl_beep" )
        Dialog.new("I would never have a child with someone I wasn't married to!", function()
          npc.walking = true
          Dialog.currentDialog = nil
          npc.menu:close(player)
        end)
      end
    end,
  },
  update = function(dt, npc, player)
    -- If Hilda is yelling and in a panic
    -- she is running to the blacksmith
    if npc.state == 'yelling' then
      npc:run(dt, player)
    end

    if npc.state == 'sad' then
      npc:walk(dt)
    end
  end,
}
