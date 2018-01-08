From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] copy_file_ranges can file with EFBIG
Date: Tue, 9 Jan 2018 00:42:28 +0100
Message-ID: <59239304-d3e5-cc4d-a955-309ba69ccfeb@gmail.com>
References: <026501d5-2def-769f-ae52-36d7d60e533c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <026501d5-2def-769f-ae52-36d7d60e533c-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/03/2018 02:02 PM, Florian Weimer wrote:
>>From f668acc7396854f2d4c264c92ea233f37b2bbbfb Mon Sep 17 00:00:00 2001
> From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: Wed, 3 Jan 2018 14:00:35 +0100
> Subject: [PATCH] copy_file_range.2: EFBIG errors are possible, similar to
>  write(2)
> 
> Signed-off-by: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Thanks, Florian. Patch applied.

Cheers,

Michael

> ---
>  man2/copy_file_range.2 | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/man2/copy_file_range.2 b/man2/copy_file_range.2
> index 6e50ea6ec..31c31cd81 100644
> --- a/man2/copy_file_range.2
> +++ b/man2/copy_file_range.2
> @@ -108,6 +108,11 @@ Requested range extends beyond the end of the source file; or the
>  .I flags
>  argument is not 0.
>  .TP
> +.B EFBIG
> +An attempt was made to write a file that exceeds the implementation-defined
> +maximum file size or the process's file size limit,
> +or to write at a position past the maximum allowed offset.
> +.TP
>  .B EIO
>  A low-level I/O error occurred while copying.
>  .TP


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
