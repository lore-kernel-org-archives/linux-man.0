From: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Subject: Re: [PATCH v2] getutent.3: ATTRIBUTES: Note functions those aren't
 thread-safe
Date: Wed, 8 Apr 2015 11:07:00 +0800
Message-ID: <1428462420.2516.4.camel@G08JYZSD130126.localdomain>
References: <1427253330-27357-1-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427253330-27357-1-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi,

Sorry for the bother. Please *ignore* these patches. I have sent new
correct versions just a moment ago.

Best regards,
Zeng

On Wed, 2015-03-25 at 11:15 +0800, Zeng Linggang wrote:
> The markings match glibc markings.
> 
> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getutent.3 | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/man3/getutent.3 b/man3/getutent.3
> index 4ff5581..3365382 100644
> --- a/man3/getutent.3
> +++ b/man3/getutent.3
> @@ -155,6 +155,46 @@ functions can also fail for the reasons described in
>  /var/run/utmp	database of currently logged-in users
>  .br
>  /var/log/wtmp	database of past user logins
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lb lb lbw28
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR getutent ()
> +T}	Thread safety	T{
> +MT-Unsafe init race:utent
> +.br
> +race:utentbuf sig:ALRM timer
> +T}
> +T{
> +.BR getutid (),
> +.br
> +.BR getutline ()
> +T}	Thread safety	T{
> +MT-Unsafe init race:utent
> +.br
> +sig:ALRM timer
> +T}
> +T{
> +.BR pututline ()
> +T}	Thread safety	T{
> +MT-Unsafe race:utent
> +.br
> +sig:ALRM timer
> +T}
> +T{
> +.BR setutent (),
> +.br
> +.BR endutent (),
> +.br
> +.BR utmpname ()
> +T}	Thread safety	MT-Unsafe race:utent
> +.TE
> +
>  .SH CONFORMING TO
>  XPG2, SVr4.
>  .LP


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
