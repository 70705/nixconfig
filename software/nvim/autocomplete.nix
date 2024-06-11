{
  # Stolen code from https://github.com/jemaw/nixvim-config/blob/main/config/plugins/autocomplete.nix. Thanks!
  extraConfigLua = ''
    has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

  '';
  plugins.cmp = {
    enable = true;
    cmdline = {
      "/" = {
        mapping.__raw = "cmp.mapping.preset.cmdline()";
        sources = [{ name = "buffer"; }];
      };
      ":" = {
        mapping.__raw = "cmp.mapping.preset.cmdline()";
        sources = [
          { name = "buffer"; }
          { name = "cmdline"; }
        ];
      };
    };
    settings = {
      completion.keyword_length = 2;
      sources = [
        { name = "nvim_lsp"; }
        { name = "buffer"; }
        { name = "nvim_lua"; }
        { name = "nvim_lsp_signature_help"; }
        { name = "luasnip"; }
        { name = "path"; }
      ];

      mapping.__raw = ''
         {
        		["<cr>"] = cmp.mapping.confirm({ select = false }),
        		["<Tab>"] = cmp.mapping(function(fallback)
                    local luasnip = require('luasnip')
        			if cmp.visible() then
        				cmp.select_next_item()
        			elseif luasnip.expand_or_jumpable() then
        				luasnip.expand_or_jump()
        			elseif has_words_before() then
        				cmp.complete()
        			else
        				fallback()
        			end
        		end, { "i", "s" }),
        		["<S-Tab>"] = cmp.mapping(function(fallback)
                    -- TODO (is there a better way to do the require only once?)
                    local luasnip = require('luasnip')
        			if cmp.visible() then
        				cmp.select_prev_item()
        			elseif luasnip.jumpable(-1) then
        				luasnip.jump(-1)
        			else
        				fallback()
        			end
        		end, { "i", "s" }),
        		["<C-u>"] = cmp.mapping.scroll_docs(-4),
        		["<C-d>"] = cmp.mapping.scroll_docs(4),
        		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
        		["<Down>"] = cmp.mapping.select_next_item(select_opts),

        		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
        		["<C-n>"] = cmp.mapping.select_next_item(select_opts),
              }'';
      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';

      # needs some fiddling with the colorscheme
      window = {
        completion = {
          border = "rounded";
          # nicer background for bordered
          # https://github.com/catppuccin/nvim/issues/439#issuecomment-1482379531
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None";
        };
        documentation = {
          border = "rounded";
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None";
        };
      };
    };
  };
}
