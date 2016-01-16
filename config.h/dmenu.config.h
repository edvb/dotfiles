/* See LICENSE file for copyright and license details. */
/* vim: expandtab
 */
/* Default settings; can be overrided by command line. */

static Bool topbar = True;                  /* -b  option; if False, dmenu appears at bottom */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"FantasqueSansMono-16:light"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the elft of input field */
static const char *normbgcolor = "#073642"; /* -nb option; normal background                 */
static const char *normfgcolor = "#EEE8D5"; /* -nf option; normal foreground                 */
static const char *selbgcolor  = "#B58900"; /* -sb option; selected background               */
static const char *selfgcolor  = "#EEE8D5"; /* -sf option; selected foreground               */
static const char *outbgcolor  = "#00ffff";
static const char *outfgcolor  = "#000000";
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
