From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getmntent.3: ATTRIBUTES: Note functions that isn't thread-safe
Date: Wed, 29 Apr 2015 21:15:21 +0200
Message-ID: <55412DC9.10006@gmail.com>
References: <1429764710-8598-1-git-send-email-zenglg.jy@cn.fujitsu.com> <1429764710-8598-3-git-send-email-zenglg.jy@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1429764710-8598-3-git-send-email-zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 04/23/2015 06:51 AM, Zeng Linggang wrote:
> The markings match glibc markings.
> markings of functions in glibc are:
> - setmntent:   MT-Safe
> - endmntent:   MT-Safe
> - hasmntopt:   MT-Safe
> - getmntent:   MT-Unsafe race:mntentbuf locale
> - addmntent:   MT-Safe race:stream locale
> - getmntent_r: MT-Safe locale


Thanks, Zeng. Applied. (See comment on previous mail re Patch Title).

Cheers,

Michael



> Signed-off-by: Zeng Linggang <zenglg.jy-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/getmntent.3 | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/man3/getmntent.3 b/man3/getmntent.3
> index 085c632..130ec82 100644
> --- a/man3/getmntent.3
> +++ b/man3/getmntent.3
> @@ -199,6 +199,30 @@ a match is found and NULL otherwise.
>  /etc/fstab          filesystem description file
>  /etc/mtab           mounted filesystem description file
>  .fi
> +.SH ATTRIBUTES
> +For an explanation of the terms used in this section, see
> +.BR attributes (7).
> +.TS
> +allbox;
> +lbw13 lb lbw31
> +l l l.
> +Interface	Attribute	Value
> +T{
> +.BR setmntent (),
> +.BR endmntent (),
> +.BR hasmntopt ()
> +T}	Thread safety	MT-Safe
> +T{
> +.BR getmntent ()
> +T}	Thread safety	MT-Unsafe race:mntentbuf locale
> +T{
> +.BR addmntent ()
> +T}	Thread safety	MT-Safe race:stream locale
> +T{
> +.BR getmntent_r ()
> +T}	Thread safety	MT-Safe locale
> +.TE
> +
>  .SH CONFORMING TO
>  The nonreentrant functions are from SunOS 4.1.3.
>  A routine
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
