From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: locale.1: update for 104511
Date: Mon, 18 Jan 2016 12:00:21 +0100
Message-ID: <569CC5C5.40107@redhat.com>
References: <569CC4C8.9070608@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <569CC4C8.9070608-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 01/18/2016 11:56 AM, Marko Myllynen wrote:
> Addresses https://bugzilla.kernel.org/show_bug.cgi?id=104511.
> 
> ---
>  man1/locale.1 | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/man1/locale.1 b/man1/locale.1
> index c10355f..505191d 100644
> --- a/man1/locale.1
> +++ b/man1/locale.1
> @@ -162,6 +162,10 @@ $ \fBlocale \-ck date_fmt\fP
>  LC_TIME
>  date_fmt="%a %b %e %H:%M:%S %Z %Y"
>  
> +$ \fBlocale -c charmap\fP
> +LC_CTYPE
> +UTF-8
> +

I think this needs a comment that it shows the charset, or something like

For example, the keyword
.B charmap
causes
.BR locale (1)
to display the character set for the locale.

Florian

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
