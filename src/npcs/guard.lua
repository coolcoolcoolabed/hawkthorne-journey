-- inculdes

return {
  width = 32,
  height = 48,   
  greeting = 'I Am The guard, I became the guard to protect this {{olive}}village{{white}} from Crabs.',
  animations = {
    default = {
      'loop',{'1,1','11,1'},.5,
    },
    walking = {
      'loop',{'1,1','2,1','3,1'},.2,
    },
  },

  stare = true,

  talk_items = {
    { ['text']='i am done with you' },
    { ['text']='How many survived?' },
    { ['text']='What is this Place?' },
    { ['text']='Hello!' },
  },
  talk_responses = {
    ["Hello!"]={
      "A stranger! I Didn't think that anyone could get passed the Crabs.",
      "Everyone will be happy to meet you, These People haven't met Anyone new For a Long time.",
    },
    ["What is this Place?"]={
      "It's the {{grey}}Crabs{{white}}! We all used to live on Gay Island But then these crabs came.",
      " Most of us died Except those who are here now.",
  "We have to hide in this cave I Keep everyone safe from those crabs.",
    },
    ["How many survived?"]={
      "I don't know, most of us died.",
      "Starvation. Disease. When Those Crabs came they Distroyed our Village.",
      "They forced us to hide up here no one has ever got passed them here.",      "I think Hawkthorne Quarantined The entire Jungle.",

    },
  },
}