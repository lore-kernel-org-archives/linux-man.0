From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] Makefile: fix temporary file handling and improve
 check-groff-warnings
Date: Mon, 18 Apr 2016 13:51:32 +0100
Message-ID: <5714D854.3010404@gmail.com>
References: <20160414010434.1a7bdcfc.alex.miller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160414010434.1a7bdcfc.alex.miller-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Miller <alex.miller-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alex,

On 04/14/2016 12:04 AM, Alexander Miller wrote:
> Hello Michael,
> 
> a while ago I noticed that every time make is run a new empty file
> would be created in /tmp. This has been annoying me since, so I
> decided to have a look.
> 
> The first patch fixes this problem; the file is crated only for
> "make check-groff-warnings" where it is needed.
> While at it, I improved various bits for that target (in patch 2).
> Finally, the last 2 patches are purely cosmetic trivial changes.

I've applied all 4 patches. Thanks!

> I also noticed that check-groff-warnings works only with man-db.
> I happened to test it on a box with plain man and got a usage
> error for every man page. I haven't included a patch to silence
> these errors, since the old man has no equivalent for the --warnings
> option, and so I think it doesn't make sense to support it, you'd
> get the default warnings only. But if you like, I can provide a
> patch.

Best not to worry about it, I'd say.

Cheers,

Michael

> ---
> Alexander Miller (4):
>   Makefile: Don't leave $(GROFF_LOG) files behind
>   Makefile: Improve recipe for "check-groff-warnings" target
>   Makefile: wsfix (trailing space)
>   Makefile: Remove line continuation at end of "install" recipe
> 
>  Makefile | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
