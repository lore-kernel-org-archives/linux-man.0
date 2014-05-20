From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/20] More prototype fixes
Date: Tue, 20 May 2014 09:09:25 +0200
Message-ID: <537AFFA5.2000505@gmail.com>
References: <1400540546-25578-1-git-send-email-rv@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400540546-25578-1-git-send-email-rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rasmus Villemoes <rv-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/20/2014 01:02 AM, Rasmus Villemoes wrote:
> The previously mentioned perl script can also be applied to the man3
> pages. This round of patches comes mostly from applying it to
> man3/[a-g].*, but I've also included other stuff I've stumbled across.

Thanks for all these patches, Rasmus. I'll keep them parked in 
branch for the moment. 

One small note for future patches. You've git the subject lines 
almost exactly how I prefer, but if you could capitalize the first 
word following the page name in the subject line, then that would 
be perfect. So, for example, instead of

    fseek.3: fix prototype

use 

    fseek.3: Fix prototype

Thanks,

Michael



> The perl script itself follows soon.
> 
> Rasmus Villemoes (20):
>   open.2: spfix
>   set_mempolicy.2: Fix prototype for set_mempolicy(2)
>   remap_file_pages.2: Fix prototype
>   swapon.2: remove header from synopsis
>   a64l.3: fix prototype for a64l()
>   argz_*: Fix prototypes
>   adjtime.3: add required header
>   bstring.3: Fix prototypes
>   dl_iterate_phdr.3: tfix
>   inet_net_pton.3: srcfix, cfix
>   envz_add.3: fix prototypes
>   fpathconf.3: fix prototype
>   fseek.3: fix prototype
>   gcvt.3: fix prototype
>   getaddrinfo_a.3: fix prototype
>   getnameinfo.3: fix prototype
>   getrpcent.3: fix prototype
>   getspnam.3: fix prototype
>   getutent.3: fix prototypes
>   getrpcport.3: add #include and fix prototype
> 
>  man2/open.2             | 2 +-
>  man2/remap_file_pages.2 | 2 +-
>  man2/set_mempolicy.2    | 4 ++--
>  man2/swapon.2           | 2 --
>  man3/a64l.3             | 2 +-
>  man3/adjtime.3          | 2 ++
>  man3/argz_add.3         | 6 +++---
>  man3/bstring.3          | 6 +++---
>  man3/dl_iterate_phdr.3  | 4 ++--
>  man3/envz_add.3         | 4 ++--
>  man3/fpathconf.3        | 2 +-
>  man3/fseek.3            | 2 +-
>  man3/gcvt.3             | 2 +-
>  man3/getaddrinfo_a.3    | 4 ++--
>  man3/getnameinfo.3      | 4 ++--
>  man3/getrpcent.3        | 2 +-
>  man3/getrpcport.3       | 6 ++++--
>  man3/getspnam.3         | 2 +-
>  man3/getutent.3         | 6 +++---
>  man3/inet_net_pton.3    | 5 ++---
>  20 files changed, 35 insertions(+), 34 deletions(-)
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
