From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Adding reentrancy information to safety notes?
Date: Tue, 30 Dec 2014 20:53:05 +0100
Message-ID: <54A302A1.3020706@gmail.com>
References: <54A2C8A6.9050100@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A2C8A6.9050100-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Carlos,

You better turn on the spell checker in your mailer (or update
its dictionary) ;-). ("Ree_n_tran*")

On 12/30/2014 04:45 PM, Carlos O'Donell wrote:
> Michael, Peng, Alex,
> 
> We have had some recent discussions about reetrancy safety
> of dlopen. My goal is going to be to ensure that dlopen
> and in general the intefaces in libdl remain reetrant to
> allow user implemented malloc to use these interfaces to
> load libraries that themselves may have reetrant helper
> functions.
> 
> This raises the question: How do we clearly document which
> functions are reetrant?
> 
> My thoughts are as follows:
> * Add some introductory text about reetrancy in the safety
>   section. This text will discuss that AS-safe functions
>   are reetrant because they must be to be AS-safe. Note that
>   reetrant functions need not be AS-safe nor MT-safe.

Sounds good to me.

> * Add a "R-Safe" and "R-Unsafe" to indicate safety with respect
>   to reetrancy.

Sounds odd to me. Why not just say "Reentrant" and "Nonreentrant",
rather than add new terms?

> * Immediately annotate all AS-safe functions as R-Safe.

Okay -- modulo preceding point

> * Review all of the "_r" functions for reetrance safety.

Okay.
 
> Thoughts?
> 
> My review of other Unices indicates this is probably the
> last type of safety that documented by other systems.

I am not quite clear what you mean by "last...documented".
Do you mean: few other systems document it?

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
