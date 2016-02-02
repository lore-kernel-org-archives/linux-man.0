From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo on shmget manpage
Date: Tue, 2 Feb 2016 20:19:48 +0100
Message-ID: <56B10154.60906@gmail.com>
References: <CAPHDHKmCeGq=B7ta3+TwfKGaZSw+Vy0G2cwHMhJhQfn5shtyHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPHDHKmCeGq=B7ta3+TwfKGaZSw+Vy0G2cwHMhJhQfn5shtyHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fernando Monteiro <nandospm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Fernando,

On 02/02/2016 11:14 AM, Fernando Monteiro wrote:
> Hi
> 
> There is a typo on return value section of shmget manpage.
> 
> On success, a valid shared memory identifier is returned.  On *errir*, -1
>        is returned, and errno is set to indicate the error.

Thanks for the report, but that typo was fixed about 20 releases ago!
Always best to check the git version or http://man7.org/linux/man-pages/
to see if an error is still present in the latest pages.

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
