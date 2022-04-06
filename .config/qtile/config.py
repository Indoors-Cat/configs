import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

###Personal Varibales:
mod = "mod4"

browser = ("firefox")
browser2 = ("brave")
editor = ("vim")
geditor = ("emacs -c -a emacs")
files = ("thunar")
music = ("spotify")
terminal = ("kitty")
terminal2 = ("alacritty")
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
    Key([mod, "shift"], "b", lazy.spawn(browser2),
        desc="Launch Secondary Browser"),
    Key([mod], "e", lazy.spawn(geditor),
        desc="Launch GUI Editor"),
    Key([mod, "shift"], "e", lazy.spawn(editor),
        desc="Launch Text Editor"),
    Key([mod], "f", lazy.spawn(files),
        desc="Launch File Manager"),
    Key([mod], "m", lazy.spawn(music),
        desc="Launch Music Player"),
    Key([mod], "r", lazy.spawn("rofi -show drun -show-icons"),
        desc="Launch Run Launcher"),
    Key([mod], "t", lazy.spawn(terminal),
        desc="Launch Primary Terminal Emulator"),
    Key([mod, "shift"], "t", lazy.spawn(terminal2),
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
    Key([mod], "f", lazy.window.toggle_fullescreen(),
        desc="Toggle Fullscreen"),

    ##Qtile System:
    Key([mod], "q", lazy.window.kill(),
        desc="Kill Window With Focus"),
    Key([mod, "shift"], "r", lazy.reload_config(),
        desc="Reload Qtile Configuration"),
    Key([mod, "shift"], "q", lazy.shutdown(),
        desc="Shutdown Qtile"),

    ##Multimedia Keys: (Still a work in progresss)
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

]

###Workspaces: (Default)
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
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
        border_width=0
    ),
    layout.MonadTall(
        align='right',
        border_focus='#9508EC',
        border_width=2,
        magin=2,
        max_ratio='0.75',
        min_ratio='0.25',
        new_client_position='after_current',
        ratio='0.5'
    ),
    layout.MonadWide(),
    #layout.RatioTle(),
    layout.Spiral(
        border_focus='#9508EC',
        clockwise=True,
        main_pane='left',
        margin=2
    ),
    layout.Tile(
        border_focus='#9508EC',
        margin_on_single=False,
        margin=2
    ),
]

###Widgets & The Qtile Bar:
widget_defaults = dict(
    font="sans",
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

##Bar Settings::
screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentScreen(
                    active_color='#8be9fd',
                    inactive_color='#ff79c6'
                ),
                widget.CurrentLayout(),
                widget.GroupBox(
                    active='#bd93f9',
                    borderwidth=3,
                    hide_unused=False,
                    highlight_method='line',
                    rounded=True,
                    this_current_screen_border='#8be9fd',
                    other_screen_border='#ff79c6',
                ),
                widget.Prompt(),
                widget.WindowName(
                    foreground="#bd93f9"
                ),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                #widget.Battery(
                    #background='#068847'),
                widget.TextBox(
                    text = '',
                    foreground='#6272a4',
                    padding = 0,
                    fontsize = 54
                ),
                widget.CheckUpdates(
                    background='#6272a4',
                    foreground='#8be9fd',
                    distro = "Arch",
                    custom_command='sudo pacman -Syu | wc -l',
                    no_update_string='Updates: 0',
                    padding = 4,
                    update_interval='60'
                ),
                widget.TextBox(
                    text = '',
                    background='#6272a4',
                    foreground='#bd93f9',
                    padding = 0,
                    fontsize = 54
                ),
                widget.CPU(
                    background='#bd93f9',
                    foreground='#8be9fd',
                    format='CPU {freq_current}GHz {load_percent}%',
                    padding = 2,
                ),
                widget.TextBox(
                    text = '',
                    background='#bd93f9',
                    foreground='#6272a4',
                    padding = 0,
                    fontsize = 54
                ),
                widget.Memory(
                    background='#6272a4',
                    format='{MemUsed:.0f}{mm}/{MemTotal:.0f}{mm}',
                    foreground='#bd93f9',
                    measure_mem='M',
                ),
                widget.TextBox(
                    text = '',
                    background='#6272a4',
                    foreground='#bd93f9',
                    padding = 0,
                    fontsize = 54
                ),
                widget.Net(
                    background='#bd93f9',
                    foreground='#8be9fd',
                    interface='enp4s0'
                ),
                widget.TextBox(
                    text = '',
                    background='#bd93f9',
                    foreground='#6272a4',
                    padding = 0,
                    fontsize = 54
                ),
                widget.Clock(
                    background='#6272a4',
                    foreground='#8be9fd',
                    format="%m/%d/%y %a %H:%M",
                ),
                widget.TextBox(
                    text = '',
                    background='#6272a4',
                    foreground='#bd93f9',
                    padding = 0,
                    fontsize = 54
                ),
                widget.WidgetBox(
                    background='#bd93f9',
                    foreground='#8be9fd',
                    widgets=[
                        widget.PulseVolume(
                            background='#bd93f9',
                            foreground='#8be9fd',
                            volume_app='pavucontrol'
                        ),
                        widget.DF(
                            background='#bd93f9',
                            foreground='#8be9fd',
                            partition='/',
                            visible_on_warn=False,
                            measure='G',
                            padding=None,
                            update_interval='60'
                        ),
                ]),
                widget.QuickExit(
                    background='#6272a4',
                    foreground='#8be9fd',
                    default_text='[ Exit ]'
                ),
                widget.Systray(),
                #widget.Mirror
            ],
            24,
            margin=4,
            opacity=0.60
        ),
    ),
]


###Drag Floating Windows:
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button2", lazy.window.bring_to_front()),
    Click([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
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

wmname = "LG3D"
