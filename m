From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Tue, 1 Mar 2016 21:14:42 +0100
Message-ID: <56D5F832.3070209@gmail.com>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D5CA79.9030204-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Florian,

On 03/01/2016 05:59 PM, Florian Weimer wrote:
> On 03/01/2016 09:07 AM, Michael Kerrisk (man-pages) wrote:
>=20
>> I see that glibc 2.23 deprecates readdir_r(), which prompted me to c=
atch
>> up on this thread. I'd like to see the points you make documented in=
 the
>> readdir_r(3) man page also. Would you be willing to allow that text =
to
>> be reused / reworked for the page, under that page's existing "verba=
tim"
>> license (https://www.kernel.org/doc/man-pages/licenses.html#verbatim=
)?
>=20
> Hi Michael,
>=20
> thanks for keeping an eye on deprecations.  The deprecation happened =
for
> glibc 2.24 (unrelased).

Ah yes, I was getting ahead of myself. Fixed that in the page text belo=
w.

> I'm happy to report that I may grant your request.

Thanks!

>> The text I'd propose to add to the man page would be (new material
>> starting at =3D=3D=3D>):
>=20
> It may make sense to move this documentation to a separate manual pag=
e,
> specific to readdir_r.  This will keep the readdir documentation nice
> and crisp.  Most programmers will never have to consult all these det=
ails.

Yes, seems reasonable. Done.

> You should remove the example using pathconf because it is not correc=
t.

Done.

>  The kernel does not return valid values for _PC_NAME_MAX and some fi=
le
> systems (such as CIFS, and CD-ROMs with Joliet extensions once a kern=
el
> bug is fixed).  The CIFS limit is somewhere around 765, and not 255 a=
s
> reported by the kernel.  If I recall correctly, Windows SMB servers c=
an
> actually exceed the 255 byte limit.  The reason is that Windows NTFS =
has
> a limit based on 16-bit UCS-2 characters, and after UTF-8 conversion,
> the maximum length is more than 255 bytes.

What happens with readdir() when it gets a filename that is larger=20
than 255 characters?
>=20
>> =3D=3D=3D>   However, the above approach has problems, and it is rec=
ommended
>>        that  applications  use readdir() instead of readdir_r().  Fu=
r=E2=80=90
>>        thermore, since version  2.23,  glibc  deprecates  readdir_r(=
).

s/23/24/

>>        The reasons are as follows:
>>
>>        *  On  systems where NAME_MAX is undefined, calling readdir_r=
()
>>           may be unsafe because the interface does not allow the cal=
l=E2=80=90
>>           er to specify the length of the buffer used for the return=
ed
>>           directory entry.
>>
>>        *  On some systems, readdir_r() can't  read  directory  entri=
es
>>           with very long names.  When the glibc implementation encou=
n=E2=80=90
>>           ters such a name, readdir_r() fails with the error ENAMETO=
O=E2=80=90
>>           LONG after the final directory entry has been read.  On so=
me
>>           other systems, readdir_r() may return a success status,  b=
ut
>>           the  returned d_name field may not be null terminated or m=
ay
>>           be truncated.
>>
>>        *  In the current POSIX.1 specification  (POSIX.1-2008),  rea=
d=E2=80=90
>>           dir_r() is not required to be thread-safe.  However, in mo=
d=E2=80=90
>>           ern implementations (including  the  glibc  implementation=
),
>>           concurrent  calls  to  readdir_r()  that  specify  differe=
nt
>>           directory streams are thread-safe.  Therefore,  the  use  =
of
>=20
> These two references to readdir_r should be to readdir instead.

=46ixed.

>=20
> I believe there was a historic implementation which implemented
> fdopendir (fd) as (DIR *) fd, and used a global static buffer for
> readdir.  This is about the only way readdir can be non-thread-safe.
>=20
>>           readdir_r()  is  generally unnecessary in multithreaded pr=
o=E2=80=90
>>           grams.  In cases where multiple threads must read  from  t=
he
>>           same  directory  stream,  using readdir() with external sy=
n=E2=80=90
>>           chronization is still preferable to the use of  readdir_r(=
),
>>           for the reasons given in the points above.
>>
>>        *  It  is  expected  that a future version of POSIX.1 will ma=
ke
>>           readdir_r() obsolete, and require that readdir() be  threa=
d-
>>           safe  when  concurrently  employed  on  different  directo=
ry
>>           streams.

Thanks for all of the feedback Florian! The current versions of the
readdir(3) and readdir_r(3) have been pushed to the repo.

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
