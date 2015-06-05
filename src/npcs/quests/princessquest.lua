-- princessquest.lua
 
local quests = {
  monkeydoll = {
    infinite = true,
    questName = 'Find monkey doll',
    questParent = 'princess',
    collect = {name = 'monkeydoll', type = 'material'},
    --prompt: 'King Crab'
    giveQuestSucceed = {
      "The King crab scavenges the abandoned village.",
      "I left my childhood doll in my house the {{blue_light}}King crab{{white}} Might have stolen it.",
      "My Father Dosent believe me.",
    },
    successPrompt = "Can you help me find my monkey doll?",
    completeQuestFail = "If you can't find it in my house the {{blue_light}}King crab{{white}} must have stolen it!",
    completeQuestSucceed = "Oh my goodness, You Found my childhood doll!  I Could Marry You right now!",
    reward = {affection = 1000},
  },
}

return quests
