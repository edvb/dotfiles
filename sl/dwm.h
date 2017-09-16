/* See LICENSE file for copyright and license details. */

/* appearance */
static const char *fonts[] = {
	"FantasqueSansMono-Regular:pixelsize=18",
	"FontAwesome:pixelsize=14"
};
static const char dmenufont[]       = "monospace:size=10";
static const char normbordercolor[] = "#002b36";
static const char normbgcolor[]     = "#073642";
static const char normfgcolor[]     = "#93A1A1";
static const char selbordercolor[]  = "#268bd2";
static const char selbgcolor[]      = "#268bd2";
static const char selfgcolor[]      = "#eee8d5";
static const char normmarkcolor[]   = "#859900"; /*border color for marked client*/
static const char selmarkcolor[]    = "#2aa198"; /*border color for marked client on focus*/
static const char urgbordercolor[]  = "#dc322f";
static const unsigned int borderpx  = 1;         /* border pixel of windows */
static const unsigned int gappx     = 6;         /* gap pixel between windows */
static const unsigned int snap      = 32;        /* snap pixel */
static const unsigned int systraypinning = 0;    /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;    /* systray spacing */
static const int systraypinningfailfirst = 1;    /* 1: if pinning fails, display systray on the first monitor, 0: display systray on the last monitor*/
static const int showsystray        = 1;         /* 0 means no systray */
static const int showbar            = 1;         /* 0 means no bar */
static const int topbar             = 1;         /* 0 means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{  NULL,      NULL,      "bar",       0,            1,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

#include "htile.c"
#include "deck.c"
#include "centered.c"
#include "fibonacci.c"
#include "gaplessgrid.c"
#include "horizgrid.c"
#include "tcl.c"
static const Layout layouts[] = {
	/* symbol   arrange function */
	{ "[]=",    tile        },
	{ "><>",    NULL        }, /* floating */
	{ "[+]",    htile       },
	{ "D  ",    deck        },
	{ "[o]",    centered    },
	{ "[@]",    spiral      },
	{ "[\\]",   dwindle     },
	{ "###",    gaplessgrid },
	{ "###",    horizgrid   },
	{ "|||",    tcl         },
	{ "[M]",    monocle     },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "menu.sh", NULL };
static const char *termcmd[]  = { "tabbed", "-c", "st", "-w", NULL };
static const char *calcmd[]   = { "gsimplecal", NULL };

#include "push.c"
#include "shiftview.c"
#include "switchcol.c"
#include "zoomswap.c"
static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_z,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_t,      spawn,          {.v = termcmd  } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },

	{ MODKEY,                       XK_l,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_h,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_l,      pushdown,       {0} },
	{ MODKEY|ShiftMask,             XK_h,      pushup,         {0} },
	{ MODKEY|Mod1Mask,              XK_l,      shiftview,      {.i = +1 } },
	{ MODKEY|Mod1Mask,              XK_h,      shiftview,      {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_j,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_k,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_j,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_k,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },

	{ MODKEY,                       XK_Return, switchcol,      {0} },
	{ MODKEY|ShiftMask,             XK_Return, zoomswap,       {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_x,      killclient,     {0} },

	{ MODKEY,                       XK_semicolon,togglemark,   {0} },
	{ Mod1Mask,                     XK_Tab,      swapfocus,    {0} },
	{ Mod1Mask|ShiftMask,           XK_Tab,      swapclient,   {0} },

	{ MODKEY|ControlMask,           XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ControlMask,           XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ControlMask,           XK_h,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ControlMask,           XK_d,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ControlMask,           XK_c,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY|ControlMask,           XK_s,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY|ControlMask|ShiftMask, XK_s,      setlayout,      {.v = &layouts[6]} },
	{ MODKEY|ControlMask,           XK_g,      setlayout,      {.v = &layouts[7]} },
	{ MODKEY|ControlMask|ShiftMask, XK_g,      setlayout,      {.v = &layouts[8]} },
	{ MODKEY|ControlMask,           XK_r,      setlayout,      {.v = &layouts[9]} },
	{ MODKEY|ControlMask,           XK_m,      setlayout,      {.v = &layouts[10]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },

	{ Mod1Mask,                     XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },

	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = calcmd } },
	{ ClkClientWin,         Mod1Mask,       Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         Mod1Mask,       Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

#define NUMCOLORS 8
static const char colors[NUMCOLORS][MAXCOLORS][8] = {
  // border    fg         bg
  { "#002b36", "#93A1A1", "#073642" },  // normal
  { "#268bd2", "#eee8d5", "#268bd2" },  // selected
  { "#002b36", "#b58900", "#073642" },  // yellow
  { "#002b36", "#cb4b16", "#073642" },  // orange
  { "#002b36", "#dc322f", "#073642" },  // red
  { "#002b36", "#d33682", "#073642" },  // pink
  { "#002b36", "#6c71c4", "#073642" },  // violet
  /* { "#002b36", "#268bd2", "#073642" },  // blue */
  /* { "#002b36", "#2aa198", "#073642" },  // cyan */
  { "#002b36", "#859900", "#073642" }  // green
};
