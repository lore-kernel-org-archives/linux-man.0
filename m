From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getsubopt.3: ATTRIBUTES: Note function that is thread-safe
Date: Thu, 10 Apr 2014 21:18:22 +0200
Message-ID: <5346EE7E.3070402@gmail.com>
References: <1396924151-16033-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396924151-16033-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Haitao.

Applied.

Cheers,

Michael

On 04/08/2014 04:29 AM, Peng Haitao wrote:
> The function getsubopt() is thread safe.
> 
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getsubopt.3 | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/getsubopt.3 b/man3/getsubopt.3
> index a4ba755..e0b2a45 100644
> --- a/man3/getsubopt.3
> +++ b/man3/getsubopt.3
> @@ -22,7 +22,7 @@
>  .\" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>  .\" %%%LICENSE_END
>  .\"
> -.TH GETSUBOPT 3 2010-09-26 "GNU" "Linux Programmer's Manual"
> +.TH GETSUBOPT 3 2014-04-08 "GNU" "Linux Programmer's Manual"
>  .SH NAME
>  getsubopt \- parse suboption arguments from a string
>  .SH SYNOPSIS
> @@ -126,6 +126,11 @@ is changed, the first suboption before the call to
>  .BR getsubopt ()
>  is not (necessarily) the same as the first suboption after
>  .BR getsubopt ().
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR getsubopt ()
> +function is thread-safe.
>  .SH CONFORMING TO
>  POSIX.1-2001.
>  .SH NOTES
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
