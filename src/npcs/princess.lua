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


      { ['text']='King Crab?' },      { ['text']='Bull testicles?' },      { ['text']='Gay Gold?' },
      { ['text']='Stalagmites?' },
      { ['text']='the chef?' },

      { ['text']='Staff Only Key?' },
      { ['text']='Cave Keys?' },
      { ['text']='The Guide Family?' },    }},
  },
  talk_responses = {
    ["Hello!"]={
      "Hello."
    },
    ["Your name is princess?"]={
      "yes my father the chef named me",
      "after my grandfather.",
    },
    ["Dig Areas?"]={
      "My Father has a journal i read.",
      "it said there are some places with soft enough soil to dig with your bare hands.",


      "some where in the forest.",


      "parts in the valley of laziness.",


      "Beside a Shrub in the jungle.",


      "and by the area the giant crab hangs out.",    },
    ["Town guard?"]={
      "i dont know much about him."
    },


    ["King Crab?"]={
      "I Think the crab stole some stuff from us but my dad does not believe me."
    },
    ["Bull testicles?"]={
      "My Father Collects Them.",
      "and offers them.",
    },
    ["Gay Gold?"]={
      "Hey i dont know anything about that."
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
    ["Cave Keys?"]={
      "The miners keep the key in the deadbodys pockets."
    },
    ["The Guide Family?"]={
      "Mr Guide has three sons and a daughter.",
      "his sons are around the town.",      "his daughter Grettel married Mr Miner.",      "They have a room at the towerblock but they spend most of there time at the mine.",
    },







  },
  tickImage = love.graphics.newImage('images/npc/hilda_heart.png'),}