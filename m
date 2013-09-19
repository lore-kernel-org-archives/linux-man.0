From: Felix Janda <felix.janda-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: POSIX.1-2013 man pages for review
Date: Thu, 19 Sep 2013 19:47:57 +0200
Message-ID: <20130919174757.GA1201@gauss>
References: <523AAEEE.5090602@gmail.com>
 <523AB978.2080607@barfooze.de>
 <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAki+jTS9rkORvcPNxWcStNjnNTnt_jqBYcfoaYm7d4GxqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John Spencer <maillist-musl-Am5OCHYCrcUb1SvskN2V4Q@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Josey <ajosey-7882/jkIBncuagvECLh61g@public.gmane.org>, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Matthew Dempsky <matthew-bfSpyvURsAhAfugRpC6u6w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi all,

Michael Kerrisk (man-pages) wrote:
> Hi John,
> 
> Thanks for taking a look at this.
> 
> [...]
> 
> >> these pages, I would like to have further review of the pages,
> >> and I am soliciting that review with this mail
> >>
> >> The main purposes of this review are to:
> >> * detect any problems injected by the conversion process
> >>    (e.g., spurious text added or deleted)
> >> * find any formatting issues with the resulting pages.
> >
> >
> >
> > i've run a test script[0] using my own manpage viewer[1]
> > and attached the results. it seems that ~10% of the manpages use some
> > special groff features. i'd rather see these removed/replaced with something
> > nroff-compatible.
> 
> I just want to check where you're coming from John. You're working on
> musl, right? Does musl not use the work from the man-pages project? I
> ask, because some of the pieces that your script doesn't like are also
> used in the man-pages project. See below.
> 
> > [0] https://github.com/rofl0r/hardcore-utils/blob/master/tests/mantest.sh
> > [1] https://github.com/rofl0r/hardcore-utils/blob/master/man.c
> 
> Looking at your log:
> 
> > === status report  ===
> > total manpages        : 1143
> > buggy manpages        : 137
> > total failures        : 406
> > unique failures       : 12
> >
> > bug list:
> >     122 **** Unknown formatter command: .ne
> 
> Not sure about this one. From groff(7):
> 
>        .ne       Need a one-line vertical space.
>        .ne N     Need N vertical space (default scaling indicator v).
> 
> I'm not sure about the circumstances where these are being applied. Felix?

My script does not touch these. Seems to be ignored by nroff anyway. So the
next version of the script will strip them.

> >     106 **** Unknown formatter command: .TS
> >     106 **** Unknown formatter command: .TE
> 
> These two are heavily used for tables in the man-pages project itself.
> What's the problem/alternative?
>
> >      24 **** Unknown formatter command: .ce
> 
>        .ce       Center the next input line.
>        .ce N     Center following N input lines.
> 
> Is there an alternative?

These are added by the script for the table and figure captions. I
think it's done the same way in the old posix man pages.

> >      14 **** Unknown formatter command: .EQ
> >      14 **** Unknown formatter command: .EN
> 
> These are groff escapes to eqn(1). Is there an alternative?

Not many pages make use of eqn. We could maybe let eqn pass over
the man pages before publishing them.

> >      11 **** Unknown formatter command: .nr
> 
> Not sure about this. Maybe Felix has a comment.

Should be stripped.

> >       3 **** Unknown formatter command: .T&
> 
> I suspect that this is a macro that should have been converted during
> the translation. Felix?

Appears only in pax in the "Table: Octet-Oriented cpio Archive Entry".
Seems to be to have multiple headers in the table. Seems to be standard
tbl feature.

> >       2 **** Unknown formatter command: .tr
> 
> groff(7) says:
> 
>        .tr abcd...
>                  Translate a to b, c to d, etc. on output.
> 
> Looks like this one was in the original source. Not sure whether we
> need to keep it. Felix?

Should be stripped.

> >       2 **** Unknown formatter command: .in
> 
> This is heavily used in the man-pages project (albeit little used
> here). Could be converted to .RS/.RE, I suppose.

Appears only in pax. Can be stripped.

> >       1 **** Unknown formatter command: .Im
> 
> Looks to me as though this one should have been fixed in the
> conversion, but was missed by the script. Felix, could you take a
> look?

This is a bug in the source. I added a patch to fix it, but it was
apparently not applied...

Cheers,
Felix
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
