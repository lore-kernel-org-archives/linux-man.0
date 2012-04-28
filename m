From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: malloc_info(3) man page for review
Date: Sat, 28 Apr 2012 16:44:39 +1200
Message-ID: <CAKgNAkh0y6EdZqPhikzbhHd+Uu6P+=6PCj2bOn0E_ueH36qJuA@mail.gmail.com>
References: <CAKgNAki-o30f4NfBOa1wJ7Ro=OaE77yHeci5Svk2KaEoQPKffg@mail.gmail.com>
 <20120427073552.GU6148@sunsite.ms.mff.cuni.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120427073552.GU6148-OfajU3CKLf2drXQlwEn0SEJFmxxWawaa@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jakub,

On Fri, Apr 27, 2012 at 7:35 PM, Jakub Jelinek <jakub-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote=
:
> On Fri, Apr 27, 2012 at 03:59:58PM +1200, Michael Kerrisk (man-pages)=
 wrote:
>> Gidday,
>>
>> I've written the man page page below to document glibc's
>> malloc_info(3). Review comments welcome!
>
> I think it would be nice to mention there that e.g. open_memstream (o=
r
> fmemopen) could be used to store the XML output into a buffer in the
> program rather than into some file. =A0IMHO that is quite common thin=
g and
> thus could be hinted in the man page.

Thanks. I had a subtle hint on the page: SEE ALSO lists fmemopen(3).
But, your comment makes me think that it's better to be more explicit.
Under NOTES, I added

=3D=3D
The
=2EBR open_memstream (3)
function can be used to send the output of
=2EBR malloc_info ()
directly into a buffer in memory, rather than to a file.
=3D=3D

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
