From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/1] ioctl-fat.2: new manpage for the ioctl fat API
Date: Tue, 3 Feb 2015 10:24:42 +0100
Message-ID: <CAKgNAkhrvdAauGAQOukGQ6B8MJ3kbYWivvrzzMJMaQOKsCq4sA@mail.gmail.com>
References: <CAKgNAkhuGYKtUKkm2+wU+TwQb6iZ+EmnLDdr4qg4fWHJyL9K5A@mail.gmail.com>
 <1422042884-10824-1-git-send-email-xypron.glpk@gmx.de> <CAKgNAkibtVVFS8Q7gwyn8t7B_qDTALtJ6K0H1rfecqb_p-AR6Q@mail.gmail.com>
 <87k2zze5tg.fsf@mail.parknet.co.jp>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87k2zze5tg.fsf-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: OGAWA Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org>
Cc: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>, "linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fsdevel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Hirofumi,

Thanks for checking the page over.

On 3 February 2015 at 09:51, OGAWA Hirofumi <hirofumi-UIVanBePwB70ZhReMnHkpc8NsWr+9BEh@public.gmane.org> wrote:
> "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> Hello Heinrich and Ogawa,
>
> Hi,
>
>> On 23 January 2015 at 20:54, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org> wrote:
>>> The ioctl(2) system call may be used to retrieve information about
>>> the fat file system and to set file attributes.
>>>
>>> This new manpage describes the details.
>>
>> @Ogawa, as the FAT maintainer, might you be willing to review this page?
>
>
>                for (;;) {
>
>                    /*
>                     * Read next directory entry.
>                     */
>                    ret = ioctl( fd, VFAT_IOCTL_READDIR_BOTH, entry);
>
>                    /*
>                     * If an error occurs, the return value is -1.
>                     * If d_reclen is zero, the end of the directory
>                     * list has been reached.
>                     */
>                    if (ret == -1 || entry[0].d_reclen == 0)
>                        break;
>
> Quick reviewed, and looks good. However, entry[0].d_reclen == 0 works as
> backward compatibility though. The example might be good to use usual
> way of getdents().
>
> I.e., "ret" means
>         -1 == error
>         0  == EOD
>         0  >  how many bytes read

Sorry -- I do not really understand what you mean here
"entry[0].d_reclen == 0 works as backward compatibility though"). Is
the line

                    if (ret == -1 || entry[0].d_reclen == 0)

incorrect? If yes, what should the code look like?

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
