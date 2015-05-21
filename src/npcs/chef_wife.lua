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
      "May I take your order?",
      "Press {{yellow}}".. string.upper(controls:getKey('INTERACT')) .."{{white}} to view item information.",
    },
    ["Hello!"]={
      "Hello, May i take your order?",
    },
    ["Who cooked this?"]={
      "My Husband the Chef.",
    },
    ["Who is that guy at the table?"]={
      "What ever you do not ask him.  He will babble about anything or everything.",
    },
  },
  inventory = function(npc, player)
    local screenshot = love.graphics.newImage( love.graphics.newScreenshot() )
    Gamestate.stack("shopping", player, screenshot, "chef_wife")
  end,
}