From: Jan Chaloupka <jchaloup-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: statfs.2: f_spare[4]  or f_spare[5]
Date: Fri, 31 Oct 2014 22:44:01 +0100
Message-ID: <545402A1.30404@redhat.com>
References: <5453FE6F.3010501@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5453FE6F.3010501-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org >> Siddhesh Poyarekar" <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org >> Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Siddhesh,

can you help me with this? I have problems finding out why the statfs.h 
tarball of glibc contains f_spare[6], but the resulting build contains 
f_spare[4]? There is no patch that changes the 6 to 4. Looking into spec 
file, I am lost.

Thanks
Jan

On 10/31/2014 10:26 PM, Jan Chaloupka wrote:
> Hello,
>
> there is probably a wrong number in description of statfs structure. 
> In description section, struct statfs contains as a last field 
> f_spare[5]. But the /usr/include/bits/statfs.h itself contains 
> f_spare[4] (glibc-headers-2.18 on f20).
>
> Looking into glibc-2.20, there is f_spare[6]. Looks like the structure 
> is gradually evolving :).
>
> Inspecting upstream history (gitk statfs.h), it shows it was 
> f_spare[6] since 1997.
>
> Regards
> Jan
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-man" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Jan Chaloupka
------------------------------
* Software Engineer          *
* ENG Base Operating Systems *
* Red Hat Czech, s. r. o.    *
* UTC+1 (CET), jchaloup      *

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
