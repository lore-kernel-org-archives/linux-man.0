From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] vdso.7: update for ARM
Date: Thu, 04 Jun 2015 16:49:40 +0200
Message-ID: <55706584.9010503@gmail.com>
References: <1433188139-5307-1-git-send-email-nathan_lynch@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433188139-5307-1-git-send-email-nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Nathan, Mike,

On 06/01/2015 09:48 PM, Nathan Lynch wrote:
> The 32-bit ARM architecture in Linux has gained a vDSO as of the 4.1
> release.  (I was the primary author.)
> 
> Document the symbols exported by the ARM VDSO.
> 
> Accepted kernel submission:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-March/332573.html

@Nathan: Thanks for the patch. Applied.
@Mike: thanks for the Ack.

Cheers,

Michael


> Signed-off-by: Nathan Lynch <nathan_lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
> ---
>  man7/vdso.7 | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/man7/vdso.7 b/man7/vdso.7
> index 193fadeb52f8..4df579edd401 100644
> --- a/man7/vdso.7
> +++ b/man7/vdso.7
> @@ -148,6 +148,7 @@ l l.
>  user ABI	vDSO name
>  _
>  aarch64	linux-vdso.so.1
> +arm	linux-vdso.so.1
>  ia64	linux-gate.so.1
>  ppc/32	linux-vdso32.so.1
>  ppc/64	linux-vdso64.so.1
> @@ -175,9 +176,27 @@ an i386 32-bit kernel or under an x86_64 64-bit kernel.
>  Therefore, the name of the user-space ABI should be used to determine
>  which of the sections below is relevant.
>  .SS ARM functions
> +.\" See linux/arch/arm/vdso/vdso.lds.S
> +.\" Commit: 8512287a8165592466cb9cb347ba94892e9c56a5
> +The table below lists the symbols exported by the vDSO.
> +.if t \{\
> +.ft CW
> +\}
> +.TS
> +l l.
> +symbol	version
> +_
> +__vdso_gettimeofday	LINUX_2.6 (exported since Linux 4.1)
> +__vdso_clock_gettime	LINUX_2.6 (exported since Linux 4.1)
> +.TE
> +.if t \{\
> +.in
> +.ft P
> +\}
> +
>  .\" See linux/arch/arm/kernel/entry-armv.S
>  .\" See linux/Documentation/arm/kernel_user_helpers.txt
> -The ARM port has a code page full of utility functions.
> +Additionally, the ARM port has a code page full of utility functions.
>  Since it's just a raw page of code, there is no ELF information for doing
>  symbol lookups or versioning.
>  It does provide support for different versions though.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
