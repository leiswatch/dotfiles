# vim:fileencoding=utf-8:foldmethod=marker

def setup(c, samecolorrows=False):
    palette = {
        "bg": "#1a1b26",
        "bg_dark": "#16161e",
        "bg_dark1": "#0C0E14",
        "bg_highlight": "#292e42",
        "blue": "#7aa2f7",
        "blue0": "#3d59a1",
        "blue1": "#2ac3de",
        "blue2": "#0db9d7",
        "blue5": "#89ddff",
        "blue6": "#b4f9f8",
        "blue7": "#394b70",
        "comment": "#565f89",
        "cyan": "#7dcfff",
        "dark3": "#545c7e",
        "dark5": "#737aa2",
        "fg": "#c0caf5",
        "fg_dark": "#a9b1d6",
        "fg_gutter": "#3b4261",
        "green": "#9ece6a",
        "green1": "#73daca",
        "green2": "#41a6b5",
        "magenta": "#bb9af7",
        "magenta2": "#ff007c",
        "orange": "#ff9e64",
        "purple": "#9d7cd8",
        "red": "#f7768e",
        "red1": "#db4b4b",
        "teal": "#1abc9c",
        "terminal_black": "#414868",
        "yellow": "#e0af68",
        "add": "#449dab",
        "change": "#6183bb",
        "delete": "#914c54",
        "bg_alt": "#24283b",
        "bg_dark_alt": "#1f2335",
    }

    # completion {{{
    ## Background color of the completion widget category headers.
    c.colors.completion.category.bg = palette["bg"]
    ## Bottom border color of the completion widget category headers.
    c.colors.completion.category.border.bottom = palette["bg_dark"]
    ## Top border color of the completion widget category headers.
    c.colors.completion.category.border.top = palette["fg_gutter"]
    ## Foreground color of completion widget category headers.
    c.colors.completion.category.fg = palette["green"]
    ## Background color of the completion widget for even and odd rows.
    if samecolorrows:
        c.colors.completion.even.bg = palette["bg"]
        c.colors.completion.odd.bg = c.colors.completion.even.bg
    else:
        c.colors.completion.even.bg = palette["bg_dark"]
        c.colors.completion.odd.bg = palette["bg_dark1"]
    ## Text color of the completion widget.
    c.colors.completion.fg = palette["fg_dark"]

    ## Background color of the selected completion item.
    c.colors.completion.item.selected.bg = palette["dark3"]
    ## Bottom border color of the selected completion item.
    c.colors.completion.item.selected.border.bottom = palette["dark3"]
    ## Top border color of the completion widget category headers.
    c.colors.completion.item.selected.border.top = palette["dark3"]
    ## Foreground color of the selected completion item.
    c.colors.completion.item.selected.fg = palette["fg"]
    ## Foreground color of the selected completion item.
    c.colors.completion.item.selected.match.fg = palette["blue5"]
    ## Foreground color of the matched text in the completion.
    c.colors.completion.match.fg = palette["fg"]

    ## Color of the scrollbar in completion view
    c.colors.completion.scrollbar.bg = palette["bg_dark1"]
    ## Color of the scrollbar handle in completion view.
    c.colors.completion.scrollbar.fg = palette["dark3"]
    # }}}

    # downloads {{{
    c.colors.downloads.bar.bg = palette["bg"]
    c.colors.downloads.error.bg = palette["bg"]
    c.colors.downloads.start.bg = palette["bg"]
    c.colors.downloads.stop.bg = palette["bg"]

    c.colors.downloads.error.fg = palette["red"]
    c.colors.downloads.start.fg = palette["blue"]
    c.colors.downloads.stop.fg = palette["green"]
    c.colors.downloads.system.fg = "none"
    c.colors.downloads.system.bg = "none"
    # }}}

    # hints {{{
    ## Background color for hints. Note that you can use a `rgba(...)` value
    ## for transparency.
    c.colors.hints.bg = palette["orange"]

    ## Font color for hints.
    c.colors.hints.fg = palette["bg_dark"]

    ## Hints
    c.hints.border = "1px solid " + palette["bg_dark"]

    ## Font color for the matched part of hints.
    c.colors.hints.match.fg = palette["fg_dark"]
    # }}}

    # keyhints {{{
    ## Background color of the keyhint widget.
    c.colors.keyhint.bg = palette["bg_dark"]

    ## Text color for the keyhint widget.
    c.colors.keyhint.fg = palette["fg"]

    ## Highlight color for keys to complete the current keychain.
    c.colors.keyhint.suffix.fg = palette["fg_dark"]
    # }}}

    # messages {{{
    ## Background color of an error message.
    c.colors.messages.error.bg = palette["fg_gutter"]
    ## Background color of an info message.
    c.colors.messages.info.bg = palette["fg_gutter"]
    ## Background color of a warning message.
    c.colors.messages.warning.bg = palette["fg_gutter"]

    ## Border color of an error message.
    c.colors.messages.error.border = palette["bg_dark"]
    ## Border color of an info message.
    c.colors.messages.info.border = palette["bg_dark"]
    ## Border color of a warning message.
    c.colors.messages.warning.border = palette["bg_dark"]

    ## Foreground color of an error message.
    c.colors.messages.error.fg = palette["red"]
    ## Foreground color an info message.
    c.colors.messages.info.fg = palette["fg"]
    ## Foreground color a warning message.
    c.colors.messages.warning.fg = palette["orange"]
    # }}}

    # prompts {{{
    ## Background color for prompts.
    c.colors.prompts.bg = palette["bg_dark"]

    # ## Border used around UI elements in prompts.
    c.colors.prompts.border = "1px solid " + palette["fg_gutter"]

    ## Foreground color for prompts.
    c.colors.prompts.fg = palette["fg"]

    ## Background color for the selected item in filename prompts.
    c.colors.prompts.selected.bg = palette["dark3"]

    ## Background color for the selected item in filename prompts.
    c.colors.prompts.selected.fg = palette["blue5"]
    # }}}

    # statusbar {{{
    ## Background color of the statusbar.
    c.colors.statusbar.normal.bg = palette["bg"]
    ## Background color of the statusbar in insert mode.
    c.colors.statusbar.insert.bg = palette["bg_dark1"]
    ## Background color of the statusbar in command mode.
    c.colors.statusbar.command.bg = palette["bg"]
    ## Background color of the statusbar in caret mode.
    c.colors.statusbar.caret.bg = palette["bg"]
    ## Background color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.bg = palette["bg"]

    ## Background color of the progress bar.
    c.colors.statusbar.progress.bg = palette["bg"]
    ## Background color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.bg = palette["bg"]

    ## Foreground color of the statusbar.
    c.colors.statusbar.normal.fg = palette["fg"]
    ## Foreground color of the statusbar in insert mode.
    c.colors.statusbar.insert.fg = palette["blue5"]
    ## Foreground color of the statusbar in command mode.
    c.colors.statusbar.command.fg = palette["fg"]
    ## Foreground color of the statusbar in passthrough mode.
    c.colors.statusbar.passthrough.fg = palette["orange"]
    ## Foreground color of the statusbar in caret mode.
    c.colors.statusbar.caret.fg = palette["orange"]
    ## Foreground color of the statusbar in caret mode with a selection.
    c.colors.statusbar.caret.selection.fg = palette["orange"]

    ## Foreground color of the URL in the statusbar on error.
    c.colors.statusbar.url.error.fg = palette["red"]

    ## Default foreground color of the URL in the statusbar.
    c.colors.statusbar.url.fg = palette["fg"]

    ## Foreground color of the URL in the statusbar for hovered links.
    c.colors.statusbar.url.hover.fg = palette["change"]

    ## Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.http.fg = palette["teal"]

    ## Foreground color of the URL in the statusbar on successful load
    c.colors.statusbar.url.success.https.fg = palette["green"]

    ## Foreground color of the URL in the statusbar when there's a warning.
    c.colors.statusbar.url.warn.fg = palette["yellow"]

    ## PRIVATE MODE COLORS
    ## Background color of the statusbar in private browsing mode.
    c.colors.statusbar.private.bg = palette["bg_dark"]
    ## Foreground color of the statusbar in private browsing mode.
    c.colors.statusbar.private.fg = palette["fg_dark"]
    ## Background color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.bg = palette["bg"]
    ## Foreground color of the statusbar in private browsing + command mode.
    c.colors.statusbar.command.private.fg = palette["fg_dark"]

    # }}}

    # tabs {{{
    ## Background color of the tab bar.
    c.colors.tabs.bar.bg = palette["bg"]
    ## Background color of unselected even tabs.
    c.colors.tabs.even.bg = palette["fg_gutter"]
    ## Background color of unselected odd tabs.
    c.colors.tabs.odd.bg = palette["fg_gutter"]

    ## Foreground color of unselected even tabs.
    c.colors.tabs.even.fg = palette["bg"]
    ## Foreground color of unselected odd tabs.
    c.colors.tabs.odd.fg = palette["bg"]

    ## Color for the tab indicator on errors.
    c.colors.tabs.indicator.error = palette["red"]
    ## Color gradient interpolation system for the tab indicator.
    ## Valid values:
    ##	 - rgb: Interpolate in the RGB color system.
    ##	 - hsv: Interpolate in the HSV color system.
    ##	 - hsl: Interpolate in the HSL color system.
    ##	 - none: Don't show a gradient.
    c.colors.tabs.indicator.system = "none"

    # ## Background color of selected even tabs.
    c.colors.tabs.selected.even.bg = palette["blue"]
    # ## Background color of selected odd tabs.
    c.colors.tabs.selected.odd.bg = palette["blue"]

    # ## Foreground color of selected even tabs.
    c.colors.tabs.selected.even.fg = palette["bg"]
    # ## Foreground color of selected odd tabs.
    c.colors.tabs.selected.odd.fg = palette["bg"]
    # }}}

    # context menus {{{
    c.colors.contextmenu.menu.bg = palette["bg"]
    c.colors.contextmenu.menu.fg = palette["fg"]

    c.colors.contextmenu.disabled.bg = palette["bg_dark"]
    c.colors.contextmenu.disabled.fg = palette["fg_gutter"]

    c.colors.contextmenu.selected.bg = palette["fg_gutter"]
    c.colors.contextmenu.selected.fg = palette["blue5"]
    # }}}
