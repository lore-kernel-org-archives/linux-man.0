From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: arm_fadvise() man page
Date: Sun, 10 Oct 2010 07:57:43 +0200
Message-ID: <AANLkTi=L=BeGNi+wkVcLh0P_JATSFyt8jTUPx_L_kknR@mail.gmail.com>
References: <AANLkTinQ7xBBa1VqR9oiLoh=7JCiR7BAeFceE3Cgc+TT@mail.gmail.com> <201010091440.12442.stephan.mueller@atsec.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201010091440.12442.stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephan Mueller <stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Stephan,

On Sat, Oct 9, 2010 at 2:40 PM, Stephan Mueller
<stephan.mueller-fwYZOkdEjagAvxtiuMwx3w@public.gmane.org> wrote:
> Am Samstag, 9. Oktober 2010, um 06:50:29 schrieb Michael Kerrisk:
>
> Hi Michael,
>
>> [Was: man pages for undocumented system calls]
>>
>> Stephan,
>>
>> The situation here is similar to sync_file_range, but specific to ARM.
>> The documentation would better be in the posix_fadvise() page, should
>> explicitly note that this system call is for ARM only, and should note
>> why the system call exists. For man-pages-3.29, I applied the patch
>> below.
>
> Same here, I think your approach is better than a stand-alone man page.
>
> Nevertheless, are you going to please add a symlink from posix_fadvise.2.gz to
> arm_fadvise.2.gz?

Thanks for reminding me of this, but in fact I already made such a
link. I added a link arm_fadvise64_64.2, since that is the precise
name of the system call. But, on reflection, perhaps it does not hurt
to also add a link arm_fadvise.2, so I've also added that one now.

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
