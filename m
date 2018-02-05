From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH] ld.so(8): make lack of separator escaping explicit
Date: Mon, 05 Feb 2018 17:19:58 +0100
Message-ID: <5A78842E.2060402@bfs.de>
References: <20180205161357.8131-1-vapier@gentoo.org>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205161357.8131-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 05.02.2018 17:13, schrieb Mike Frysinger:
> Make it clear that the delimiters in LD_LIBRARY_PATH cannot be escaped
> so people don't try various methods (like \:) to workaround it.
> 
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man8/ld.so.8 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 64e1fb2afdc3..fb568ef8721a 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -271,7 +271,8 @@ This is useful when using a debugger.
>  .B LD_LIBRARY_PATH
>  A list of directories in which to search for
>  ELF libraries at execution time.
> -The items in the list are separated by either colons or semicolons.
> +The items in the list are separated by either colons or semicolons,
> +and there is no support for escaping either separator.
>  Similar to the
>  .B PATH
>  environment variable.

I am not sure that i understand that. You say that a libname like
libfoo.1.2:3 is unparseable ?

re,
 wh
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
