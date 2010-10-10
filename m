From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sync_file_range2() man page
Date: Sun, 10 Oct 2010 07:58:49 +0200
Message-ID: <AANLkTi=PDJRMt4eE+NUFbPNzsngjN65R=T3D3nnT-mOz@mail.gmail.com>
References: <AANLkTi=WLtBgVaasueS_E59NpCJ++GP5sF4fFUdP+4T_@mail.gmail.com> <201010091440.58657.stephan.mueller@atsec.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201010091440.58657.stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Stephan,

On Sat, Oct 9, 2010 at 2:40 PM, Stephan Mueller
<stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org> wrote:
> Am Samstag, 9. Oktober 2010, um 05:39:08 schrieb Michael Kerrisk:
>
> Hi Michael,
>
>> [was: man pages for undocumented system calls]
>>
>> Stephan,
>>
>> Thanks for this page. It is worth documenting the existence of this
>> system call, but we need to do it differently:
>>
>> 1. It's best documented as an addition to the sync_file_rabge.2 page.
>>
>> 2. There needs to be an explanation of why the system call exists.
>>
>> I wrote the patch below for man-pages-3.29.
>
> Thanks a lot. Your suggestion seems to be more appropriate than a separate man
> page.
>
> But could you please add a symlink from sync_file_range2.2.gz
> sync_file_range.2.gz.

Already done ;-).

Cheers,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
