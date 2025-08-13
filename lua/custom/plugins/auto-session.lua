return {
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/projects', '~/Downloads', '/' },
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_use_git_branch = false,
        -- Session lens integration
        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
        post_restore_cmds = {},
      }
    end,
  },
}
