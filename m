From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Subject: [PATCH] locale.7: improve LOCPATH description
Date: Tue, 28 Oct 2014 15:07:15 +0100
Message-ID: <544FA313.4050708@gmail.com>
References: <54449C45.4010907@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54449C45.4010907-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/20/2014 07:23 AM, Marko Myllynen wrote:
> 
> LOCPATH is ignored by privileged programs.
> 
> Add locale archive references.
> 
> Add FILES section.

Thanks, Marko. Applied.

Cheers,

Michael



> ---
>  man7/locale.7 |   22 ++++++++++++++++------
>  1 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/man7/locale.7 b/man7/locale.7
> index 6270739..3fb2ad3 100644
> --- a/man7/locale.7
> +++ b/man7/locale.7
> @@ -330,17 +330,20 @@ The following environment variable is used by
>  .BR newlocale (3)
>  and
>  .BR setlocale (3),
> -and thus affects all localized programs:
> +and thus affects all unprivileged localized programs:
>  .TP
>  .B LOCPATH
>  A list of pathnames, separated by colons (\(aq:\(aq),
>  that should be used to find locale data.
> -If this variable is set, only the individual locale data files from
> +If this variable is set, only the individual compiled locale data files
> +from
>  .I LOCPATH
> -and the system default locale data path are used; any available locale
> -archives are not used. The individual locale data files are searched
> -under subdirectories which depend on the currently used locale. For
> -example, when
> +and the system default locale data path are used;
> +any available locale archives are not used (see
> +.BR localedef (1)).
> +The individual compiled locale data files are searched under
> +subdirectories which depend on the currently used locale.
> +For example, when
>  .I en_GB.UTF-8
>  is used for a category, the following subdirectories are searched for,
>  in this order:
> @@ -351,6 +354,13 @@ in this order:
>  .IR en.utf8 ,
>  and
>  .IR en .
> +.SH FILES
> +.TP
> +.I /usr/lib/locale/locale-archive
> +Usual default locale archive location.
> +.TP
> +.I /usr/lib/locale
> +Usual default path for compiled individual locale files.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .\"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
