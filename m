From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sigvec(3): example uses sigpause instead of sigmask
Date: Wed, 12 Feb 2014 09:17:23 +0100
Message-ID: <52FB2E13.4000904@gmail.com>
References: <87ppmt8iy3.fsf@Niukka.kon.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87ppmt8iy3.fsf-qL6Mw06ygtSujaP1ieU9EPUpdFzICT1y@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Olavi Niemitalo <kon-X3B1VOXEql0@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/11/2014 09:59 PM, Kalle Olavi Niemitalo wrote:
> In man-pages 3.58, sigvec(3) contains this example of sigmask:
> 
>            vec.sv_mask = sigmask(SIGQUIT) | sigpause(SIGABRT);
>                        /* Block SIGQUIT and SIGABRT during
>                           handler execution */
> 
> The second call should be sigmask(SIGABRT).
> 

Thanks, Kalle. Fixed.

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
