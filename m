From: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Subject: Re: [PATCH] strcpy.3: Remove reference to non-existent strpcpy(3)
Date: Sat, 21 Nov 2009 21:50:12 +0100
Message-ID: <20091121205012.GF3708@machine.or.cz>
References: <1258826146-4474-1-git-send-email-mark@pogo.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1258826146-4474-1-git-send-email-mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sat, Nov 21, 2009 at 05:55:46PM +0000, Mark Hills wrote:
> There is no man page or function by this name.
> 
> Signed-off-by: Mark Hills <mark-UrrBsZIrrsb10XsdtD+oqA@public.gmane.org>
> ---
>  man3/strcpy.3 |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/man3/strcpy.3 b/man3/strcpy.3
> index 9d47e37..c79efb1 100644
> --- a/man3/strcpy.3
> +++ b/man3/strcpy.3
> @@ -137,6 +137,5 @@ in ways that may make the impossible possible.
>  .BR memcpy (3),
>  .BR memmove (3),
>  .BR strdup (3),
> -.BR strpcpy (3),
>  .BR wcscpy (3),
>  .BR wcsncpy (3)

In fact, this should be fixed by making it a reference to stpcpy().

-- 
				Petr "Pasky" Baudis
A lot of people have my books on their bookshelves.
That's the problem, they need to read them. -- Don Knuth
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
