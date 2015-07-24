From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: nptl(7) man page
Date: Fri, 24 Jul 2015 09:57:46 +0200
Message-ID: <55B1EFFA.9070608@gmail.com>
References: <550ED3F4.1080403@gmail.com> <550F363B.801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <550F363B.801-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicholas Miell <nmiell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/22/2015 10:38 PM, Nicholas Miell wrote:
> On 03/22/2015 07:38 AM, Michael Kerrisk (man-pages) wrote:
>> Hello all,
>>
>> I wrote a short man page documented some of the details of
>> NPTL that might affect application developers. Review comments
>> would be most welcome.
>>
>> Thanks,
>>
>> Michael
> 
> POSIX specifies that process-shared pthread_mutex_t's can be manipulated 
> by independent processes, however the AMD64 and i386 versions of the 
> mutex structures are incompatible and cannot be shared.
> 
> This might be true of the other supposedly sharable primitives, I never 
> bothered to check the rest when I first noticed the problem with mutexes.

Nicholas,

Can you provide pointers to further information on this topic?

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
