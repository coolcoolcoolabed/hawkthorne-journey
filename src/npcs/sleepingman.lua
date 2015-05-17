local Prompt = require 'prompt'
local Timer = require 'vendor/timer'
local sound = require 'vendor/TEsound'
local Gamestate = require 'vendor/gamestate'

return {
  width = 48,
  height = 48,  
  greeting = 'Hey what ya know.  Someone new.', 
  animations = {
    default = {
      'loop',{'1-2,1'},0.60,
    },
    startled = {
    'once',{'1,2','2,2'},0.50,
    },
    talking = {
      'loop',{'1,3','1,3','1,3','1,3','2,3'},0.5,
    }
  },

  donotfacewhentalking = true,

  begin = function(npc, player)
    npc.state = "startled"
    Timer.add(1,function()
      npc.state = "talking"
    end)
  end,
  finish = function(npc, player)
    npc.state = "default"
  end,

  talk_items = {
    { ['text']='i am done with you' },
    { ['text']='Any useful info for me?' },
    { ['text']='Who?' },
    { ['text']='Hello!' },
  },
  talk_responses = {
    ["Hello!"]={
      "Careful, WAS THAT HIM!",
    },
    ["Who?"]={
      "The Crazy Hermit man. he wants to kill me.",
    },
    ["Any useful info for me?"]={
      "Be careful, the sky will fall!",
      "You will need to have a fortress of babies to protect yourself.",
    },
  },
}