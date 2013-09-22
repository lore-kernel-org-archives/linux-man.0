From: Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Sun, 22 Sep 2013 21:25:21 +0200
Message-ID: <20130922192521.GA14208@gauss>
References: <523AAEEE.5090602@gmail.com>
 <523AB978.2080607@barfooze.de>
 <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ@mail.gmail.com>
 <523C48EF.5080309@barfooze.de>
 <20130920175410.GA1092@gauss>
 <523D8F06.9060801@barfooze.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <523D8F06.9060801-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

John Spencer wrote:
[...]
> >> as such i'd love to see the POSIX manpages project actually deliver
> >> portable manpages, instead of assuming that the full-blown GNU userspace
> >> stack is available.
> >
> > Could you give a definition of this portable nroff syntax?
> 
> i have a hard time finding detailed specs, but the commands implemented 
> by the manviewer are sufficient to display 75% of all manpages on a full 
> desktop sabotage linux install with 8000 manpages without a single 
> unknown command, despite a lot of packages using their own special 
> format. for example anything xorg related uses "XMan", anything 
> BSD-related mdoc, and perl manpages use again another set of commands.
> 
> so this here seems to represent a very common subset:
> 	{"\\\"", 0, 0},
> 	{"nh", 0, 0},		/* This program never inserts hyphens */
> 	{"hy", 0, 0},		/* This program never inserts hyphens */
> 	{"PD", 0, 0},		/* Inter-para distance is 1 line */
> 	{"DT", 0, 0},		/* Default tabs, they can't be non-default! */
> 	{"IX", 0, 0},		/* Indexing for some weird package */
> 	{"Id", 0, 0},		/* Line for RCS tokens */
> 	{"BY", 0, 0},
> 	{"nf", 0, 1},		/* Line break, Turn line fill off */
> 	{"fi", 0, 2},		/* Line break, Turn line fill on */
> 	{"sp", 0, 3},		/* Line break, line space (arg for Nr lines) */
> 	{"br", 0, 4},		/* Line break */
> 	{"bp", 0, 5},		/* Page break */
> 	{"PP", 0, 6},
> 	{"LP", 0, 6},
> 	{"P", 0, 6},		/* Paragraph */
> 	{"RS", 0, 7},		/* New Para + Indent start */
> 	{"RE", 0, 8},		/* New Para + Indent end */
> 	{"HP", 0, 9},		/* Begin hanging indent (TP without arg?) */
> 	{"ad", 0, 10},		/* Line up right margin */
> 	{"na", 0, 11},		/* Leave right margin unaligned */
> 	{"ta", 0, 12},		/* Changes _input_ tab spacing, right? */
> 	{"TH", 1, 1},		/* Title and headers */
> 	{"SH", 1, 2},		/* Section */
> 	{"SS", 1, 3},		/* Subsection */
> 	{"IP", 1, 4},		/* New para, indent except argument 1 */
> 	{"TP", 1, 5},		/* New para, indent except line 1 */
> 	{"B", 2, 22},		/* Various font fiddles */
> 	{"BI", 2, 23},
> 	{"BR", 2, 21},
> 	{"I", 2, 33},
> 	{"IB", 2, 32},
> 	{"IR", 2, 31},
> 	{"RB", 2, 12},
> 	{"RI", 2, 13},
> 	{"SB", 2, 42},
> 	{"SM", 2, 44},
> 	{"C", 2, 22},		/* PH-UX manual pages! */
> 	{"CI", 2, 23},
> 	{"CR", 2, 21},
> 	{"IC", 2, 32},
> 	{"RC", 2, 12},
> 	{"so", 3, 0},

Ok, but that seems a bit arbitrary.

How about escape sequences?

> >> the alternative is to apply the tbl preprocessor before shipping the
> >> manpages and instead include the preprocessed output (cleaned up from
> >> groffisms as well)
> >
> > I'm not sure if your man can handle the output of tbl. Attached is the
> > output when run against one of the tables in pax. It looks rather
> > hopeless. Also the fictional script cleaning up the GNU tbl output is
> > likely going to be dependent on a specific tbl version.
> >
> > For eqn it seems much more likely to me that one can produce output
> > which makes your man implementation happy. The equations are already
> > hacked to make them better suitable for nroff.
> 
> i agree that the output of tbl is even worse...

For eqn it looks similar. I think I identified the interesting part of
its output, but it still contains a lot of escape sequences. There are
just not that many pages using eqn (i.e. 8) to make me write an eqn
preprocessor with acceptable nroff output.

> btw my research on http://www.troff.org/papers.html revealed that tbl 
> and eqn preprocessors existed back in the troff days, so this seems to 
> be a historical mistake rather than groff's fault ;)

You might also be interested in

http://plan9.bell-labs.com/7thEdMan/index.html

(In order to claim that .T& is classical I checked the original tbl manual.)

> >> as for the other groff specific formatter commands, i am refering to
> >> Felix' response: all of them can either be left away or in case of tbl
> >> and eqn the preprocessed source used instead.
> >
> > .ce remained open. Is there an alternative or could you just implement
> > that?
> 
> yes, that can easily be implemented as a nop on my side, without losing 
> valuable information.

Good.

Felix
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
