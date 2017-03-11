/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
	[INIT]   = "#002b36",   /* after initialization */
	[INPUT]  = "#268bd2",   /* during input */
	[FAILED] = "#dc322f",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;
