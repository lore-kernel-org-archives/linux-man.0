From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] localedef.1: ffix
Date: Sun, 26 Mar 2017 14:46:37 +0200
Message-ID: <85dfe921-b31e-626b-68f5-6783563d1b66@gmail.com>
References: <20170324200024.1239-1-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170324200024.1239-1-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/24/2017 09:00 PM, Jakub Wilk wrote:
> Don't embolden commas between option names.

Thanks, Jakub. Applied.

Cheers,

Michael


> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
> ---
>  man1/localedef.1 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/man1/localedef.1 b/man1/localedef.1
> index 9d35d2bfa..f0f0bdd77 100644
> --- a/man1/localedef.1
> +++ b/man1/localedef.1
> @@ -146,7 +146,7 @@ using
>  Some of the following options are sensible only for certain operations;
>  generally, it should be self-evident which ones.
>  .TP
> -.BI \-f " charmapfile" ", \-\-charmap=" charmapfile
> +.BI \-f " charmapfile" "\fR, \fP\-\-charmap=" charmapfile
>  Specify the file that defines the character set
>  that is used by the input file.
>  If
> @@ -165,7 +165,7 @@ are also searched after the current directory.
>  The default directory for character maps is printed by
>  .BR "localedef \-\-help" .
>  .TP
> -.BI \-i " inputfile" ", \-\-inputfile=" inputfile
> +.BI \-i " inputfile" "\fR, \fP\-\-inputfile=" inputfile
>  Specify the locale definition file to compile.
>  The file is sought in the current directory
>  and the default directory for locale definition files.
> @@ -179,7 +179,7 @@ are also searched after the current directory.
>  The default directory for locale definition files is printed by
>  .BR "localedef \-\-help" .
>  .TP
> -.BI \-u " repertoirefile" ", \-\-repertoire-map=" repertoirefile
> +.BI \-u " repertoirefile" "\fR, \fP\-\-repertoire-map=" repertoirefile
>  Read mappings from symbolic names to Unicode code points from
>  .IR repertoirefile .
>  If
> @@ -198,7 +198,7 @@ are also searched after the current directory.
>  The default directory for repertoire maps is printed by
>  .BR "localedef \-\-help" .
>  .TP
> -.BI \-A " aliasfile" ", \-\-alias\-file=" aliasfile
> +.BI \-A " aliasfile" "\fR, \fP\-\-alias\-file=" aliasfile
>  Use
>  .I aliasfile
>  to look up aliases for locale names.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
