From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: mt_attributes branch has been merged to man-pages mainline
Date: Fri, 27 Feb 2015 14:49:01 +0100
Message-ID: <CAKgNAkj8nY7CAxkQrTbCf4WvrfmLwF2=1fFDhouiFEQ2VcXJwg@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ma Shimiao <mashimiao.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, Qian Lei <qianl.fnst-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alexandre Oliva <aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Ma Shimiao,

I have merged the 'mt_attributes' branch into mainline, and deleted
the 'mt_attributes' branch on kernel.org. In the process, I needed to
do a rebase, so the commit hashes have changed.

Thus, around 450 new patches documenting multithread safety or
modifying the markup format to the new table form or fixing
differences between the glibc amd man-pages MT-Safety markings,
written by you and your colleagues Peng Haitao and Qian Lei, will go
out with the next man-pages release. Thank you to the three of you for
so much work that has gone into this.

Also in the next release will be the new attributes(7) page that I
created based on the text of Alexandre. (Thanks Alexandre for the
text, and Carlos, for enabling that!)

Ma Shimiao, as you have noted to me offlist, there there remain 3
man-pages whose MT-Safety markings differ from the markings in the
glibc manual. Hopefully in the coming weeks you can resolve these
differences with Alexandre. However, that resolution does not need to
hold up releasing all of the work that you and your colleagues at
Fujitsu have done.

Best regards,

Michael

PS By the way, in this work, Peng Haitao and you have respectively
become the second and fourth contributors of the most patches to
man-pages (at least: during my time as maintainer); and actually,
you'll soon move into third place, I see!

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
