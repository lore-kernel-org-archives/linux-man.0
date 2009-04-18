From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: Would like to contribute .. but first some questions
Date: Sat, 18 Apr 2009 12:44:43 +0200
Message-ID: <20090418104443.GI21271@machine.or.cz>
References: <13413b8f0904160811k77b142eag3c3a2d85915f4174@mail.gmail.com> <cfd18e0f0904161656v61bf468eu63188a54c2c8fe45@mail.gmail.com> <13413b8f0904170154x2ecf8135kad34b5099978aaa5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <13413b8f0904170154x2ecf8135kad34b5099978aaa5-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gueven Bay <gueven.bay-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  Hi,

On Fri, Apr 17, 2009 at 10:54:21AM +0200, Gueven Bay wrote:
> >> 2) I would like to contribute man pages for drivers like the
> >> (Free|Net|Open)BSD man pages have.
> >> Here
> >> http://www.kernel.org/doc/man-pages/online/dir_section_4.html
> >> are no driver man pages like for example these listed :
> >> http://www.freebsd.org/cgi/man.cgi?query=aha&sektion=4&apropos=0&manpath=FreeBSD+7.1-RELEASE
> >> (Adaptec SCSI host adapter driver)
> >> http://www.freebsd.org/cgi/man.cgi?query=aue&sektion=4&apropos=0&manpath=FreeBSD+7.1-RELEASE
> >> (ADMtek AN986 Pegasus USB Ethernet driver)
> >> Do you not have such driver man pages because of missing contributers  who write these
> >> or
> >> is there some "technical" reason that such man pages are or maybe cannot be written?
> 
> (Maybe there are no driver man pages because this project will not in
> any form include them in its
> releases - for whatever reason -
> maybe it is only because no one ever wrote a driver man page. But what
> is the real reason?
> If I write some will it go into the man pages project or should I
> collect them in my own repo.)

  e.g. sk98lin(4) has a manpage. I think the main reason why there are
almost no driver manapges is that the most of stuff gets documented in
/usr/src/linux/Documentation/ if at all by tradition and there are many
more (subjectively?) more useful documentation projects to work on that
documenting drivers (where you only very rarely actually need to tweak
anything nowadays, anyway).

> >> 3) On which version of the kernel/glibc do you write the man pages?
> >> The current stable version? Or
> >> the development trunk (head) of the kernel and glibc?
> 
> ( Do you use kernel 2.6.29 for writing the man pages or is the actual
> man-pages project
> "stuck" in an older version like 2.6.19 or so - for some technical
> reason like "stability" or so - ?
> What is the case with glibc? Do you check out the newest development
> tree or use some distro specific
> version? )

  The last stable release of kernel and glibc is being documented (e.g.
new glibc CVS additions are documented usually only after new glibc
version is tagged).

-- 
				Petr "Pasky" Baudis
The average, healthy, well-adjusted adult gets up at seven-thirty
in the morning feeling just terrible. -- Jean Kerr
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
