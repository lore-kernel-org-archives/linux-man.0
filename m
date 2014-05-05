From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Bug in process_vm_readv manpage: no mention of need to define
 _GNU_SOURCE
Date: Mon, 05 May 2014 20:06:30 +0200
Message-ID: <5367D326.3040101@gmail.com>
References: <32aae98b8af2ee4af07f79be33514569@stijnhinterding.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <32aae98b8af2ee4af07f79be33514569-Tcs81MCHamfqOYT2WTFYB/P6llvjuJOh@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stijn Hinterding <contact-Tcs81MCHamfqOYT2WTFYB/P6llvjuJOh@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/05/2014 07:55 PM, Stijn Hinterding wrote:
> Dear sirs,
> 
> Following is a bug report for the process_vm_writev / process_vm_readv manpage.
> 
> Platform: Ubuntu 13.10 x86_64
> Man-pages release: 3.54
> Kernel version: 3.11.0-20-generic
> glibc version: 2.17
> 
> 
> Description:
> GNU extensions need te be enabled when using these functions (ie, define _GNU_SOURCE).
> This is not mentioned in the manpage, thus users will encounter errors upon compiling.
> 
> Suggestion:
> Mention that _GNU_SOURCE needs to be declared before including <sys/uio.h>

Done. Thanks for the report, Stijn.

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
