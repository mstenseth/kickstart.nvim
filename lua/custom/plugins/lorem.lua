return {
  'derektata/lorem.nvim',
  config = function()
    require('lorem').opts {
      sentenceLength = 'medium',
      comma_chance = 0.2,
      max_commas_per_sentence = 2,
    }
  end,
  keys = {
    { '<Leader>li', ':LoremIpsum paragraphs 5<CR><CR>', desc = 'Insert 5 paragraphs' },
  },
}
