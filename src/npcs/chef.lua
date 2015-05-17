-- inculdes
local Prompt = require 'prompt'
local Timer = require 'vendor/timer'
local sound = require 'vendor/TEsound'
local controls = require('inputcontroller').get()
local Gamestate = require 'vendor/gamestate'

return {
  width = 48,
  height = 48, 
  animations = {
    default = {
      'loop',{'1-2,1'},0.20,
    },

  },
  donotfacewhentalking = true,
  talk_items = {
    { ['text']='i am done with you' },
    { ['text']='Who cooked this?' },
    { ['text']='Who is that guy at the table?' },
    { ['text']='Hello!' },
  },
  talk_responses = {
    ["inventory"]={
      "Normerly you would get my food from my wife.",
      "Press {{yellow}}".. string.upper(controls:getKey('INTERACT')) .."{{white}} to view item information.",
    },
    ["Hello!"]={
      "I am the Chef",
    },
    ["How do you make Cat Head soup?"]={
      "The same way you make Butt Soup.",
    },
    ["Princess?"]={
      "My Daughter is named {{red_light}}Princess{{white}}.",
      "After my {{grey}}Father{{white}}.",
    },
  },
  inventory = function(npc, player)
    local screenshot = love.graphics.newImage( love.graphics.newScreenshot() )
    Gamestate.stack("shopping", player, screenshot, "chef_wife")
  end,
}