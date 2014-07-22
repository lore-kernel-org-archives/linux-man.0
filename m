From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: memusage(1) man page
Date: Tue, 22 Jul 2014 21:02:04 +0200
Message-ID: <53CEB52C.1000705@gmail.com>
References: <53C8E244.2080901@redhat.com> <E1X84Kh-00041J-2z@fencepost.gnu.org> <53CE004A.3060706@gmail.com> <E1X9VbA-0002Bk-Ox@fencepost.gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1X9VbA-0002Bk-Ox-iW7gFb+/I3LZHJUXO5efmti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ams-mXXj517/zsQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Alfred,

On 07/22/2014 10:39 AM, Alfred M. Szmidt wrote:
> Jan, are you willing to assign copyright for those documenation bits
> to the FSF? I'll happily convert them into texinfo.
> 
>    I must say that this is an odd position to take. While it would be
>    nice to have documentation in the glibc manual, the glibc
>    developers did not bother to add anything to the manual when
>    writing these interfaces, so it hardly seems like anyone else is
>    obligated to do so (assuming that person wanted to even jump the
>    CLA hurdle...).  In any case, man pages does (good) pages that
>    describe the libc interfaces (including commands).
> 
> Someone sends a useful patch for glibc, but glibc is not documented
> using man pages so the natural thing is to have it in a format that
> can be accepted into glibc.

My problem was with your earlier statement: "This, memusagestat, and
mtrace should rather be put into the glibc manual." Perhaps it is
just a language misstep, but "should" implies that the author is
in some sense obliged to send documentation patches to the glibc 
manual, rather than elsewhere (e.g., man pages). I don't agree. 
(But, I'll repeat what I said earlier that it would be good if the
doc is in the glibc manual, also.)

> What is odd is to dismiss such a contribution 

I did not dismiss any contribution (or I am misunderstanding your point).

> and start making excuses
> as to why one should not "bother" updating the offical, and canonical
> documentation for glibc.  

I'm not making excuses. But, I am suggesting that the CLA is a 
rather pointless hurdle. Yes, we can argue that one; I've already
made my position clear and public elsewhere [1].

And, I can't help but make the observation that man-pages provides
documentation of the glibc interfaces that is frequently more thorough,
complete, and up-to-date than the "official and canonical" glibc manual.
I leave others to speculate how that situation could come about.

> And accusing people because they "couldn't
> be bothered" is quite an unfriendly attidue.  We all have things to
> do, and only have so much time to try and do everything.

I did not "accuse" anyone of anything, but it seems clear that
there are many cases where documentation was considered unimportant.
And, I probably could have expressed myself a little better and 
more temperately; I was reacting a little to what I perceived
was your implication (as I describe above).
 
Mostly, I was expressing frustration with a too common developer
attitude that the job ends at coding. For, without documentation
(i.e., a formal or informal spec), how can one tell where the
developer's implementation differs from their intention (i.e., a bug)?
Personally speaking, I've never considered a development project
complete if I did not also provide (extensive) documentation.

Cheers,

Michael

https://lwn.net/Articles/529522/

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
