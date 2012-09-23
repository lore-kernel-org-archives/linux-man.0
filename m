From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Man page typo/omission
Date: Sun, 23 Sep 2012 16:11:08 +0200
Message-ID: <CAKgNAkirNRLv=h8dqhJ4Uvh5-YywUNJk4hCNXZthjsLuh70YSA@mail.gmail.com>
References: <50412197.4090908@comcast.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50412197.4090908-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rick Giles <lord_beavis-Wuw85uim5zDR7s880joybQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Rick

The groupadd(8) package is not in the man-pages set. See
http://www.kernel.org/doc/man-pages/man_pages_other.html

Cheers,

Michael

On Fri, Aug 31, 2012 at 10:41 PM, Rick Giles <lord_beavis-Wuw85uim5zDR7s880joybQ@public.gmane.org> wrote:
>
> Hello,
>
> Whilst looking through the man page GROUPADD(8), there is information missing from the 'Caveats' section in the sentence "Groupnames may only be up to characters long."  I believe the 32 is missing.
>
> I could not find the man pages version using the instructions at http://www.kernel.org/doc/man-pages/what_version.html resulted in:
>
> # rpm -qf $(man -w 8 groupadd)
> file /usr/man/cat8/groupadd.8.xz is not owned by any package
> error: file /home/rick/(<--: No such file or directory
> error: file /usr/man/man8/groupadd.8.gz): No such file or directory
>
> A quick Google search wasn't very helpful either.
>
>
> The system is Slackware 13.37.0 and has recently been updated using 'slackpkg'.
>
> Linux flexo 2.6.37.6-smp #2 SMP Sat Apr 9 23:39:07 CDT 2011 i686 Intel(R) Pentium(R) 4 CPU 2.80GHz GenuineIntel GNU/Linux
>
> Please let me know if there is anything you would like me to test or try.
>
> --
>
> Lord Beavis
> aka Rick Giles
> Web: Planet Express
> E-mail: lord_beavis-Wuw85uim5zDR7s880joybQ@public.gmane.org
> Twitter: Lord Beavis on Twitter
> MySpace: Lord Beavis on MySpace
>
> No Antivirus detection was used
> on this message by me.  I don't need it.
> You on the other hand, I'm not so sure about.




--
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
