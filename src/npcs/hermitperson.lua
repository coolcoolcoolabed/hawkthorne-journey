-- inculdes

return {
  width = 32,
  height = 48,  
  animations = {
    default = {
      'loop',{'1,1','11,1'},.5,
    },
    walking = {
      'loop',{'1,1','2,1','3,1'},.2,
    },
  },

  walking = true,
  walk_speed = 36,
 
  talk_items = {
    { ['text']='i am done with you' },
    { ['text']='What are you carrying?'},
    { ['text']='Hello!' },
    { ['text']='What is this place?', ['option'] ={
        { ['text']='Where is he?', ['option']={
            { ['text']='I will Find him'},
            { ['text']='Seems too hard'},
            { ['text']='I will think about it'},
            { ['text']='How do you know'},
             }},
        { ['text']='He can not die' },
        { ['text']='Lets find him?' },
        { ['text']='Get this town together!'},
    }},
  },

  talk_responses = {
    ["Hello!"]={
      "Wow a Stranger!,",
      "I haven't met anyone new in a long time.",
    },
    ["What is this place?"]={
      "This is our town,",
      "We Were forced to hide up here when those Crabs Attacked.",      "I Hear There is a crab King That Rules over the crabs.",

    },
    ["What are you carrying?"]={
      "It's a Rock.",      " My Wife and I Mine it's a very important Job.",
      "My Wife is in the mine right now.",
    },
    ["Where is he?"]={
      "I hear he hides in a hole somewhere in the jungle",

    },
    ["He can not die"]={
      "He hasn't yet at least!",
    },
    ["Lets find him?"]={
      "I have a good job",
      "I can't just pack up and leave",
      "I am making money to support my family",
    },
    ["Get this town together!"]={
      "That is rude, I am working very hard.",
      "But I forgive you.",
    },
    ["I will Find him"]={
      "Good luck just know",
      "It won't be easy",
    },
    ["Seems too hard"]={
      "True",
      "He might not even exist?",
    },
    ["I will think about it"]={
      "Think hard",
    },
    ["How do you know"]={
      "I saw him",

    },
  },
}