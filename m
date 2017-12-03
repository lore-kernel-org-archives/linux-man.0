From: "Nico R." <nico-hByViTdnw2w@public.gmane.org>
Subject: minus signs instead of hyphen-minuses in man-pages-posix-2013-a
 (was: man 1 getopts example code - wrong dash)
Date: Sun, 3 Dec 2017 16:25:41 +0100
Message-ID: <20171203152541.GB8608@imap.roeserundroeser.de>
References: <20170313033145.GR31094@vapier>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170313033145.GR31094@vapier>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 2017-03-13T03:31:45, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> On 27 Feb 2017 15:16, Marcus Geiger wrote:
> > in the examples section of `man 1 getopts`, every dash/minus used in the
> > example code cannot be parsed by bash. vi claims it's 0x2212 instead of 0x2d.
> > 
> > I'm on Ubuntu 16.04 with bash 4.3.46(1)-release. Unfortunately I couldn't find
> > the source code for this man page, but the current online pages entry also has
> > this problem: http://man7.org/linux/man-pages/man1/getopts.1p.html
> > 
> > The containing package is:
> > 
> >    $ dpkg -S $(man -w 1 getopts)
> >    manpages-posix: /usr/share/man/man1/getopts.1posix.gz
> 
> looks like a bug in the man page itself.  it uses \(mi instead of \- in
> the example code.  might be an artifact of the conversion process though
> as iirc, the posix pages are generated.

I agree. As the matter seems not to have been handled yet, I’m bringing this up again.

Some more detail: it seems that all POSIX man pages are affected, more or less.

For example, look at man1p/awk.1p in man-pages-posix-2013-a: it says
|        −F sepstring
|                  Define the input field separator. This option shall be equivalent to:
| 
|                      -v FS=sepstring

Note that the first occurrence is a MINUS SIGN (U+2212), whereas the second is a HYPHEN-MINUS (U+002D).

The MINUS SIGN is wrong for options. Options start with a HYPHEN-MINUS.

Due to the bug, searching for options in POSIX man pages becomes a real pain.


Some people may not see this behavior, this is most probably a result of their locale. You can run

  $ env LC_CTYPE=POSIX /usr/bin/man 1p awk

and you will see a HYPHEN-MINUS everywhere, but this is due to the limited character set, and character translations in place. Setting LC_CTYPE is just a workaround, and you’ll also lose other characters!


I would have tried to help a bit more with this issue, but I do not know what/where the sources for the POSIX man pages are, I do not know how the POSIX man pages are generated from their sources, and I could not find any conversion scripts. Can anyone explain the process, please?
-- 
Nico
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
