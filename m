From: =?KOI8-R?B?7cHSyyDrz9LFzsLF0sc=?= <socketpair-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mmap2.2: add definition of mmap64
Date: Sun, 15 Nov 2009 19:27:09 +0500
Message-ID: <b8f627e0911150627v170ba31emb47d43fd4f05e6f1@mail.gmail.com>
References: <b8f627e0911102333x2cd4454ew33443b4c62e7d44d@mail.gmail.com>
	 <b8f627e0911140838u968f244m85570d85ba906b3@mail.gmail.com>
	 <20091114192902.GU3708@machine.or.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091114192902.GU3708-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>
List-Id: linux-man@vger.kernel.org

2009/11/15 Petr Baudis <pasky-+ZI9xUNit7I@public.gmane.org>:
> On Sat, Nov 14, 2009 at 09:38:00PM +0500, =ED=C1=D2=CB =EB=CF=D2=C5=CE=
=C2=C5=D2=C7 wrote:
>> mmap64 in ubuntu is symlink to mmap2, but no actual definition of
>> mmap64 in man page (!).
>
>> --- mmap2.2.was =9A =9A =9A 2008-12-06 08:55:24.000000000 +0500
>> +++ mmap2.2 =9A 2009-11-11 12:27:26.000000000 +0500
>> @@ -33,8 +33,12 @@
>> =9A.nf
>> =9A.B #include <sys/mman.h>
>> =9A.sp
>> +.B /* Linux syscall */
>> =9A.BI "void *mmap2(void *" addr ", size_t " length ", int " prot ,
>> =9A.BI " =9A =9A =9A =9A =9A =9A int " flags ", int " fd ", off_t " =
pgoffset );
>> +.sp
>> +.BI "void *mmap64(void *" addr ", size_t " length ", int " prot ,
>> +.BI " =9A =9A =9A =9A =9A =9A int " flags ", int " fd ", off64_t " =
byteoffset );
>> =9A.fi
>> =9A.SH DESCRIPTION
>> =9AThe
>
> Then there should be also some word in the manpage about what mmap64(=
)
> actually is?
>
> --
> =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9A =9APetr "=
Pasky" Baudis
> A lot of people have my books on their bookshelves.
> That's the problem, they need to read them. -- Don Knuth
>
Reading 'man mmap2' is what I want. I understood all I need. I can't
build correct (in English) sentences, describing mmap64, but I want
this be specified:
1. mmap2 now can use offsets with 32+12=3D44 bits long, and not 64 ! if
bigger offset specified, results are undefined.
2. file 'fd' should be opened with O_LARGEFILE for offsets bigger than =
4GB? 2GB?
3. mmap64 is libc wrapper around mmap2 syscall.
4. Dont't know, but special #define should be used in order to use
64-bit-offset functions.

--=20
Segmentation fault
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
