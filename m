From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] statfs.2: Update + Note for pipe() fds
Date: Wed, 11 Jun 2014 07:22:26 +0200
Message-ID: <CAKgNAkhXpoqzxJyiQaGjw6KbTaHLgX7ztDM1hCXTLbDbMYPmog@mail.gmail.com>
References: <20140610160416.GA20354@rei.Home> <53976A4D.1010501@gmail.com> <20140610212940.GA22111@rei.Home>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140610212940.GA22111-HSzIOc4LzcM@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

>> And I just want to check. Was it really ff0c7d15f9787b7e8c601533c01529
>> that caused the breakage? At a quick glance, that patch looks
>> unrelated, but perhaps something very subtle is going on...
>
> Yep, it took me a while to notice. If you pass NULL as super_operations
> to mount_pseudo() function, which was the case before the patch, default
> structure super_operations (with contains only simple_statfs) is used
> (have a look at mount_pseudo() in fs/libfs.c). This patch added
> pipefs_ops without the statfs callback and passed it instead of the
> NULL.

Ahh -- okay. Thanks for the explanation.

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
