return {
  'sphamba/smear-cursor.nvim',
  opts = {
    stiffness = 0.8, -- 0.6      [0, 1]
    trailing_stiffness = 0.5, -- 0.4      [0, 1]
    stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    trailing_stiffness_insert_mode = 0.6, -- 0.4      [0, 1]
    distance_stop_animating = 0.5, -- 0.1      > 0
    -- 20% darker than default color #c574dd
    cursor_color = '#ae3ed0',
  },
}
