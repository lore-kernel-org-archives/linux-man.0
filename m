From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] nsswitch.conf(5): clarify group merge rules
Date: Mon, 8 May 2017 10:59:59 +0200
Message-ID: <5acd01a5-93b0-c6cf-ecb1-f4f65fa083f7@gmail.com>
References: <201705032106.v43L6s3k000768@envy.delorie.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201705032106.v43L6s3k000768-Mhfd7Cn2s7ZOU/xweIFGFw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DJ Delorie <dj-Ht4Cp5ncgjRBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/03/2017 11:06 PM, DJ Delorie wrote:
> This minor patch clarifies when merging is not done, and how duplicate
> entries are merged.
> 
> Found while extending glibc's NSS test suite, discussed with glibc
> team and Stephen Gallagher.

Thanks, DJ. Applied.

Cheers,

Michael

> diff --git a/man5/nsswitch.conf.5 b/man5/nsswitch.conf.5
> index 0405d4f..007c582 100644
> --- a/man5/nsswitch.conf.5
> +++ b/man5/nsswitch.conf.5
> @@ -277,6 +277,10 @@ If the group is also found in the next entry (and the group name and GID
>  are an exact match), the member list of the second entry will be added
>  to the group object to be returned.
>  Available since glibc 2.24.
> +Note that merging will not be done for
> +.BR getgrent (3)
> +nor will duplicate members be pruned when they occur in both entries
> +being merged.
>  .RE
>  .SS Compatibility mode (compat)
>  The NSS "compat" service is similar to "files" except that it
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
