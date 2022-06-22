#####Imports:
import os
import subprocess
import psutil

from libqtile import qtile
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

#####Personal Variables:
##Mod Key: (Use Mod4 for the Super/Windows Key, or Mod1 for the Alt Key)
mod = "mod4"

##Application Variables:
browser = ("librewolf")
browser2 = ("brave")
editor = ("kitty -e vim")
geditor = ("emacsclient -c -a emacs")
files = ("pcmanfm")
#music = ("spotify")
music = ("kitty -e cmus")
terminal = ("kitty")
terminal2 = ("st")
virt = ("virt-manager")

###Enable Autostart Script:
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])

###Setting Keybindings:
keys = [

    ##Applications:
    Key([mod], "b", lazy.spawn(browser),
        desc="Launch Primary Browser"),
    Key([mod, "mod1"], "b", lazy.spawn(browser2),
        desc="Launch Secondary Browser"),
    Key([mod], "e", lazy.spawn(geditor),
        desc="Launch GUI Editor"),
    Key([mod, "mod1"], "e", lazy.spawn(editor),
        desc="Launch Text Editor"),
    Key([mod], "f", lazy.spawn(files),
        desc="Launch File Manager"),
    Key([mod], "m", lazy.spawn(music),
        desc="Launch Music Player"),
    Key([mod], "r", lazy.spawn("rofi -show drun -show-icons"),
        desc="Launch Run Launcher"),
    Key([mod], "t", lazy.spawn(terminal),
        desc="Launch Primary Terminal Emulator"),
    Key([mod, "mod1"], "t", lazy.spawn(terminal2),
        desc="Launch Secondary Terminal Emulator"),
    Key([mod], "v", lazy.spawn(virt),
        desc="Launch Virtualization Host"),

    ##Window Management:
    #Focus Management:
    Key([mod], "h", lazy.layout.left(),
        desc="Move Focus Left"),
    Key([mod], "l", lazy.layout.right(),
        desc="Move Focus Right"),
    Key([mod], "j", lazy.layout.down(),
        desc="Move Focus Down"),
    Key([mod], "k", lazy.layout.up(),
        desc="Move Focus Up"),
    Key([mod], "period", lazy.next_screen(),
        desc="Move Focus to Next Monitor"),
    Key([mod], "comma", lazy.prev_screen(),
        desc="Move Focus to Previous Monitor"),
    Key([mod], "Return", lazy.layout.toggle_split(),
        desc="Make window with focus full height when in a stack"),

    #Moving Windows:
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move Window Left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move Window Right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move Window Down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(),
        desc="Move Window Up"),

    #Window Sizing:
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow Window Left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow Window Right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow Window Down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(),
        desc="Grow Window Up"),
    Key([mod], "n", lazy.layout.normalize(),
        desc="Reset Window Sizes"),

    ##Layout Management:
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle Split & Unsplit Sides of Stack"),
    Key([mod], "Tab", lazy.next_layout(),
        desc="Toggle Layouts"),

    ##Qtile System:
    Key([mod], "q", lazy.window.kill(),
        desc="Kill Window With Focus"),
    Key([mod, "shift"], "r", lazy.reload_config(),
        desc="Reload Qtile Configuration"),
    Key([mod, "shift"], "q", lazy.shutdown(),
        desc="Shutdown Qtile"),

    ##Multimedia Keys: (Work in Progress)
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"),
        desc="Play Next"),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"),
        desc="Toggle Play/Pause Audio"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"),
        desc="Play Previous"),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q -D pulse sset Master toggle"),
        desc="Mute Audio"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"),
        desc="Stop Audio"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
        desc="Raise Volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
        desc="Lower Volume"),

    ##Key Chords:
    KeyChord(["mod1"], "t", [
        Key([], "s", lazy.spawn("tabbed -r 2 st -w ''"),
            desc="Launch ST Terminal"),
        Key([], "t", lazy.spawn(terminal),
            desc="Launch Primary Terminal"),
    ]),
    KeyChord(["mod1"], "m", [
        Key([], "c", lazy.spawn("kitty -e cmus"),
            desc="Launch cmus inside of kitty terminal"),
        Key([], "v", lazy.spawn("vlc"),
            desc="Launch VLC Media Player"),
        Key([], "s", lazy.spawn("spotify"),
            desc="Launch Spotify"),
    ]),
    KeyChord(["mod1"], "e", [
        Key([], "e", lazy.spawn(geditor),
            desc="Launch Primary GUI Editor"),
        Key([], "v", lazy.spawn("kitty -e vim"),
            desc="Launch Terminal with vim"),
        Key([], "n", lazy.spawn("kitty -e nvim"),
            desc="Launch Kitty Termian with neovim"),
    ]),
]

#####Groups(Workspaces):
groups = [
    Group('1', label="", matches=[Match()], layout="column"),
    Group('2', label="", matches=[Match()], layout="column"),
    Group('3', label="", matches=[Match()], layout="column"),
    Group('4', label="", matches=[Match(wm_class='spotify')], layout="column"),
    Group('5', label="", matches=[Match()], layout="column"),
    Group('6', label="", matches=[Match()], layout="column"),
    Group('7', label="", matches=[Match()], layout="column"),
    Group('8', label="", matches=[Match(wm_class="virt-manager")], layout="column"),
    Group('9', label="", matches=[Match()], layout="column"),
    Group('0', label="", matches=[Match(wm_class='ckb-next')], layout="column")
]

for i in groups:
    keys.extend(
        [
            # mod + character of group = switch to group
            Key(
                [mod],
                i.name, lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + character of group = move focused window to & switch to selected group:
            Key(
                [mod, "shift"],
                i.name, lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

###Layouts:
layouts = [
    layout.Columns(
        border_focus='#9508EC',
        border_focus_stack=["#12b3c2", "#25757c"],
        border_on_single=False,
        border_width=1,
        margin=2
    ),
    layout.Max(
        border_width=0,
    ),
    #Currently having issues with MonadTall
    #layout.MonadTall(
        #border_focus='#9508EC',
        #border_width=1,
        #change_ratio=0.05,
        #change_size=6,
        #magin=2,
        #max_ratio='0.75',
        #min_ratio='0.25',
        #new_client_position='after_current',
    #),
    #layout.MonadWide(),
    #layout.RatioTle(),
    #layout.Spiral(),
    #layout.Tile(),
]

###Widgets & The Qtile Bar:
widget_defaults = dict(
    font="mononoki Nerd Font Regular",
    fontsize=16,
    padding=2,
)
extension_defaults = widget_defaults.copy()

###Colorschemes:
#Dracula:
#colors = [["#6272a4", "#6272a4"], #Blue Background
          #["#bd93f9", "#bd93f9"], #Purple Background
          #["#8be9fd", "#8be9fd"], #Light Blue Icon/Text Color
          #["#FF0000", "#FF0000"], #Red Alert Color
          #["#ffffff", "#ffffff"], #White Text Color
          #["#ceadfd", "#ceadfd"]] #Purple Icon Color

#Nord:
colors = [["#2E3440", "#2E3440"], #Black
          ["#434C5E", "#434C5E"], #Dark Grey
          ["#5E81AC", "#5E81AC"], #Blue
          ["#8FBCBB", "#8FBCBB"], #Light Blue
          ["#BF616A", "#BF616A"], #Red
          ["#A3BE8C", "#A3BE8C"], #Green
          ["#B48EAD", "#B48EAD"], #Peach?
          ["#D8DEE9", "#D8DEE9"]] #White

##Bar Settings::
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(
                    active_color = colors[2],
                    active_text = '契',
                    inactive_color = colors[6],
                    inactive_text = '',
                    padding = 6
                ),
                widget.CurrentLayout(
                    foreground = colors[2],
                    padding = 0,
                ),
                widget.GroupBox(
                    active = colors[2],
                    borderwidth = 2,
                    center_aligned = False,
                    fontsize = 18,
                    hide_unused = False,
                    highlight_method = 'line',
                    margin = 2,
                    padding = 4,
                    rounded = True,
                    this_current_screen_border = colors[2],
                    other_screen_border = colors[5],
                    urgent_alert_method = 'block',
                    urgent_border = colors[4],
                ),
                widget.WindowName(
                    foreground = colors[3],
                ),
                widget.TextBox(
                    text = '',
                    foreground = colors[0],
                    padding = -7,
                    fontsize = 54
                ),
                widget.CheckUpdates(
                    background = colors[0],
                    foreground = colors[3],
                    colour_have_updates = 'ffffff',
                    colour_no_updates = 'ffffff',
                    display_format = 'Arch: {updates}',
                    distro = "Arch_checkupdates",
                    execute = "kitty -e /home/$USER/Documents/scripts/sysupdate.sh",
                    no_update_string = 'None',
                    padding = 4,
                    update_interval = 600,
                ),
                widget.CheckUpdates(
                    background = colors[0],
                    foreground = colors[3],
                    colour_have_updates = 'ffffff',
                    colour_no_updates = 'ffffff',
                    display_format = 'AUR: {updates}',
                    distro = "Arch_paru",
                    execute = "kitty -e /home/$USER/Documents/scripts/sysupdate.sh",
                    no_update_string = 'None',
                    padding = 4,
                    update_interval = 600
                ),
                widget.TextBox(
                    text = '',
                    background = colors[0],
                    foreground = colors[1],
                    padding = -7,
                    fontsize = 54
                ),
                widget.TextBox(
                    text = ' ',
                    background = colors[1],
                    foreground = colors[3],
                    fontsize = 20
                ),
                widget.ThermalSensor(
                    background = colors[1],
                    foreground = colors[3],
                    foreground_alert = colors[5],
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU")},
                    show_tag = False,
                    tag_sensor = 'Tctl',
                    threshold = 70,
                    update_interval = 1,
                ),
                widget.CPU(
                    background = colors[1],
                    foreground = colors[3],
                    format = '/ {load_percent}%',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU")},
                    padding = 2,
                ),
                widget.TextBox(
                    text = '',
                    background = colors[1],
                    foreground = colors[0],
                    padding = -7,
                    fontsize = 54
                ),
                widget.ThermalSensor(
                    background = colors[0],
                    foreground = colors[6],
                    foreground_alert = colors[4],
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e sudo watch -n 0.5 cat /sys/kernel/debug/dri/0/amdgpu_pm_info")},
                    show_tag = False,
                    tag_sensor = 'edge',
                    update_interval = 1,
                ),
                widget.TextBox(
                    text = '',
                    background = colors[0],
                    foreground = colors[5],
                    padding = -7,
                    fontsize = 54
                ),
                widget.TextBox(
                    text = ' ',
                    background = colors[5],
                    foreground = colors[1],
                    textsize = 20
                ),
                widget.Memory(
                    background = colors[5],
                    foreground = colors[1],
                    format = '{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}',
                    measure_mem = 'M',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_MEM")},
                    padding = 4,
                    update_interval = 1.0,
                ),
                widget.TextBox(
                    text = '',
                    background = colors[5],
                    foreground = colors[2],
                    padding = -7,
                    fontsize = 54
                ),
                widget.TextBox(
                    text = ' ',
                    background = colors[2],
                    foreground = colors[3],
                    fontsize = 20,
                ),
                widget.Net(
                    background = colors[2],
                    foreground = colors[3],
                    format = '{down} ↓↑ {up}',
                    interface = 'enp3s0',
                ),
                widget.TextBox(
                    text = '',
                    background = colors[2],
                    foreground = colors[6],
                    padding = -7,
                    fontsize = 54,
                ),
                widget.TextBox(
                    text = ' ',
                    background = colors[6],
                    foreground = colors[7],
                    textsize = 20,
                ),
                widget.Clock(
                    background = colors[6],
                    foreground = colors[7],
                    format = "%m/%d/%y %a %H:%M",
                ),
                widget.TextBox(
                    text = '',
                    background = colors[6],
                    foreground = colors[1],
                    padding = -7,
                    fontsize = 54
                ),
                widget.WidgetBox(
                    background = colors[1],
                    foreground = colors[3],
                    widgets=[
                        widget.PulseVolume(
                            background = colors[1],
                            foreground = colors[3],
                            volume_app = 'pavucontrol'
                        ),
                        widget.TextBox(
                            text = '墳 ',
                            background = colors[1],
                            foreground = colors[3],
                            fontsize = 20
                        ),
                        widget.DF(
                            background = colors[1],
                            foreground = colors[3],
                            partition = '/',
                            visible_on_warn = False,
                            measure = 'G',
                            padding = None,
                            update_interval = '60'
                        ),
                        widget.TextBox(
                            text = ' ',
                            background = colors[1],
                            foreground = colors[3],
                            fontsize = 20
                        ),
                ]),
                widget.QuickExit(
                    background = colors[0],
                    foreground = colors[2],
                    default_text = '[Exit]'
                ),
                widget.Systray(
                    background = colors[0],
                    icon_size = 20,
                    padding = 2,
                ),
                #widget.Mirror
            ],
            30,
            margin = 4,
            opacity = 0.75
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(
                    active_color = colors[2],
                    active_text = '契',
                    inactive_color = colors[6],
                    inactive_text = '',
                    padding = 6,
                ),
                widget.GroupBox(
                    active = colors[2],
                    borderwidth = 2,
                    center_aligned = False,
                    fontsize = 18,
                    hide_unused = False,
                    highlight_method = 'line',
                    margin = 2,
                    padding = 4,
                    rounded = True,
                    this_current_screen_border = colors[2],
                    other_screen_border = colors[5],
                    urgent_alert_method = 'block',
                    urgent_border = colors[4],
                ),
                widget.WindowName(
                    foreground = colors[3],
                ),
                widget.TextBox(
                    text = '',
                    foreground = colors[0],
                    padding = -7,
                    fontsize = 54
                ),
                widget.Cmus(
                    background = colors[0],
                    foreground = colors[6],
                    noplay_color = 'cecece',
                    padding = 2,
                    play_color = colors[2],
                    update_interval = 0.5,
                    ),
                widget.TextBox(
                    text = '',
                    background = colors[0],
                    foreground = colors[1],
                    padding = -7,
                    fontsize = 54,
                ),
                widget.TextBox(
                    text = ' ',
                    background = colors[1],
                    foreground = colors[3],
                    fontsize = 20
                ),
                widget.ThermalSensor(
                    background = colors[1],
                    foreground = colors[3],
                    foreground_alert = colors[5],
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU")},
                    show_tag = False,
                    tag_sensor = 'Tctl',
                    threshold = 70,
                    update_interval = 1,
                ),
                widget.CPU(
                    background = colors[1],
                    foreground = colors[3],
                    format = '/ {load_percent}%',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU")},
                    padding = 2,
                ),
                widget.TextBox(
                    text = '',
                    background = colors[1],
                    foreground = colors[0],
                    padding = -7,
                    fontsize = 54
                ),
                widget.ThermalSensor(
                    background = colors[0],
                    foreground = colors[6],
                    foreground_alert = colors[4],
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e sudo watch -n 0.5 cat /sys/kernel/debug/dri/0/amdgpu_pm_info")},
                    show_tag = False,
                    tag_sensor = 'edge',
                    update_interval = 1,
                ),
                widget.TextBox(
                    text = '',
                    background = colors[0],
                    foreground = colors[5],
                    padding = -7,
                    fontsize = 54
                ),
                widget.TextBox(
                    text = ' ',
                    background = colors[5],
                    foreground = colors[1],
                    textsize = 20
                ),
                widget.Memory(
                    background = colors[5],
                    foreground = colors[1],
                    format = '{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm} ',
                    measure_mem = 'M',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_MEM")},
                    padding = 4,
                    update_interval = 1.0,
                ),
            ],
            26,
            margin = 2,
            opacity = 0.75,
        ),
    ),
]

###Drag Floating Windows:
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
follow_mouse_focus = True

wmname = "Qtile"
