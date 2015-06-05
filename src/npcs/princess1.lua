return {
  width = 32,
  height = 48,
  greeting = 'Hello, i am {{red_light}}princess{{white}}!',    
  animations = {
    default = {
      'loop',{'1,1','11,1'},.5,
    },
    walking = {
      'loop',{'1,1','2,1','3,1'},.2,
    },
    undress = {
      'once',{'2-3,1'},.25,
    },

  },
  talk_items = {
    { ['text']='i am done with you' },

    { ['text']='Your name is princess?' },
    { ['text']='Hello!' },
    { ['text']='Any useful info for me?', ['option']={
      { ['text']='Dig Areas?' },
      { ['text']='Town guard?' },


      { ['text']='King Crab?', freeze = true },      { ['text']='Bull testicles?' },      { ['text']='Russell Borchert?' },
      { ['text']='Stalagmites?' },
      { ['text']='the chef?' },

      { ['text']='Staff Only Key?' },
      { ['text']='Cave Keys?' },
      { ['text']='The Guide Family?' },    }},
  },
  talk_commands = {
    ['King Crab?']= function (npc, player)
      Quest:activate(npc, player, quests.monkeydoll)
    end,
    ['for your hand']=function(npc, player)
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
  tickImage = love.graphics.newImage('images/npc/hilda_heart.png'),}