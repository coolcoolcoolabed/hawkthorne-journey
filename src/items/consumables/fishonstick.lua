-- made by Nicko21
return{
  name = "fishongstick",
  description = "Fish-on-stick",
  type = "consumable",
  info = '"Is it the guy who looks a little like Vince Vaughn but smells a lot like fish?."',
  MAX_ITEMS = 1,
  width = 24,
  consumable = {
    heal = "max",
    buff = {
      attribute = "invulnerable",
      value = true,
      default = false,
      duration = 5,
      startMessage = "invulnerability activated",
      endMessage = "invulnerability expired",
    },
  },
}
