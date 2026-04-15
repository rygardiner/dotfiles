# gruvbox-bar

A custom [Zebar](https://github.com/glzr-io/zebar) widget pack: a transparent
gruvbox-dark top bar for [GlazeWM](https://github.com/glzr-io/glazewm).

## Layout

- **Left** — workspace pills (click to focus), tiling-direction toggle, paused state, active binding modes
- **Center** — currently playing media (artist — title)
- **Right** — weather, network, CPU, memory, battery, clock

## Install

The pack is managed by chezmoi. On a new machine:

```sh
chezmoi apply
```

This deploys to `~/.glzr/zebar/gruvbox-bar/`. Zebar discovers any folder under
`~/.glzr/zebar/` containing a `zpack.json`, so the bar is available as soon as
zebar restarts. The chezmoi-managed `~/.glzr/zebar/settings.json` activates it
on startup via `glazewm`'s `shell-exec zebar` command.

## Customize

- **Colors** — edit the CSS custom properties in `styles.css`. The palette
  matches `~/.config/tmux/plugins/tmux-gruvbox/src/palette_gruvbox_dark.sh`.
- **Transparency** — change the alpha on `--gb-bg` in `styles.css` (currently
  `0.78`). The window itself is transparent (`transparent: true` in
  `zpack.json`); CSS controls the actual fill.
- **Bar height / position** — `presets[0]` in `zpack.json`.
- **Weather** — set `WEATHER_LATITUDE` and `WEATHER_LONGITUDE` near the top of
  `bar.html`. Both `null` hides the widget.
- **Date format** — change `formatting` in the `date` provider in `bar.html`.

## Architecture

Buildless React: `bar.html` loads React, ReactDOM, and the zebar SDK from
esm.sh, transpiled by Babel-standalone in the browser. No `npm install`, no
build step — `chezmoi apply` is the only deploy action.
