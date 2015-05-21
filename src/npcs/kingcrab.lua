-- inculdes
local Prompt = require 'prompt'
local Timer = require 'vendor/timer'
local sound = require 'vendor/TEsound'
local controls = require('inputcontroller').get()
local Gamestate = require 'vendor/gamestate'

return {
  width = 96,
  height = 48, 
  animations = {
    default = {
      'once',{'1,1'},0.20,
    },

  },
  donotfacewhentalking = true,
  talk_items = {
    { ['text']='i am done with you' },
    { ['text']='Who Are You?' },
    { ['text']='What do you Do?' },
    { ['text']='Hello!' },
  },
  talk_responses = {
    ["inventory"]={
      "These Are Things I found around the island.",
      "Press {{yellow}}".. string.upper(controls:getKey('INTERACT')) .."{{white}} to view item information.",
    },
    ["Hello!"]={
      "I am the King Crab.",
    },
    ["Who Are You?"]={
      "I am the King Crab.",
      "I Rule over all the crabs",    },
    ["What do you Do?"]={"I rule all the crabs and i...",   "Scavenge the land.",
   "And...",   "rule over all the crabs.",    },
  },
  inventory = function(npc, player)
    local screenshot = love.graphics.newImage( love.graphics.newScreenshot() )
    Gamestate.stack("shopping", player, screenshot, "kingcrab")
  end,
}