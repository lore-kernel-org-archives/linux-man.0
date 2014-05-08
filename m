From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] remap_file_pages.2: Not actually useful on real files.
Date: Thu, 08 May 2014 11:45:05 +0200
Message-ID: <536B5221.60407@gmail.com>
References: <5de30c3a21531919712fc7df213c18b46e521225.1355955125.git.luto@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5de30c3a21531919712fc7df213c18b46e521225.1355955125.git.luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andy,

It's long after the fact, but...

On 12/19/2012 11:12 PM, Andy Lutomirski wrote:
> Linux commit 3ee6dafc677a68e461a7ddafc94a580ebab80735 caused
> remap_file_pages to be emulated when used on real file.
> 
> Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
> ---
>  man2/remap_file_pages.2 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man2/remap_file_pages.2 b/man2/remap_file_pages.2
> index f96f594..f6dee99 100644
> --- a/man2/remap_file_pages.2
> +++ b/man2/remap_file_pages.2
> @@ -148,6 +148,12 @@ The
>  .BR remap_file_pages ()
>  system call appeared in Linux 2.5.46;
>  glibc support was added in version 2.3.3.
> +
> +.BR remap_file_pages ()
> +has no performance advantage over
> +.BR mmap (2)
> +when used on real (as opposed to purely in-memory) files as of Linux 2.6.23:
> +on real files it creates a separate vma for each range.
>  .SH "CONFORMING TO"
>  The
>  .BR remap_file_pages ()


I've applied the above. I then tweaked it a little. Is the following
okay:

[[
Since Linux 2.6.23,
.\" commit 3ee6dafc677a68e461a7ddafc94a580ebab80735
.BR remap_file_pages ()
has no performance advantage over
.BR mmap (2)
when used on real files:
on real files it creates a separate VMA for each range.
It does, however, continue to provide a performance advantage
for files on memory-based filesystems.
]]

?

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
