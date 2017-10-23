From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: mount: /etc/fstab
Date: Mon, 23 Oct 2017 07:47:28 +0200
Message-ID: <CAKgNAkjcL1daPE+hCcHF2gHcqvj4O9bgXxuUgLuxrBjGGGM60A@mail.gmail.com>
References: <a131e54b-3b51-35d5-52b7-2908a01c4d1f@projektwerkstatt.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a131e54b-3b51-35d5-52b7-2908a01c4d1f-hsXoOLftXaMrK3VXJnZBaRvVK+yQ3ZXh@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kalle <kalle-hsXoOLftXaMrK3VXJnZBaRvVK+yQ3ZXh@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi,

On 22 October 2017 at 10:17, kalle <kalle-hsXoOLftXaMrK3VXJnZBaRvVK+yQ3ZXh@public.gmane.org> wrote:
> In the sentence "then mount looks for a mountpoint and if not found then
> for a device in the /etc/fstab file" it should be made clear that the
> mountpoint refers to the /etc/fstab-file, e.g. "then mount looks in the
> /etc/fstab file firstly for a mountpoint and if not found then secondly
> for a device". I did not understand the sentence until now and wondered,
> what was meant by 'mountpoint'.

Wrong project. Please see
http://man7.org/linux/man-pages/man8/mount.8.html#COLOPHON

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
