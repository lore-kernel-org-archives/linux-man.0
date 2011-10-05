From: Guillem Jover <guillem-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: Updates to information about man pages from other Debian packages
Date: Wed, 5 Oct 2011 09:48:41 +0200
Message-ID: <20111005074841.GA3065@gaara.hadrons.org>
References: <20111005054109.GA25122@gaara.hadrons.org>
 <CAKgNAkjM_JaxmJvaYL-sV43COU==xkOAtjJmPP4+7iUp4c6K8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKgNAkjM_JaxmJvaYL-sV43COU==xkOAtjJmPP4+7iUp4c6K8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, 2011-10-05 at 08:23:39 +0200, Michael Kerrisk wrote:
> So, looking on an Ubuntu system, I see
> 
> $ dpkg-query -f '${Maintainer}\n' -W mount
> Ubuntu Core Developers <ubuntu-devel-discuss-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org>
> 
> Which is a little less informative than:
> 
> $ dpkg -p mount | grep Maintainer
> Maintainer: Ubuntu Core Developers <ubuntu-devel-discuss-nLRlyDuq1AZFpShjVBNYrg@public.gmane.org>
> Original-Maintainer: LaMont Jones <lamont-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Ah, right. Well the same consideration as with other
downstream/upstream applies here, for each distribution the patches
should be going to their respective bug tracking systems, for Ubuntu to
Launchpad, and for Debian to its debbugs instance. Barring a BTS (for
other derivatives) the next option should be directly to the maintainer.

So, for Debian the preferred interface rather than mailing directly the
maintainer is to use the reportbug program (from the same package
name). I'd link to <http://www.debian.org/Bugs/Reporting> to avoid
having to duplicate (even if partially) that information, though.

In any case to retrieve the maintainer information (including
information from derivatives), I'd recommend using something like:

,---
  $ dpkg-query -s mount | grep Maintainer
  Maintainer: LaMont Jones <lamont-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
`---

which is certainly easier to deal with than something like this:

,---
  $ dpkg-query -f '${Maintainer}\n' -W mount
  LaMont Jones <lamont-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
  $ dpkg-query -f '${Original-Maintainer}\n' -W mount

  $
`---

(The second command would return a name on Ubuntu for example, but not
on Debian.)

> I don't have a Debian system handy. Looking at
> http://man7.org/linux/man-pages/man_pages_other.html, could you show
> the complete commands plus output as you would expect to do it on your
> system.

HTH, if not, let me know and I'll try to provide more information.

thanks,
guillem
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
