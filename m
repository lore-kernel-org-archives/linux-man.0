From: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Subject: Re: [PATCH] open,linkat: Update AT_EMPTY_PATH and O_PATH documentation
Date: Thu, 8 May 2014 13:34:49 -0700
Message-ID: <CALCETrWc-=z8zd9=gy8Dt2r9x391Mu6BXTzzAwkCLrXxo6Erxw@mail.gmail.com>
References: <818bf4803d4c8d20fa78a485bc57f8240a4f89b8.1376074657.git.luto@amacapital.net>
 <536B522A.9050906@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536B522A.9050906-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Thu, May 8, 2014 at 2:45 AM, Michael Kerrisk (man-pages)
<mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 08/09/2013 08:58 PM, Andy Lutomirski wrote:
>> The current text reflects the general worry in the kernel about
>> recipients of O_PATH fds being able to hardlink the referenced files.
>> It turns out that it was possible to link these files regardless of
>> any possible security concerns.
>>
>> Linux 3.11 removes the capability chech in AT_EMPTY_PATH.  I expect
>> that this functionality will be generally useful, so let's document it
>> better.
>
> Andy,
>
> Again, long after the fact, sorry. But, I've applied this now (with
> your spelling "chech" fixed in the change log, as you mentioned in the
> follow-on mail).
>
> Nicely constructed patch by the way: I liked the way that the additions
> to the linkat() text explained why capability check (and thus the man
> page text describing the need for that check) was removed.

Thanks.  Unfortunately, this was reverted in
f0cc6ffb8ce8961db587e5072168cac0cbc25f05 due to never-quite-explained
security issues. :(

--Andy
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
