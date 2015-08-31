From: Michal Hocko <mhocko-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mlock.2: mlock2.2: Add entry to for new mlock2 syscall
Date: Mon, 31 Aug 2015 11:23:01 +0200
Message-ID: <20150831092300.GE29723@dhcp22.suse.cz>
References: <1440787391-30298-1-git-send-email-emunson@akamai.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440787391-30298-1-git-send-email-emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Fri 28-08-15 14:43:11, Eric B Munson wrote:
> Update the mlock.2 man page with information on mlock2() and the new
> mlockall() flag MCL_ONFAULT.
> 
> Signed-off-by: Eric B Munson <emunson-JqFfY2XvxFXQT0dZR+AlfA@public.gmane.org>
> Cc: Michal Hocko <mhocko-AlSwsSmVLrQ@public.gmane.org>

Acked-by: Michal Hocko <mhocko-IBi9RG/b67k@public.gmane.org>

I am not familiar with the format much so I am just looking at the text
and that looks reasonable to me. Just one note below:

> Cc: Vlastimil Babka <vbabka-AlSwsSmVLrQ@public.gmane.org>
> Cc: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>
> Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  man2/mlock.2  | 109 +++++++++++++++++++++++++++++++++++++++++++++++++++-------
>  man2/mlock2.2 |   1 +
>  2 files changed, 97 insertions(+), 13 deletions(-)
>  create mode 100644 man2/mlock2.2
> 
> diff --git a/man2/mlock.2 b/man2/mlock.2
> index 79c544d..8f51926 100644
> --- a/man2/mlock.2
> +++ b/man2/mlock.2
[...]
> +The
> +.I flags
> +argument can be either 0 or the following constant:
> +.TP 1.2i
> +.B MLOCK_ONFAULT
> +Lock pages that are currently resident and mark the entire range to have
> +pages locked when they are faulted in.

@faulted in@populated by the page fault@.

would be probably better.

[...]
-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
