From: Daniel Lublin <daniel-oWHhe339MlyzQB+pC5nmwQ@public.gmane.org>
Subject: Re: minus signs instead of hyphen-minuses in man-pages-posix-2013-a
 (was: man 1 getopts example code - w
Date: Fri, 9 Feb 2018 08:22:36 +0100
Message-ID: <20180209072236.GA7877@ot.lublin.se>
References: <20171203152541.GB8608@imap.roeserundroeser.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171203152541.GB8608-apn8OiFnwzd6HCqoLBzdJtgH40HQ1Lc/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: nico-hByViTdnw2w@public.gmane.org, sir-ADJa8SdUZZIAvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Trying to pick up on this again -- dashes in the POSIX man-pages are mostly
of the wrong sort, and makes it difficult to search for options in the
pages. (Cc Drew DeVault, yes I came across this from your blog post)

On 2017-12-03 15:25:41, Nico R <nico-hByViTdnw2w@public.gmane.org> wrote:
> On 2017-03-13T03:31:45, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> > On 27 Feb 2017 15:16, Marcus Geiger wrote:
> > > in the examples section of `man 1 getopts`, every dash/minus used in the
> > > example code cannot be parsed by bash. vi claims it's 0x2212 instead of 0x2d.
> > > 
> > > I'm on Ubuntu 16.04 with bash 4.3.46(1)-release. Unfortunately I couldn't find
> > > the source code for this man page, but the current online pages entry also has
> > > this problem: http://man7.org/linux/man-pages/man1/getopts.1p.html
> > > 
> > > The containing package is:
> > > 
> > >    $ dpkg -S $(man -w 1 getopts)
> > >    manpages-posix: /usr/share/man/man1/getopts.1posix.gz
> > 
> > looks like a bug in the man page itself.  it uses \(mi instead of \- in
> > the example code.  might be an artifact of the conversion process though
> > as iirc, the posix pages are generated.
> 
> I agree. As the matter seems not to have been handled yet, I’m bringing this
> up again.
> 
> Some more detail: it seems that all POSIX man pages are affected, more or
> less.

[...]

> I would have tried to help a bit more with this issue, but I do not know
> what/where the sources for the POSIX man pages are, I do not know how the
> POSIX man pages are generated from their sources, and I could not find any
> conversion scripts. Can anyone explain the process, please?

I found https://www.kernel.org/doc/man-pages/todo.html which states:

  Status: completed in January 2014 (publication of the POSIX.1-2013 pages).

And looking in the man-pages website repo, Michael Kerrisk committed this.
So if you Michael also did the actual update of the POSIX man-pages, do you
have pointers to the sources for them, and any scripts which where used to
process them (according to todo.html) to produce the man-files?

/Daniel
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
