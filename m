From: walter harms <wharms-fPG8STNUNVg@public.gmane.org>
Subject: Re: [PATCH v2] ld.so.8: make lack of separator escaping explicit
Date: Tue, 06 Feb 2018 09:46:29 +0100
Message-ID: <5A796B65.7070705@bfs.de>
References: <20180205161357.8131-1-vapier@gentoo.org> <20180205214802.18397-1-vapier@gentoo.org>
Reply-To: wharms-fPG8STNUNVg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205214802.18397-1-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org



Am 05.02.2018 22:48, schrieb Mike Frysinger:
> Make it clear that the delimiters in LD_PRELOAD, LD_LIBRARY_PATH, and
> LD_AUDIT cannot be escaped so people don't try various methods (such
> as \:) to workaround it.
> 
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man8/ld.so.8 | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 64e1fb2afdc3..bd1457e1e7f5 100644
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
> @@ -310,7 +311,8 @@ as shell variables!)
>  .B LD_PRELOAD
>  A list of additional, user-specified, ELF shared
>  objects to be loaded before all others.
> -The items of the list can be separated by spaces or colons.
> +The items of the list can be separated by spaces or colons,
> +and there is no support for escaping either separator.
>  This can be used to selectively override functions in other shared objects.
>  The objects are searched for using the rules given under DESCRIPTION.
>  .IP
> @@ -352,7 +354,8 @@ many obsolete or only for internal use.
>  A colon-separated list of user-specified, ELF shared objects
>  to be loaded before all others in a separate linker namespace
>  (i.e., one that does not intrude upon the normal symbol bindings that
> -would occur in the process).
> +would occur in the process)
> +and there is no support for escaping the separator.
>  These objects can be used to audit the operation of the dynamic linker.
>  .IP
>  .B LD_AUDIT

Everything is alright. NTL i would suggest to make consequences more clear, e.g.:

"There is \fBno way\rR to have libraryname like libfoo-1:2. In this case ld.so will
 always search for \fBibfoo-1\fR and \fB2\fR."

your mileage may vary.

re,
 wh

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
