From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 3 Feb 2015 10:21:53 +0100
Message-ID: <CAKgNAki1EnYx+chg1eouwF54youb_tjQ+hW9Ea_M_=cvccu1nA@mail.gmail.com>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
 <1422042884-10824-1-git-send-email-xypron.glpk@gmx.de> <5984550D-1518-490C-9A3F-3F9B1FA2EA00@dilger.ca>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5984550D-1518-490C-9A3F-3F9B1FA2EA00-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, Ogawa Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>, Linux Filesystem Development List <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andreas,

Thanks for checking over the page.

On 3 February 2015 at 09:49, Andreas Dilger <adilger-m1MBpc4rdrD3fQ9qLvQP4Q@public.gmane.org> wrote:
> On Jan 23, 2015, at 12:54 PM, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
>>
>> The ioctl(2) system call may be used to retrieve information about
>> the fat file system and to set file attributes.
>>
>> This new manpage describes the details.
>>
>> Michael Kerrisk suggested to CC linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org and
>> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org for review.
>>
>> version 3: correct typos
>> version 2: consider comments by Michael Kerrisk
>> verison 1: original patch
>>
>> Signed-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>> ---
>> man2/ioctl-fat.2 | 442 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 442 insertions(+)
>> create mode 100644 man2/ioctl-fat.2
>>
>> diff --git a/man2/ioctl-fat.2 b/man2/ioctl-fat.2
>> new file mode 100644
>> index 0000000..80891d8
>> --- /dev/null
>> +++ b/man2/ioctl-fat.2
>> @@ -0,0 +1,442 @@
>> +.\" Copyright (C) 2014, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>> +.\"
>> +.\" %%%LICENSE_START(VERBATIM)
>> +.\" Permission is granted to make and distribute verbatim copies of this
>> +.\" manual provided the copyright notice and this permission notice are
>> +.\" preserved on all copies.
>> +.\"
>> +.\" Permission is granted to copy and distribute modified versions of
>> +.\" this manual under the conditions for verbatim copying, provided that
>> +.\" the entire resulting derived work is distributed under the terms of
>> +.\" a permission notice identical to this one.
>> +.\"
>> +.\" Since the Linux kernel and libraries are constantly changing, this
>> +.\" manual page may be incorrect or out-of-date.  The author(s) assume.
>> +.\" no responsibility for errors or omissions, or for damages resulting.
>> +.\" from the use of the information contained herein.  The author(s) may.
>> +.\" not have taken the same level of care in the production of this.
>> +.\" manual, which is licensed free of charge, as they might when working.
>
> There are extraneous periods at the end of each of these lines.

Fixed.

[...]

>> +The bits of the bit mask are
>> +.TP
>> +.B ATTR_RO
>> +This bit specifies that the file or directory is read-only.
>
> It's too bad that these constants have such generic names. It would
> be better to use MSDOS_ATTR_* or FAT_ATTR_*, since these are also
> exposed to userspace, but are only used by FAT.

Agreed. Too late now, I guess, though.

Cheers,

Michael
-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
