From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dlerror.3 query
Date: Sat, 26 Dec 2015 17:00:38 +0100
Message-ID: <567EB9A6.5090606@gmail.com>
References: <5662DFBD.1090009@jguk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5662DFBD.1090009-hus3n9K41k0@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonny Grant <jg-hus3n9K41k0@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 12/05/2015 01:59 PM, Jonny Grant wrote:
> Hello
> 
> Quoting from:
> http://man7.org/linux/man-pages/man3/dlerror.3.html
> 
> "The dlerror() function returns a human-readable string describing the
> most recent error that occurred from a call to one of the functions
> in the dlopen API since the last call to dlerror().  The returned
> string does not include a trailing newline."
> 
> My feeling is that this should say the string is null-terminated. Also I 
> think it doesn't need to say it "does not include a trailing newline" - 
> never seen that mentioned before, so probably no one would think it might.

I added the words "null-terminated" to the description, but I think
the mention that the string does not have a trailing newline does
no harm (and even POSIX has similar wording), so I left that in.

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
