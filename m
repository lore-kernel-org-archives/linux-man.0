From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: BLKGETSIZE64 not documented
Date: Fri, 17 Jan 2014 23:03:46 +1300
Message-ID: <CAKgNAkgbDWs5wa9hi11ACk5abJONDe3xsLb+FpdJuKQeEiyjfw@mail.gmail.com>
References: <20140117093029.GA29966@aym.net2.nerim.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140117093029.GA29966-956IwFboN44acnK+F/IuxqxOck334EZe@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Andre,

On Fri, Jan 17, 2014 at 10:30 PM, Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org> wrote:
> [Re-sending this as it seems to have fallen through the cracks.]
>
> No trace of BLKGETSIZE64 in
> www.kernel.org/pub/linux/docs/man-pages/man-pages-3.54.tar.xz
>
> I think it should be listed along BLKGETSIZE in sd(4).
>
> Probably applies to fd(4) and hd(4) too.
>
> And of course ioctl_list(2) but completing _that_ one sounds
> like a major project in itself. <g>
>
> Note that /usr/include/linux/fs.h quotes the argument as being
> "*u64" but I believe that it would be better written as
> "*uint64_t", which is standard.
>
> There may be other related ioctl()s missing, like those used in
> blockdev(8), I'm reporting the one I'm sure about.
>
> Thanks in advance.

Would you be able to write a patch for this?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
