From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] wcstoimax.3: ATTRIBUTES: Note functions that are thread
 safe with exceptions
Date: Sat, 07 Dec 2013 14:40:11 -0800
Message-ID: <52A3A3CB.5030803@gmail.com>
References: <1384753876-26499-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384753876-26499-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/17/13 21:51, Peng Haitao wrote:
> The functions wcstoimax() and wcstoumax() are thread safe with
> exceptions.

Applied. Thanks, Peng Haitao.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/wcstoimax.3 | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/wcstoimax.3 b/man3/wcstoimax.3
> index c79ccda..626aa3c 100644
> --- a/man3/wcstoimax.3
> +++ b/man3/wcstoimax.3
> @@ -21,7 +21,7 @@
>  .\" <http://www.gnu.org/licenses/>.
>  .\" %%%LICENSE_END
>  .\"
> -.TH WCSTOIMAX 3 2003-11-01 "" "Linux Programmer's Manual"
> +.TH WCSTOIMAX 3 2013-11-18 "" "Linux Programmer's Manual"
>  .SH NAME
>  wcstoimax, wcstoumax \- convert wide-character string to integer
>  .SH SYNOPSIS
> @@ -46,6 +46,17 @@ except that they return a value of type
>  and
>  .IR uintmax_t ,
>  respectively.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR wcstoimax ()
> +and
> +.BR wcstoumax ()
> +functions are thread-safe with exceptions.
> +These functions can be safely used in multithreaded applications,
> +as long as
> +.BR setlocale (3)
> +is not called to change the locale.
>  .SH CONFORMING TO
>  C99.
>  .SH SEE ALSO
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
