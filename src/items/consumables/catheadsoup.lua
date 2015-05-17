-- made by Nicko21
return{
  name = "catheadsoup",
  description = "Cat Head Soup",
  type = "consumable",
  info = 'same recipe as butt soup except instead of butts use cat heads',
  MAX_ITEMS = 2,
  width = 24,
  consumable = {
    buff = {
      attribute = "jumpFactor",
      value = 1.5,
      default = 1,
      duration = 15,
      color = {0,145,206,255},
      startMessage = "jump boosted by ",
      startMessageValue = true,
      endMessage = "jump boost expired",
    },
  },
}
