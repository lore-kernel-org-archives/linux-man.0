From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recv.2: remove duplicate paragraph for MSG_ERRQUEUE
Date: Sat, 31 Dec 2016 20:34:14 +0100
Message-ID: <c63632ce-f016-5318-2291-40643e221d0c@gmail.com>
References: <20161230213328.31980-1-vincent@bernat.im>
 <3cb21035-4bc7-da18-febb-e2a919ba02c0@gmail.com> <m3bmvs9rg3.fsf@luffy.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <m3bmvs9rg3.fsf-PWwKhitvBKI@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Bernat <vincent-5wNQGcxKXm8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/31/2016 02:08 PM, Vincent Bernat wrote:
>  ❦ 31 décembre 2016 11:27 +0100, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> :
> 
>>> The removed paragraph is identical to the one a few lines above.
>>
>> Gosh! The duplication was injected back in man-pages-1.34 (2000)!
>> Back in man-pages-1.33, it was the second instance only that was 
>> present, so I'm inclined to remove the other instance (opposite 
>> of your patch). What do you think?
> 
> I think both solutions are fine.

Thanks. I just wanted to check if you had some particular reason for
removing the second instance, rather than the first. I removed the first.

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
