From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: clock(3) man page: precision vs accuracy
Date: Sat, 13 Sep 2014 19:33:19 -0700
Message-ID: <5414FE6F.2030603@gmail.com>
References: <20140912120804.GE4404@xvii.vinc17.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140912120804.GE4404-Ljv1qFl2dU+MDATNRQa/ww@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Lefevre <vincent-buymaDBGzMOsTnJN9+BGXg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/12/2014 05:08 AM, Vincent Lefevre wrote:
> http://man7.org/linux/man-pages/man3/clock.3.html contains:
> 
>        In glibc 2.17 and earlier, clock() was implemented on top of
>        times(2).  For improved precision, since glibc 2.18, it is
>                       ^^^^^^^^^^^^^^^^^^
>        implemented on top of clock_gettime(2) (using the
>        CLOCK_PROCESS_CPUTIME_ID clock).
> 
> This looks strange. The user doesn't seek improved precision, but
> improved accuracy: if one gets more digits but the value itself is
> less accurate (i.e. the error against the ideal value is larger),
> this is bad. Perhaps changing "precision" to "accuracy" would be
> correct (I assume that the real goal of the change was not just
> improved precision, but more importantly the resulting improved
> accuracy). I've reported a bug about the glibc documentation:
> 
>   https://sourceware.org/bugzilla/show_bug.cgi?id=17383

It looks to me like your supposition is correct, Vincent.
I have changed "precision" to "accuracy".

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
