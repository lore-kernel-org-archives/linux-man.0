From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] mem.4: Add CONFIG_STRICT_DEVMEM
Date: Tue, 06 Jan 2015 11:50:28 +0100
Message-ID: <54ABBDF4.4030902@gmail.com>
References: <1420204298-25625-1-git-send-email-eliedebrauwer@gmail.com> <1420204298-25625-4-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420204298-25625-4-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/02/2015 02:11 PM, Elie De Brauwer wrote:
> Since 2.6.26 the CONFIG_NONPROMISC_DEVMEM options limits the physical
> addresses which can be accessed through /dev/mem.

Thanks, Elie. Applied.

Cheers,

Michael


> Sources:
>  - Changelog: http://kernelnewbies.org/Linux_2_6_26
>  - Initial commit: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=ae531c26c5c2a28ca1b35a75b39b3b256850f2c8
>  - Rename of name: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=d092633bff3b19faffc480fe9810805e7792a029
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man4/mem.4 | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/man4/mem.4 b/man4/mem.4
> index 6688345..372d4fa 100644
> --- a/man4/mem.4
> +++ b/man4/mem.4
> @@ -23,7 +23,7 @@
>  .\" %%%LICENSE_END
>  .\"
>  .\" Modified Sat Jul 24 16:59:10 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
> -.TH MEM 4 1992-11-21 "Linux" "Linux Programmer's Manual"
> +.TH MEM 4 2015-01-02 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  mem, kmem, port \- system memory, kernel memory and system ports
>  .SH DESCRIPTION
> @@ -40,6 +40,13 @@ References to nonexistent locations cause errors to be returned.
>  Examining and patching is likely to lead to unexpected results
>  when read-only or write-only bits are present.
>  .LP
> +Since 2.6.26, and depending on the architecture, the
> +.B CONFIG_STRICT_DEVMEM
> +kernel configuration option limits the areas
> +which can be accessed through this file.
> +For example: on x86, RAM access is not allowed but accessing
> +memory-mapped PCI regions is.
> +.LP
>  It is typically created by:
>  .RS
>  .sp
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
