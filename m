From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: update and expand
Date: Sat, 13 May 2017 14:02:55 +0200
Message-ID: <bceb9471-0b15-3f07-9d8c-b50f91f34b14@gmail.com>
References: <20170510044742.ntq2g5vdnb7q3lf7@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170510044742.ntq2g5vdnb7q3lf7-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Branden,

On 05/10/2017 06:47 AM, G. Branden Robinson wrote:
>     ld.so.8: update and expand
> 
>     * Discuss possible observable effects of running on a multiarch-capable
>       system (the linker may be in a different directory under a different
>       name, for instance).
> 
>     * Add some basic background material for the novice reader.
> 
>     * Call out use of shell glob in filenames, particularly in the topic of
>       the man page itself since this is a little unusual.
> 
>     * Connect discussion of --audit option and LD_AUDIT environment
>       variable.
> 
>     * Explain where shared object dependencies are declared and connec to
>       elf(5) (already mentioned in See Also section).

See my comments on the previous patch. There's some good stuff here, but 
could you please resend this patch in smaller pieces, rebased against current
Git.

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
