From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Online man-page bug report
Date: Sat, 08 Nov 2014 13:28:38 +0100
Message-ID: <545E0C76.1080705@gmail.com>
References: <359976CC29097E44A3692D5FC19521420B1B3AEC@nkgeml502-mbs.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <359976CC29097E44A3692D5FC19521420B1B3AEC-GAqTihkt0HzQdRb75tIIdwK1hpo4iccwjNknBlVQO8k@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Huxiaoxiang <huxiaoxiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 11/06/2014 10:26 AM, Huxiaoxiang wrote:
> http://man7.org/linux/man-pages/man5/proc.5.html
> 
>               (1) minflt  %lu  // This line should be '(10) minflt  %lu'.
>                         The number of minor faults the process has made
>                         which have not required loading a memory page from
>                         disk.
> 
>               (11) cminflt  %lu
>                         The number of minor faults that the process's
>                         waited-for children have made.

Thank you, Huxiaoxiang. Fixed.

Cheers,

Michael



> 
> Email: huxiaoxiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
> Huawei Technologies Co., Ltd.
> Bantian, Longgang District,Shenzhen 518129, P.R.China
> http://www.huawei.com
> ________________________________
> This e-mail and its attachments contain confidential information from HUAWEI, which
> is intended only for the person or entity whose address is listed above. Any use of the
> information contained herein in any way (including, but not limited to, total or partial
> disclosure, reproduction, or dissemination) by persons other than the intended
> recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender by
> phone or email immediately and delete it!
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
