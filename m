From: Mark Seaborn <mseaborn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] mprotect(2): mention effect of READ_IMPLIES_EXEC
 personality flag
Date: Fri, 6 Feb 2015 18:02:46 -0800
Message-ID: <CAL82V5M701JvwLnURQkO=anrAu8pp=bOZRZbCKN_umg7VxVdUA@mail.gmail.com>
References: <w2ke1cf9ca11004230931yff731f6gb45134c3d0d51cbe@mail.gmail.com> <54D353CB.9050401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D353CB.9050401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 5 February 2015 at 03:28, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 04/23/2010 06:31 PM, Mark Seaborn wrote:
> > I puzzled over mprotect()'s effect on /proc/*/maps for a while
> > yesterday -- it was setting "x" without PROT_EXEC being specified.
> > Here is a patch to add some explanation.
>
> Long after the fact... But applied now. Thanks, Mark.

Wow, thanks!  What Git branch did you apply the fix on?  I looked at
http://git.kernel.org/cgit/docs/man-pages/man-pages.git/tree/man2/mprotect.2,
but I didn't see the change there.

Cheers,
Mark
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
