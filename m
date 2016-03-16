From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] lirc.4: srcfix
Date: Thu, 17 Mar 2016 11:31:52 +1300
Message-ID: <56E9DED8.9000408@gmail.com>
References: <1458155731-10057-1-git-send-email-toddy@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458155731-10057-1-git-send-email-toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Dr. Tobias Quathamer" <toddy-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/17/2016 08:15 AM, Dr. Tobias Quathamer wrote:
> Hi Michael,
> 
> I'm using a script to collect authors and licensing
> information for the various manpages. Currently, the
> script cannot extract meaningful information from
> lirc.4, because it relies on the information being
> present before the ".TH" macro.
> 
> Would you consider this patch? Otherwise, I'll have
> to make the script more robust ... :-)

Hello Tobias,

Thanks. Applied.

Cheers,

Michael


> ---
>  man4/lirc.4 | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/man4/lirc.4 b/man4/lirc.4
> index c63a3f4..90d31e1 100644
> --- a/man4/lirc.4
> +++ b/man4/lirc.4
> @@ -1,6 +1,3 @@
> -.TH LIRC 4 "Aug 2015" "Linux" "Linux Programmer's Manual"
> -
> -
>  .\" Copyright (c) 2015, Alec Leamas
>  .\"
>  .\" %%%LICENSE_START(GPLv2+_DOC_FULL)
> @@ -23,6 +20,7 @@
>  .\" License along with this manual; if not, see
>  .\" <http://www.gnu.org/licenses/>.
>  .\" %%%LICENSE_END
> +.TH LIRC 4 "Aug 2015" "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  lirc \- lirc devices
>  .SH DESCRIPTION
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
