From: chrubis-AlSwsSmVLrQ@public.gmane.org
Subject: Re: [PATCH] vmsplice.2: vmsplice() does not fail on nr_segs=0
Date: Mon, 14 Jul 2014 14:57:03 +0200
Message-ID: <20140714125703.GA22358@rei.suse.cz>
References: <20140625141235.GA10090@rei.Home>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140625141235.GA10090-HSzIOc4LzcM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <metan-+ZI9xUNit7I@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi!
> This case is no-op and no error is returned.
> 
> See fs/splice.c vmsplice syscall which contains:
> 
>         if (unlikely(nr_segs > UIO_MAXIOV))
>                 return -EINVAL;
>         else if (unlikely(!nr_segs))
>                 return 0;
> 
> and looking at the git log suggests that this snipped was always there.


Ping?

-- 
Cyril Hrubis
chrubis-AlSwsSmVLrQ@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
