From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fts.3 is not available in LFS builds
Date: Mon, 17 Mar 2014 14:56:36 +0100
Message-ID: <5326FF14.7010305@gmail.com>
References: <20140315135416.GA10430@infradead.org> <CAKgNAkgqXUf0yWaXyAD7yBJgivp9Jmwvz4EAnh_DpyActuoGwA@mail.gmail.com> <20140316172219.GA16900@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140316172219.GA16900-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/16/2014 06:22 PM, Christoph Hellwig wrote:
> On Sat, Mar 15, 2014 at 03:47:26PM +0100, Michael Kerrisk (man-pages)=
 wrote:
>>>  4.4BSD.
>>> +.SH BUGS
>>> +All the APIs described in this manpage are not safe when compiling
>>
>> Should this perhaps better read "not safe on 32-bit systems"?
>=20
> Well, it works:
>=20
>  a) on a 32-it system if _FILE_OFFSET_BITS is 32 (currently the defau=
lt)
>  b) on any 64-bit system
>=20
> Not sure what the best langauge is to communicate this issue to the
> user.
>=20
>=20

I made it

    BUGS
       All  of  the  APIs described in this man page are not safe when
       compiling a program using the LFS APIs  (e.g.,  when  compiling
       with  -D_FILE_OFFSET_BITS=3D64).  This means these APIs are unus=
=E2=80=90
       able on current 32-bit systems, since those  systems  are  nor=E2=
=80=90
       mally built with -D_FILE_OFFSET_BITS=3D64.


Okay?

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
