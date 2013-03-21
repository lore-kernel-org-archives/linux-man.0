From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: user_namespaces(7) man page
Date: Thu, 21 Mar 2013 16:52:58 +0100
Message-ID: <CAKgNAkiMOGtuCyvhSpku65p1ZJ5SfdYcOxxAU+H-mk-76wqOPw@mail.gmail.com>
References: <CAKgNAkh1TEkQiQ2g2jhbNzVTwpDYOreJt3rAukZCP9H1wh0mLQ@mail.gmail.com>
 <20130315153811.GD24305@sergelap>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130315153811.GD24305@sergelap>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Hallyn <serge.hallyn-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Containers <containers-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vasily Kulikov <segoon-cxoSlKxDwOJWk0Htik3J/w@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Serge,

On Fri, Mar 15, 2013 at 4:38 PM, Serge Hallyn <serge.hallyn-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org> wrote:
> Hi,
>
> you mention that after creating a new user namespace you at first have
> all capabilities in the new ns.  You don't explicitly mention (or I
> missed it - I did see the mention of securebits) that if you want to
> keep those capabilities after doing an exec, you need to first have
> something mapped to uid 0 in the userns, and do setuid(0).

Good point. I'll add something on that.

> You might not want to list manpages from other projects,

Actually, not a problem. Many of the pages in my set already do this.

> but Eric's
> shadow patches introduce some good new manpages as well.  Those aren't yet
> accepted upstream, but if/when they are then mention at least of
> subuid(5), subgid(5), and newuidmap(1) and newgidmap(1) might be good.

I'll add those.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
