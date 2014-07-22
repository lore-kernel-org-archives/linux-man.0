From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: For review: memusage(1) man page
Date: Tue, 22 Jul 2014 08:10:18 +0200
Message-ID: <53CE004A.3060706@gmail.com>
References: <53C8E244.2080901@redhat.com> <E1X84Kh-00041J-2z@fencepost.gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1X84Kh-00041J-2z-iW7gFb+/I3LZHJUXO5efmti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ams-mXXj517/zsQ@public.gmane.org, Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org, myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, drepper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/18/2014 11:20 AM, Alfred M. Szmidt wrote:
>    memusage command is no documented. My collegue (95%) and I (5%)
>    have written a man page for it. All informations come from
>    inspecting the script code. This is the first script, others are
>    memusagestat (1) and mtrace(1).
> 
> This, memusagestat, and mtrace should rather be put into the glibc
> manual.  mtrace is already (though partially) documented there, and
> much of the details regarding the mtrace functions.  Having the
> corresponding commands documented would be awesome though.
> .

I must say that this is an odd position to take. While it would be 
nice to have documentation in the glibc manual, the glibc developers
did not bother to add anything to the manual when writing these 
interfaces, so it hardly seems like anyone else is obligated to do
so (assuming that person wanted to even jump the CLA hurdle...). 
In any case, man pages does (good) pages that describe the 
libc interfaces (including commands).

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
