From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Typo in readdir.3
Date: Wed, 25 Jan 2017 13:09:55 +1300
Message-ID: <6b3d5a4d-7ff1-a8f9-9dd4-281903b86014@gmail.com>
References: <d4218e32-719f-9517-a85b-e7d6f6882737@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d4218e32-719f-9517-a85b-e7d6f6882737-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tadeusz Struk <tadeusz.struk-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/25/2017 11:48 AM, Tadeusz Struk wrote:
> diff --git a/man3/readdir.3 b/man3/readdir.3
> index 866fd45..677af62 100644

Thanks, Tadeusz, Patch applied.

Cheers,

Michael


> --- a/man3/readdir.3
> +++ b/man3/readdir.3
> @@ -230,7 +230,7 @@ A directory stream is opened using
>  The order in which filenames are read by successive calls to
>  .BR readdir ()
>  depends on the filesystem implementation;
> -it us unlikely that the names will be sorted in any fashion.
> +it is unlikely that the names will be sorted in any fashion.
>  
>  Only the fields
>  .I d_name
> 
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
