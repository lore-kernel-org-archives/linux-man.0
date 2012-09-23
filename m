From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] small improvement for aio_write.3
Date: Sun, 23 Sep 2012 15:38:46 +0200
Message-ID: <CAKgNAkg4osRdh_TUgPd-D+O-=wNW5J7YePpPqy1Uz+H=6axApQ@mail.gmail.com>
References: <20120923120508.20a16c1b@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120923120508.20a16c1b-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 23, 2012 at 10:05 AM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> Hello.

Thanks. Applied.

Cheers,

Michael

> @@ -33,7 +33,7 @@
>  The
>  .BR aio_write ()
>  function queues the I/O request described by the buffer pointed to by
> -.IR aiocb .
> +.IR aiocbp .
>  This function is the asynchronous analog of
>  .BR write (2).
>  The arguments of the call
>
>
> --
> Best Regards,
> Yuri Kozlov
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
