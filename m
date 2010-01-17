From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: sync_file_range.2: add some big WARNINGS
Date: Sun, 17 Jan 2010 18:48:03 +1300
Message-ID: <cfd18e0f1001162148w78c3ebe8u9d54fdeb7dac8892@mail.gmail.com>
References: <20090827180116.GB31605@lst.de> <20100109144910.GA30167@lst.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100109144910.GA30167-jcswGhMUV9g@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Christoph,

On Sun, Jan 10, 2010 at 3:49 AM, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org> wrote:
> Are you going to put this or some equivalent note in? =A0 Currently t=
he
> manpages is extremly dangerous as it doesn't warn people about this
> system call not actually guaranteeing any data integrity.

I lightly edited your patch, and applied it. Sorry for the long delay.

Cheers,

Michael

> On Thu, Aug 27, 2009 at 08:01:16PM +0200, Christoph Hellwig wrote:
>> This system call is by design completely unsuitable for any data
>> integrity operations. =A0Make that very clear in the manpage.
>>
>>
>> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
>>
>> Index: man-pages/man2/sync_file_range.2
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- man-pages.orig/man2/sync_file_range.2 =A0 =A0 2009-08-27 14:51:5=
1.373360594 -0300
>> +++ man-pages/man2/sync_file_range.2 =A02009-08-27 14:57:35.21385492=
7 -0300
>> @@ -80,11 +80,22 @@ after performing any write.
>> =A0Specifying
>> =A0.I flags
>> =A0as 0 is permitted, as a no-op.
>> -.SS Some details
>> -None of these operations write out the file's metadata.
>> +.SS WARNING
>> +This system call is extremly dangerous and should not be used in po=
rtable
>> +programs. =A0None of these operations write out the file's metadata=
=2E
>> =A0Therefore, unless the application is strictly performing overwrit=
es of
>> -already-instantiated disk blocks,
>> -there are no guarantees that the data will be available after a cra=
sh.
>> +already-instantiated disk blocks, there are no guarantees that the =
data will
>> +be available after a crash. =A0There is no user interface to know i=
f a
>> +write is purely an overwrite. On filesystem using copy on write sem=
antics
>> +like
>> +.IR btrfs
>> +an over write of existing allocated blocks is impossible. =A0Writin=
g into
>> +pre-allocated space many filesystems also require calls into the bl=
ock
>> +allocator which this system call does not sync out to disk.
>> +This system call does not flush disk write caches and thus does not=
 provide
>> +any data integrity on systems with volatile disk write caches.
>> +
>> +.SS Some details
>>
>> =A0.B SYNC_FILE_RANGE_WAIT_BEFORE
>> =A0and
> ---end quoted text---
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
