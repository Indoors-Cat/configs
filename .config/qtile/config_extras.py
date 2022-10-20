#####Imports:
import os
import subprocess
import psutil

from libqtile import qtile
from libqtile import bar, layout, hook
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from libqtile.widget import TextBox
from libqtile.utils import guess_terminal
from qtile_extras import widget
from qtile_extras.widget.decorations import RectDecoration, BorderDecoration
from qtile_extras.widget.mixins import TooltipMixin

#####Personal Variables:
##Mod Key: (Use Mod4 for the Super/Windows Key, or Mod1 for the Alt Key)
mod = "mod4"

##Application Variables:
 #Browsers:
browser = ("firefox")
browser2 = ("brave")
 #Terminal Text Editor:
editor = ("st -e nvim")
 #Graphical Text Editor:
geditor = ("vscodium")
#geditor = ("emacsclient -c -a emacs")
 #GUI File Manager:
files = ("pcmanfm")
 #Music/Media Player:
music = ("spotify")
 #Run Prompt:
run = ("rofi -show drun -show-icons")
run2 = ("dmenu_run -h 30")
 #Terminal Emulator:
terminal = ("kitty")
#terminal = ("alacritty")
terminal2 = ("st")
 #Virtual Machine Program:
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
    Key([mod], "e", lazy.spawn(editor),
        desc="Launch Text Editor"),
    Key([mod, "mod1"], "e", lazy.spawn(geditor),
        desc="Launch GUI Editor"),
    Key([mod], "f", lazy.spawn(files),
        desc="Launch File Manager"),
    Key([mod], "m", lazy.spawn(music),
        desc="Launch Music Player"),
    Key([mod], "r", lazy.spawn(run),
        desc="Launch Primary Run Launcher"),
    Key([mod, "mod1"], "r", lazy.spawn(run2),
        desc="Launch Secondary Run Launcher"),
    Key([mod], "t", lazy.spawn(terminal),
        desc="Launch Primary Terminal Emulator"),
    Key([mod, "mod1"], "t", lazy.spawn(terminal2),
        desc="Launch Secondary Terminal Emulator"),
    Key([mod], "v", lazy.spawn(virt),
        desc="Launch Virtualization Host"),
    Key(["mod1"], "Tab", lazy.spawn("rofi -show window"),
        desc="Launch Rofi Window Switcher"),

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
    Key([mod], "x", lazy.window.toggle_fullscreen(),
        desc="Toggle Fullscreen for Window with Focus"),

    ##Layout Bindings:
    #Columns:
    Key([mod, "control", "shift"], "h", lazy.layout.swap_column_left(),
        desc="Switch column to left side"),
    Key([mod, "control", "shift"], "l", lazy.layout.swap_column_right(),
        desc="Switch column to right side"),
    Key([mod], "n", lazy.layout.normalize(),
        desc="Reset window sizing to default"),
    #Key([mod, "control"], "h", lazy.layout.grow(),
        #desc="yeah"),
    #Key([mod, "control"], "l", lazy.layout.shrink(),
        #desc="yeah"),
    Key([mod, "shift"], "space", lazy.layout.flip(),
        desc="Flip Stacks"),

    ##Layout Management:
    Key([mod], "Tab", lazy.next_layout(),
        desc="Toggle Layouts"),
    Key([mod], "z", lazy.window.toggle_floating(),
        desc="Toggle floating for window with focus"),

    ##Qtile System:
    Key([mod], "q", lazy.window.kill(),
        desc="Kill Window With Focus"),
    Key([mod, "shift"], "r", lazy.reload_config(),
        desc="Reload Qtile Configuration"),
    Key([mod, "shift"], "q", lazy.shutdown(),
        desc="Shutdown Qtile"),
    Key([mod], "Tab", lazy.next_layout(),
        desc="Toggle Layouts"),

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

    ##KeyChords:
    #Terminals & Shells:
    KeyChord(["mod1"], "t", [
        KeyChord([], "a", [
            Key([], "b", lazy.spawn("alacritty -e bash"),
                desc="Launch Alacritty with the Bash Shell"),
            Key([], "z", lazy.spawn("alacritty -e zsh"),
                desc="Launch Alacritty with the Z Shell"),
        ]),
        KeyChord([], "k", [
            Key([], "b", lazy.spawn("kitty -e bash"),
                desc="Launch Kitty with the Bash Shell"),
            Key([], "z", lazy.spawn("kitty -e zsh"),
                desc="Launch Kitty with the Z Shell"),
        ]),
        KeyChord([], "s", [
            Key([], "b", lazy.spawn("tabbed -r 2 st -w ''"),
                desc="Launch ST with the Bash Shell"),
            Key([], "z", lazy.spawn("st -e zsh"),
                desc="Launch ST with the Z Shell"),
        ]),
    ]),

    #Media Players:
    KeyChord(["mod1"], "m", [
        Key([], "c", lazy.spawn("st -e cmus"),
            desc="Launch cmus inside of ST"),
        Key([], "s", lazy.spawn("spotify"),
            desc="Launch Spotify"),
        Key([], "v", lazy.spawn("vlc"),
            desc="Launch VLC Media Player"),
    ]),

    #Editors:
    KeyChord(["mod1"], "e", [
        Key([], "e", lazy.spawn(geditor),
            desc="Launch Primary GUI Editor"),
        Key([], "n", lazy.spawn("kitty -e nvim"),
            desc="Launch Neovim inside Kitty Terminal"),
        Key([], "v", lazy.spawn("kitty -e vim"),
            desc="Launch Vim inside Kitty Terminal"),
    ]),

    #Browsers:
    KeyChord(["mod1"], "b", [
        KeyChord([], "b", [
            Key([], "b", lazy.spawn("brave"),
                desc="Launch Brave Browser normally"),
            Key([], "d", lazy.spawn("brave duckduckgo.com"),
                desc="Launch Brave Browser & open duckduckgo.com"),
            Key([], "p", lazy.spawn("brave --incognito"),
                desc="Launch Brave Browser in Incognito Window"),
        ]),
        KeyChord([], "f", [
            Key([], "f", lazy.spawn("firefox"),
                desc="Launch FireFox normally"),
            Key([], "p", lazy.spawn("firefox --private"),
                desc="Launch FireFox Browswer in Private Window"),
        ]),
        KeyChord([], "l", [
            Key([], "l", lazy.spawn("librewolf"),
                desc="Launch Librewolf normally"),
            Key([], "p", lazy.spawn("librewolf --private-window"),
                desc="Launch Librewolf Browser in Private Window"),
        ]),
    ]),
]

#####Groups(Workspaces):
groups = [
    Group('1', label="", matches=[Match()], layout="column"),
    Group('2', label="", matches=[Match()], layout="monadtall"),
    Group('3', label="", matches=[Match()], layout="ratiotile"),
    Group('4', label="", matches=[Match(wm_class="spotify")], layout="monadtall"),
    Group('5', label="", matches=[Match()], layout="column"),
    Group('6', label="", matches=[Match()], layout="column"),
    Group('7', label="", matches=[Match()], layout="column"),
    Group('8', label="", matches=[Match(wm_class="virt-manager")], layout="column"),
    Group('9', label="", matches=[Match()], layout="max"),
    Group('0', label="", matches=[Match()], layout="column")
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
        border_focus = '#9508EC',
        border_focus_stack = ["#12b3c2", "#25757c"],
        border_on_single = False,
        border_width = 1,
        fair = False,
        grow_amount = 10,
        margin = 2,
        margin_on_single = None,
        num_columns = 2,
        split = True,
    ),
    layout.Max(
        border_width = 0,
        margin = 0,
    ),
    layout.MonadTall(
        border_focus = '#9508EC',
        border_width = 1,
        change_ratio = 0.05,
        change_size = 20,
        magin = 4,
        max_ratio = '0.75',
        min_ratio = '0.25',
        new_client_position = 'after_current',
        ratio = 0.52,
        single_border_widgth = None,
        single_margin = 2,
    ),
    layout.Floating(
        border_focus = '#9508EC',
        border_normal = "#000000",
        border_width = 2,
        cloumns = 2,
        margin = 0,
    ),
    #layout.MonadWide(),
    layout.RatioTile(
        border_focus = "#9508EC",
        border_normal = "#000000",
        border_width = 1,
        fancy = True,
        margin = 5,
    ),
    #layout.Spiral(),
]

###Widgets & The Qtile Bar:
widget_defaults = dict(
    font="mononoki Nerd Font Regular",
    #font="FiraCode NF",
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
colors = [["#2E3440", "#2E3440"], #Black 0
          ["#434C5E", "#434C5E"], #Dark Grey 1
          ["#5E81AC", "#5E81AC"], #Blue 2
          ["#88C0D0", "#88C0D0"], #Light Blue 3
          ["#8FBCBB", "#8FBCBB"], #Blue-Green 4
          ["#A3BE8C", "#A3BE8C"], #Green 5
          ["#B48EAD", "#B48EAD"], #Peach? 6
          ["#BF616A", "#BF616A"], #Red 7
          ["#D8DEE9", "#D8DEE9"]] #White 8

##Bar Settings::
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(
                    active_color = colors[3],
                    active_text = '契',
                    fontsize = 18,
                    inactive_color = colors[6],
                    inactive_text = '',
                    padding = 8,
                    decorations=[
                        RectDecoration(colour=colors[0], filled=True, line_width=3, padding_y=2, padding_x=2, radius=10)
                    ]
                ),
                widget.Spacer(
                    length=0,
                ),
                widget.CurrentLayout(
                    font = "FiraCode Nerd Font Mono",
                    fontshadow = None,
                    fontsize = 13,
                    foreground = colors[0],
                    padding = 4,
                    decorations=[
                        RectDecoration(colour=colors[2], filled=True, line_width=2, padding_y=0, padding_x=0, radius=14)
                    ],
                ),
                widget.Spacer(
                    length=4,
                ),
                widget.Clock(
                    foreground = colors[1],
                    format = "  %m/%d/%y %a %H:%M",
                    padding = 6,
                    decorations=[
                        RectDecoration(colour=colors[3], filled=True, line_width=2, padding_y=0, padding_x=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length=4,
                ),
                widget.CheckUpdates(
                    foreground = colors[1],
                    colour_have_updates = 'ffffff',
                    colour_no_updates = 'ffffff',
                    display_format = 'Arch:{updates}',
                    distro = "Arch_checkupdates",
                    execute = "kitty -e /home/$USER/.config/qtile/scripts/sysupdate.sh",
                    no_update_string = 'Up To Date!',
                    padding = 8,
                    update_interval = 3600,
                    decorations=[
                        RectDecoration(colour=colors[2], filled=True, line_width=2, padding_x=2, padding_y=0, radius=14)
                    ]
                ),
                widget.CheckUpdates(
                    foreground = colors[1],
                    colour_have_updates = 'ffffff',
                    colour_no_updates = 'ffffff',
                    display_format = 'AUR:{updates}',
                    distro = "Arch_paru",
                    execute = "kitty -e /home/$USER/.config/qtile/scripts/sysupdate.sh",
                    no_update_string = ' ',
                    padding = 8,
                    update_interval = 3600,
                    decorations=[
                        RectDecoration(colour=colors[2], filled=True, line_width=2, padding_x=2, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length=2,
                ),
                widget.Systray(
                    icon_size = 16,
                    padding = 6,
                ),
                widget.Spacer(
                    length=bar.STRETCH,
                ),
                widget.GroupBox(
                    active = colors[3],
                    borderwidth = 0,
                    center_aligned = True,
                    disable_drag = False,
                    font = "FiraCode Nerd Font Mono",
                    fontsize = 28,
                    hide_unused = False,
                    highlight_method = 'text',
                    inactive = colors[0],
                    margin = 2,
                    padding = 4,
                    rounded = True,
                    spacing = 10,
                    this_current_screen_border = colors[6],
                    urgent_alert_method = 'text',
                    urgent_border = colors[7],
                    decorations=[
                        RectDecoration(colour=colors[1], filled=True, line_width=2, padding_y=0, padding_x=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length=bar.STRETCH,
                ),
                widget.CPU(
                    fontsize = 16,
                    foreground = colors[1],
                    format = ' {load_percent}%',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU"), "Button3" : lazy.spawn("kitty -e procs")},
                    padding = 6,
                    update_interval = 1,
                    decorations=[
                        RectDecoration(colour=colors[4], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 2,
                ),
                widget.ThermalSensor(
                    fontsize = 16,
                    foreground = colors[1],
                    foreground_alert = colors[7],
                    format = "{temp:.1f}{Tctl}{C}",
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU")},
                    padding = 4,
                    show_tag = False,
                    threshold = 70,
                    tag_sensor = 'Core 0',
                    update_interval = 1,
                    decorations=[
                        RectDecoration(colour=colors[4], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
                widget.ThermalSensor(
                    fontsize = 16,
                    foreground = colors[0],
                    foreground_alert = colors[4],
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e sudo watch -n 0.5 cat /sys/kernel/debug/dri/0/amdgpu_pm_info")},
                    padding = 4,
                    show_tag = False,
                    tag_sensor = 'edge',
                    update_interval = 1,
                    decorations=[
                        RectDecoration(colour=colors[6], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
                widget.Memory(
                    fontsize = 16,
                    foreground = colors[1],
                    format = ' {MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}',
                    measure_mem = 'M',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_MEM")},
                    padding = 4,
                    update_interval = 1.0,
                    decorations=[
                        RectDecoration(colour=colors[5], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
                widget.Net(
                    fontsize = 16,
                    foreground = colors[3],
                    format = ' {down} ↓↑ {up}',
                    interface = 'enp3s0',
                    #mouse_callbacks = {},
                    padding = 6,
                    update_interval = 1,
                    use_bits = False,
                    decorations=[
                        RectDecoration(colour=colors[2], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
                widget.DF(
                    fontsize = 16,
                    foreground = colors[1],
                    format = ' {uf}{m}|{r:.0f}%',
                    measure = 'G',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e /home/$USER/.config/qtile/scripts/space.sh")},
                    padding = 4,
                    partition = '/',
                    update_interval = '60',
                    visible_on_warn = False,
                    decorations=[
                        RectDecoration(colour=colors[3], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.QuickExit(
                    countdown_format = '[ {} ]',
                    countdown_start = 3,
                    default_text = "[Exit]",
                    fontsize = 14,
                    foreground = colors[2],
                    padding = 2,
                    timer_interval = 1,
                ),
            ],
            30,
            margin = 4,
            opacity = 0.9,
            background="#00000000",
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(
                    active_color = colors[3],
                    active_text = '契',
                    fontsize = 18,
                    inactive_color = colors[6],
                    inactive_text = '',
                    padding = 8,
                    decorations=[
                        RectDecoration(colour=colors[0], filled=True, line_width=3, padding_y=2, padding_x=2, radius=10)
                    ]
                ),
                widget.Spacer(
                    length=0,
                ),
                widget.CurrentLayout(
                    font = "FiraCode Nerd Font Mono",
                    fontsize = 13,
                    foreground = colors[0],
                    padding = 4,
                    decorations=[
                        RectDecoration(colour=colors[2], filled=True, line_width=2, padding_y=0, padding_x=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length=4,
                ),
                widget.Clock(
                    foreground = colors[1],
                    format = "  %m/%d/%y %a %H:%M",
                    padding = 4,
                    decorations=[
                        RectDecoration(colour=colors[3], filled=True, line_width=2, padding_y=0, padding_x=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length=bar.STRETCH,
                ),
                widget.GroupBox(
                    active = colors[3],
                    borderwidth = 0,
                    center_aligned = True,
                    disable_drag = False,
                    font = "FiraCode Nerd Font Mono",
                    fontsize = 28,
                    hide_unused = False,
                    highlight_method = 'text',
                    inactive = colors[0],
                    margin = 2,
                    padding = 4,
                    rounded = True,
                    spacing = 10,
                    this_current_screen_border = colors[6],
                    urgent_alert_method = 'text',
                    urgent_border = colors[7],
                    decorations=[
                        RectDecoration(colour=colors[1], filled=True, line_width=2, padding_y=0, padding_x=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length=bar.STRETCH,
                ),
                widget.CPU(
                    fontsize = 16,
                    foreground = colors[1],
                    format = ' {load_percent}%',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU"), "Button3" : lazy.spawn("kitty -e procs")},
                    padding = 6,
                    update_interval = 1,
                    decorations=[
                        RectDecoration(colour=colors[4], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 2,
                ),
                widget.ThermalSensor(
                    fontsize = 16,
                    foreground = colors[1],
                    foreground_alert = colors[7],
                    format = "{temp:.1f}{Tctl}{C}",
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_CPU")},
                    padding = 4,
                    show_tag = False,
                    threshold = 70,
                    update_interval = 1,
                    decorations=[
                        RectDecoration(colour=colors[4], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
                widget.ThermalSensor(
                    fontsize = 16,
                    foreground = colors[0],
                    foreground_alert = colors[4],
                    metric = True,
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e sudo watch -n 0.5 cat /sys/kernel/debug/dri/0/amdgpu_pm_info")},
                    padding = 4,
                    show_tag = False,
                    tag_sensor = 'edge',
                    update_interval = 1,
                    decorations=[
                        RectDecoration(colour=colors[6], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
                widget.Memory(
                    fontsize = 16,
                    foreground = colors[1],
                    format = ' {MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}',
                    measure_mem = 'M',
                    mouse_callbacks = {"Button1" : lazy.spawn("kitty -e htop -s PERCENT_MEM")},
                    padding = 4,
                    update_interval = 1.0,
                    decorations=[
                        RectDecoration(colour=colors[5], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
                widget.Net(
                    fontsize = 16,
                    foreground = colors[3],
                    format = ' {down} ↓↑ {up}',
                    interface = 'enp3s0',
                    #mouse_callbacks = {},
                    padding = 6,
                    update_interval = 1,
                    use_bits = False,
                    decorations=[
                        RectDecoration(colour=colors[2], filled=True, line_width=2, padding_x=0, padding_y=0, radius=14)
                    ]
                ),
                widget.Spacer(
                    length = 4,
                ),
            ],
            26,
            margin = 2,
            opacity = 0.75,
            background="#00000000",
        ),
    ),
]

###Drag Floating Windows:
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
]

###Qtile Boolean Configuration Variables:
auto_fullscreen = True
bring_front_click = False
cursor_warp = True
dgroups_key_binder = None
dgroup_app_rules = []
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
focus_on_window_activation = "smart"
follow_mouse_focus = True
reconfigure_screens = True
wmname = "LG3D"
auto_minimize = True

wl_input_rules = None
