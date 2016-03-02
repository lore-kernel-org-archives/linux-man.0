From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Wed, 2 Mar 2016 11:39:06 +0100
Message-ID: <56D6C2CA.2020609@gmail.com>
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
 <56D620AA.40108@redhat.com> <56D624FE.1090702@cs.ucla.edu>
 <56D6294A.5040703@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D6294A.5040703-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/02/2016 12:44 AM, Florian Weimer wrote:
> On 03/02/2016 12:25 AM, Paul Eggert wrote:
>=20
>>> And at the cost of
>>> changing sizeof (struct dirent), which can't be a good thing.
>>
>> Any program that depends on sizeof (struct dirent) is broken already=
, so
>> this isn't that worrisome.
>=20
> Just to be clear, you looked at the wrong struct dirent definition fo=
r
> GNU/Linux, there is a sysdeps override.
>=20
> Right now, most programs relying on sizeof (struct dirent) work well =
in
> almost all cases.  We really don't want to break that.  There appears=
 to
> be an overlap between these programs and users of readdir_r, so once =
we
> remove that from the API, we should have better story for struct dire=
nt
> declarators as well.

So, it seems like much more could be said about this in documentation.
How about the following text for the man page?

   DESCRIPTION

       [...]

       In the glibc implementation, the dirent structure is defined as
       follows:

           struct dirent {
               ino_t          d_ino;       /* Inode number */
               off_t          d_off;       /* Not an offset; see below =
*/
               unsigned short d_reclen;    /* Length of this record */
               unsigned char  d_type;      /* Type of file; not support=
ed
                                              by all filesystem types *=
/
               char           d_name[256]; /* Null-terminated filename =
*/
           };

       [...]
   NOTES
     The d_name field
       The  dirent  structure definition shown above is taken from the
       glibc headers, and shows the d_name field with a fixed size.

       Warning: applications should avoid any dependence on  the  size
       of the dname field.  POSIX defines it as char d_name[], a char=E2=
=80=90
       acter array of unspecified size, with at most NAME_MAX  charac=E2=
=80=90
       ters preceding the terminating null byte ('\0').

       POSIX.1  explicitly notes that this field should not be used as
       an  lvalue.   The  standard  also  notes  that   the   use   of
       sizeof(d_name)  (and  by  implication sizeof(struct dirent)) is
       incorrect; use strlen(d_name) instead.  (On some systems,  this
       field is defined as char d_name[1]!)

       Note that while the call

           fpathconf(fd, _PC_NAME_MAX)

       returns the value 255 for most filesystems, on some filesystems
       (e.g., CIFS, Windows SMB servers), the null-terminated filename
       that is (correctly) returned in d_name can actually exceed this
       size.  (In such cases, the d_reclen field will contain a  value
       that  exceeds  the  size  of  the  glibc dirent structure shown
       above.)

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
