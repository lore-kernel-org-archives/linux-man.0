From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] reboot.2: 1-argument reboot() is also provided by alternative
 libc.
Date: Wed, 02 Dec 2015 20:22:21 +0100
Message-ID: <565F44ED.2080204@gmail.com>
References: <7306b677818ad893376f0d6cead68a3912b73de5.1447763024.git.CasperVector@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7306b677818ad893376f0d6cead68a3912b73de5.1447763024.git.CasperVector-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Casper Ti. Vector" <caspervector-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/17/2015 11:37 AM, Casper Ti. Vector wrote:
> As far as the patch author knows, at least the following alternative C
> libraries for linux also provide the 1-argument variant:
> 
> * uclibc: all public releases.
> * dietlibc: 0.7.2 and all later releases; reboot() was not provided in
>             0.7.1 and earlier releases.
> * musl: all public releases.
> * klibc: all public releases.
> * bionic: all public releases.
> 
> ... which should already cover most use cases.

Thanks, Casper. Patch applied.

Cheers,

Michael



> ---
>  man2/reboot.2 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/reboot.2 b/man2/reboot.2
> index 6ad5c67..cd6b6ea 100644
> --- a/man2/reboot.2
> +++ b/man2/reboot.2
> @@ -40,7 +40,8 @@ reboot \- reboot or enable/disable Ctrl-Alt-Del
>  .sp
>  .BI "int reboot(int " magic ", int " magic2 ", int " cmd ", void *" arg );
>  .sp
> -/* Under glibc some of the constants involved have gotten
> +/* Under glibc and most alternative libc's (including uclibc, dietlibc,
> +   musl and a few others), some of the constants involved have gotten
>     symbolic names RB_*, and the library call is a 1-argument
>     wrapper around the 3-argument system call: */
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
