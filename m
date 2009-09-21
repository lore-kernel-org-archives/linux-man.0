From: Hugh Dickins <hugh.dickins-IWqWACnzNjwqdlJmJB21zg@public.gmane.org>
Subject: Re: [PATCH] remove duplicate asm/mman.h files
Date: Mon, 21 Sep 2009 13:02:44 +0100 (BST)
Message-ID: <Pine.LNX.4.64.0909211258570.7831@sister.anvils>
References: <cover.1251197514.git.ebmunson@us.ibm.com> <200909181848.42192.arnd@arndb.de>
 <alpine.DEB.1.00.0909181236190.27556@chino.kir.corp.google.com>
 <200909211031.25369.arnd@arndb.de> <alpine.DEB.1.00.0909210208180.16086@chino.kir.corp.google.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.DEB.1.00.0909210208180.16086-X6Q0R45D7oAcqpCFd4KODRPsWskHk0ljAL8bYrjMMd8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Fenghua Yu <fenghua.yu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Tony Luck <tony.luck-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, ebmunson-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, rth-hL46jP5Bxq7R7s880joybQ@public.gmane.org, ink-biIs/Y0ymYJMZLIVYojuPNP0rXTJTi09@public.gmane.org, linux-ia64-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On Mon, 21 Sep 2009, David Rientjes wrote:
> On Mon, 21 Sep 2009, Arnd Bergmann wrote:
> 
> > > > -#define MCL_CURRENT	1		/* lock all current mappings */
> > > > -#define MCL_FUTURE	2		/* lock all future mappings */
> > > > +#define MAP_GROWSUP	0x0200		/* register stack-like segment */
> > > >  
> > > >  #ifdef __KERNEL__
> > > >  #ifndef __ASSEMBLY__
> > > 
> > > ia64 doesn't use MAP_GROWSUP, so it's probably not necessary to carry it 
> > > along with your cleanup.
> > 
> > ia64 is the only architecture defining it, nobody uses it in the kernel.
> > If the ia64 maintainers want to remove it in a separate patch, that
> > would probably be a good idea.
> > 
> 
> I'll do it then.
> 
> > I tried not to change the ABI in any way in my patch, and there is
> > a theoretical possibility that some user space program on ia64 currently
> > depends on that definition.
> > 
> 
> I don't buy that as justification, if some userspace program uses it based 
> on the false belief that it actually does what it says, it's probably 
> better to break their build than perpetuating the lie that it's different 
> than ~MAP_GROWSDOWN.
> 
> 
> ia64: remove definition for MAP_GROWSUP
> 
> MAP_GROWSUP is unused.

Is it perhaps the case that some UNIX on ia64 does implement MAP_GROWSUP,
and these numbers in the Linux ia64 mman.h have been chosen to match that
reference implementation?  Tony will know.  But I wonder if you'd do
better at least to leave a MAP_GROWSUP comment on that line, so that
somebody doesn't go and reuse the empty slot later on.

Hugh

> 
> Signed-off-by: David Rientjes <rientjes-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---
> diff --git a/arch/ia64/include/asm/mman.h b/arch/ia64/include/asm/mman.h
> --- a/arch/ia64/include/asm/mman.h
> +++ b/arch/ia64/include/asm/mman.h
> @@ -11,7 +11,6 @@
>  #include <asm-generic/mman-common.h>
>  
>  #define MAP_GROWSDOWN	0x00100		/* stack-like segment */
> -#define MAP_GROWSUP	0x00200		/* register stack-like segment */
>  #define MAP_DENYWRITE	0x00800		/* ETXTBSY */
>  #define MAP_EXECUTABLE	0x01000		/* mark it as an executable */
>  #define MAP_LOCKED	0x02000		/* pages are locked */
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
