From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: timegm(3): behavior is not described in case of error
Date: Sun, 6 Nov 2016 04:30:39 -0700
Message-ID: <f4a367d4-8e94-dfd8-9316-c58589e8c1aa@gmail.com>
References: <20161025125816.GA29678@cventin.lip.ens-lyon.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161025125816.GA29678-d/FE5ZiCopwvkDgRb4gLyeMIjtZQB4uX@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Vincent,

On 10/25/2016 06:58 AM, Vincent Lefevre wrote:
> In the timegm(3) man page, the behavior is not described in case of
> error, i.e. if the result is not representable in a time_t (e.g.,
> with a huge year).
> 
> The glibc manual says:
> 
>      'timegm' is functionally identical to 'mktime' except it always
>      takes the input values to be Coordinated Universal Time (UTC)
>      regardless of any local time zone setting.
> 
> So, I assume that (time_t) -1 is returned in such a case, just like
> mktime.

Yes.

> The man page could add a sentence like the glibc manual one, or
> explicitly say what happens in case of error like in the mktime(3)
> man page.

I've added such a sentence. (Changes are pushed to Git.) 
Thanks for the report!

Cheers,

Michael

> This is mainly for the timegm() function. For the timelocal() function,
> the man page already says:
> 
>     The timelocal() function is equivalent to the POSIX standard
>     function mktime(3). [...]
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
