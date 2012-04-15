From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: times (2) man page
Date: Mon, 16 Apr 2012 08:30:38 +1200
Message-ID: <CAKgNAkjaZEQMutvhrmgDrkqphaCosRPoPbum58em7whoDuNp1w@mail.gmail.com>
References: <4F8AF9BF.3010007@truelite.it>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F8AF9BF.3010007-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Simone,

On Mon, Apr 16, 2012 at 4:39 AM, Simone Piccardi <piccardi-TuvemuYfxVQ1GQ1Ptb7lUw@public.gmane.org> wrote:
> Hi, as found here:
>
> http://www.kernel.org/doc/man-pages/online/pages/man2/times.2.html
>
> at the end of the page, at the end of the BUGS section, there is:
>
> The same problem can occur when the return value wraps
> passed the maximum value that can be stored in clockid_t.
>
> But the return value is defined ad clock_t. I believe is a typo, but I'd
> like to be sure.

Thanks! Fixed for the next release (3.39).

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
