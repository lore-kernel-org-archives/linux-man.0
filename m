From: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Wed, 2 Mar 2016 00:07:22 +0100
Message-ID: <56D620AA.40108@redhat.com>
References: <51B0B39F.4060202@redhat.com> <51B0BD36.3030202@redhat.com>
 <CAHGf_=r9Rz63pho+84ORk0a_oDyJSj-MCnZ56uPrT3L6sVEfeQ@mail.gmail.com>
 <20130607013024.GO29800@brightrain.aerifal.cx> <51B19203.3070307@redhat.com>
 <20130607144143.GQ29800@brightrain.aerifal.cx> <51B57E35.4080403@redhat.com>
 <51B65EA7.2020402@redhat.com> <20130611011324.GT29800@brightrain.aerifal.cx>
 <51B8702D.2060505@redhat.com>
 <20130813040038.GE21795@spoyarek.pnq.redhat.com>
 <520C88A6.9070501@redhat.com> <56D54DAD.1040306@gmail.com>
 <56D5CA79.9030204@redhat.com> <56D5F832.3070209@gmail.com>
 <56D5FB3D.5000306@redhat.com> <56D607BB.6080701@cs.ucla.edu>
 <56D614AA.7020500@redhat.com> <56D61A86.3050108@cs.ucla.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D61A86.3050108-764C0pRuGfqVc3sceRu5cw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/01/2016 11:41 PM, Paul Eggert wrote:
> On 03/01/2016 02:16 PM, Florian Weimer wrote:
>>> Why not use a flexible array member for this?
>> For which part, and how exactly?
>=20
> Something like the attached patch, say.  (Totally untested.)
>=20
>> You can't put a flexible array member into a transparent union.
>=20
> That's OK. Any such usage of struct dirent would be unportable anyway=
=2E
>=20
>> If you mean to add some zero-width padding member at the end of the
>> struct, after the d_name member, then I'm worried that makes overrun=
ning
>> the d_name array member even more undefined than it already is.
>=20
> No, no padding member, just use C99 the way it was designed.  This
> should improve overrun detection in programs like valgrind. With glib=
c's
> current definition these programs can be fooled into thinking that
> struct dirent accesses are invalid (outside of array bounds) when the=
y
> are actually OK, so people shut off array-bounds checking. If we used
> flexible array members, valgrind etc. should know that the array's up=
per
> bound is unknown and should not issue so many false alarms, so people
> can leave bounds checking on.

I don't think valgrind can see the difference, but you are correct in
principle (this is essentially the =E2=80=9Cundefined=E2=80=9D part I w=
as worried about).

Unfortunately, GCC does not produce a warning for taking the size of a
struct with a flexible member, or for using it in a non-pointer
declarator, so it does only half of what we want.  And at the cost of
changing sizeof (struct dirent), which can't be a good thing.

> If flexible arrays are no-go for some reason, I suppose we could use
> 'char 'd_name[SIZE_MAX - 1000];' instead. That should get peoples'
> attention. :-)

GCC refuses to compile the type definition, not just declarations.
Refusing declarations with an error would break quite a lot of existing
configure tests.

  struct dirent d; int z; z - d.d_ino;

is a common idiom to check for struct members.

=46lorian
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
