From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nsswitch.conf.5: document group merging
Date: Mon, 9 May 2016 22:34:27 +0200
Message-ID: <399b1707-c3d2-56ef-b991-e448ac2b0c8d@gmail.com>
References: <5727341F.9000204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5727341F.9000204-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marko Myllynen <myllynen-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Gallagher <sgallagh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 05/02/2016 01:03 PM, Marko Myllynen wrote:
> Hi,
> 
> Here's a patch to document the recently merged glibc group merge
> support.

Thanks, Marko.

Patch applied.

Cheers,

Michael


> https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=ced8f8933673f4efda1d666d26a1a949602035ed
> https://sourceware.org/glibc/wiki/Proposals/GroupMerging
> 
> ---
>  man5/nsswitch.conf.5 | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
> index b99f9fd..8b62796 100644
> --- a/man5/nsswitch.conf.5
> +++ b/man5/nsswitch.conf.5
> @@ -204,6 +204,8 @@ where
>  .B return
>  |
>  .B continue
> +|
> +.B merge
>  .RE
>  .LP
>  The ! negates the test, matching all possible results except the
> @@ -257,6 +259,16 @@ without affecting the search result.
>  .TP
>  .B continue
>  Call the next lookup function.
> +.TP
> +.B merge
> +.I [SUCCESS=merge]
> +is used between two database entries.
> +When a group is located in the first of the two group entries,
> +processing will continue on to the next one.
> +If the group is also found in the next entry (and the group name and GID
> +are an exact match), the member list of the second entry will be added
> +to the group object to be returned.
> +Available since glibc 2.24.
>  .RE
>  .SS Compatibility mode (compat)
>  The NSS "compat" service is similar to "files" except that it
> 
> Thanks,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
