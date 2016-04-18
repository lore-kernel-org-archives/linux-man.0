From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH mtd-utils] include sys/sysmacros.h for major/minor/makedev
Date: Mon, 18 Apr 2016 09:39:26 -0700
Message-ID: <20160418163926.GB52272@google.com>
References: <1460860245-14895-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460860245-14895-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

+ man-page and glibc folks

On Sat, Apr 16, 2016 at 10:30:45PM -0400, Mike Frysinger wrote:
> These functions have always been defined in sys/sysmacros.h under
> Linux C libraries.  For some, including sys/types.h implicitly
> includes that as well, but glibc wants to deprecate that, and some
> others already have.  Include the header explicitly for the funcs.
> 
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>

Patch looks fine to me, thanks. Pushed to mtd-utils.git.

But I don't see this change documented anywhere. (Helpfully, I do see
the change from your other patch -- _BSD_SOURCE -> _DEFAULT_SOURCE --
documented though!) Should the man-pages project be updated? I see the
latest makedev(5) still recommends #include <sys/types.h>.

Brian

> ---
>  include/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/common.h b/include/common.h
> index fb0ca83..8cb3142 100644
> --- a/include/common.h
> +++ b/include/common.h
> @@ -28,6 +28,7 @@
>  #include <errno.h>
>  #include <features.h>
>  #include <inttypes.h>
> +#include <sys/sysmacros.h>
>  #include "version.h"
>  
>  #ifndef PROGRAM_NAME
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
