From: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] remove duplicate asm/mman.h files
Date: Fri, 18 Sep 2009 12:37:23 -0700 (PDT)
Message-ID: <alpine.DEB.1.00.0909181236190.27556@chino.kir.corp.google.com>
References: <cover.1251197514.git.ebmunson@us.ibm.com> <20090917174616.f64123fb.akpm@linux-foundation.org> <200909181719.47240.arnd@arndb.de> <200909181848.42192.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <200909181848.42192.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri, 18 Sep 2009, Arnd Bergmann wrote:

> diff --git a/arch/ia64/include/asm/mman.h b/arch/ia64/include/asm/mman.h
> index cf55884..4459028 100644
> --- a/arch/ia64/include/asm/mman.h
> +++ b/arch/ia64/include/asm/mman.h
> @@ -8,21 +8,9 @@
>   *	David Mosberger-Tang <davidm-sDzT885Ts8HQT0dZR+AlfA@public.gmane.org>, Hewlett-Packard Co
>   */
>  
> -#include <asm-generic/mman-common.h>
> +#include <asm-generic/mman.h>
>  
> -#define MAP_GROWSDOWN	0x00100		/* stack-like segment */
> -#define MAP_GROWSUP	0x00200		/* register stack-like segment */
> -#define MAP_DENYWRITE	0x00800		/* ETXTBSY */
> -#define MAP_EXECUTABLE	0x01000		/* mark it as an executable */
> -#define MAP_LOCKED	0x02000		/* pages are locked */
> -#define MAP_NORESERVE	0x04000		/* don't check for reservations */
> -#define MAP_POPULATE	0x08000		/* populate (prefault) pagetables */
> -#define MAP_NONBLOCK	0x10000		/* do not block on IO */
> -#define MAP_STACK	0x20000		/* give out an address that is best suited for process/thread stacks */
> -#define MAP_HUGETLB	0x40000		/* create a huge page mapping */
> -
> -#define MCL_CURRENT	1		/* lock all current mappings */
> -#define MCL_FUTURE	2		/* lock all future mappings */
> +#define MAP_GROWSUP	0x0200		/* register stack-like segment */
>  
>  #ifdef __KERNEL__
>  #ifndef __ASSEMBLY__

ia64 doesn't use MAP_GROWSUP, so it's probably not necessary to carry it 
along with your cleanup.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
