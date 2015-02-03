From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 3 Feb 2015 10:54:53 +0100
Message-ID: <CAKgNAkh81o6FGY-M5HX5Qt+kk9S8SPW+WcqOZBrA+5PdEn+RGg@mail.gmail.com>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
 <1422042884-10824-1-git-send-email-xypron.glpk@gmx.de> <CAKgNAkibtVVFS8Q7gwyn8t7B_qDTALtJ6K0H1rfecqb_p-AR6Q@mail.gmail.com>
 <87k2zze5tg.fsf@mail.parknet.co.jp> <CAKgNAkhrvdAauGAQOukGQ6B8MJ3kbYWivvrzzMJMaQOKsCq4sA@mail.gmail.com>
 <87fvane3ch.fsf@mail.parknet.co.jp>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87fvane3ch.fsf-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: OGAWA Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Hirofumi,

On 3 February 2015 at 10:44, OGAWA Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>>> Quick reviewed, and looks good. However, entry[0].d_reclen == 0 works as
>>> backward compatibility though. The example might be good to use usual
>>> way of getdents().
>>>
>>> I.e., "ret" means
>>>         -1 == error
>>>         0  == EOD
>>>         0  >  how many bytes read
>>
>> Sorry -- I do not really understand what you mean here
>> "entry[0].d_reclen == 0 works as backward compatibility though"). Is
>> the line
>>
>>                     if (ret == -1 || entry[0].d_reclen == 0)
>>
>> incorrect? If yes, what should the code look like?
>
> Sorry. I meant, "entry[0].d_reclen == 0" check works because fatfs still
> have backward compatibility code. However it would not be preferred way.
>
> In ancient version, fatfs didn't return proper return code, so apps (I
> know only use is wine) had to check "entry[0].d_reclen == 0" to know
> EOD.
>
> But for a long time, fatfs returns proper return code like said in
> previous email (previous email was wrong on "0 > how many bytes read",
> see below instead). I.e., now user can use "ret" as similar to
> getdents(), user can know the result as usual from "ret" without
> "entry[0].d_reclen == 0".
>
>         while (1) {
>                 ret = ioctl();
>                 if (ret == -1) {
>                         /* error */
>
>                 if (ret == 0)
>                         /* EOD */
>
>                 /* got entry (would be ret == 1) */
>         }

Thanks for the clarification. I have one other question. Currently the
man page does not document two fields in the __fat_dirent structure:
d_ino and d_offset. d_ino is presumably the inode number. But, what is
d_offset?

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
