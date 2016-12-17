From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Grammatical Error
Date: Sat, 17 Dec 2016 14:22:37 +0100
Message-ID: <CAKgNAkixPtF8szWMuwyz+mbvWSfsGhm9X07JLnAWyQKNdkzMVg@mail.gmail.com>
References: <280bcd08-c107-d43c-8422-e30687eb7140@riseup.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <280bcd08-c107-d43c-8422-e30687eb7140-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: psybin <psybin-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 17 December 2016 at 11:41, psybin <psybin-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> wrote:
> Hi friends,
> I believe I've found a simple grammatical error in the man pages:
>
> readv(2) - readv, writev, preadv, pwritev
>
> RETURN VALUE
>         From: "Note that is not an error for a successful call..."
>         To:   "Note that it is not an error for a successful call..."
>
> This error is present in the latest version available in the Git repo.

Thanks, Alex. Fixed!

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
