From: Jon Jensen <jon-O9fzpki4YnJWk0Htik3J/w@public.gmane.org>
Subject: Re: Subject: [PATCH] Correct description of
 /proc/sys/kernel/random/entropy_avail
Date: Tue, 13 Dec 2016 14:20:05 -0500 (EST)
Message-ID: <alpine.LFD.2.20.1612131418460.2354@cevzz>
References: <alpine.DEB.2.00.1007221816280.641@nhtr.ovalna.fjrygre.arg> <CAKgNAkhy2USSCjznDuYw+verUXDG2JGCY0bsu1R80EMttrEzmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkhy2USSCjznDuYw+verUXDG2JGCY0bsu1R80EMttrEzmw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Tue, 13 Dec 2016, Michael Kerrisk (man-pages) wrote:

> Your email fell on the floor a few years ago. Sorry about that...
>
> Long after the fact, I've applied a slightly different patch:
>
> diff --git a/man4/random.4 b/man4/random.4
> index d4bd03f..4dbf585 100644
> --- a/man4/random.4
> +++ b/man4/random.4
> @@ -213,9 +213,8 @@ The files in the directory
> device:
> .TP
> .I entropy_avail
> -This read-only file gives the available entropy.
> -Normally, this will be 4096 (bits),
> -a full entropy pool.
> +This read-only file gives the available entropy, in bits.
> +This will be a number in the range 0 to 4096.
> .TP
> .I poolsize
> This file

Your version looks great. Glad to have it fixed! I've handled a few 
patches many years after the fact myself, so I can chuckle about it from 
both sides of the transaction. :)

Thanks,
Jon

-- 
Jon Jensen
End Point Corporation
https://www.endpoint.com/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
