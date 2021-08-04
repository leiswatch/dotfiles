lua << EOF
require'colorizer'.setup({
  '*',
}, {
RRGGBBAA = true;        -- #RRGGBBAA hex codes
rgb_fn   = true;        -- CSS rgb() and rgba() functions
hsl_fn   = true;        -- CSS hsl() and hsla() functions
RGB      = true;         -- #RGB hex codes
RRGGBB   = true;         -- #RRGGBB hex codes
names    = true;         -- "Name" codes like Blue
css = true;
css_fn = true;
mode = 'background';
})
EOF
