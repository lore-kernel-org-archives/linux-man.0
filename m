From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Fix readdir_r with long file names
Date: Thu, 10 Mar 2016 18:06:46 +0100
Message-ID: <56E1A9A6.80207@gmail.com>
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
 <56D6294A.5040703@redhat.com> <56D6C2CA.2020609@gmail.com>
 <56E158F4.6040506@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E158F4.6040506-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Paul Eggert <eggert-764C0pRuGfqVc3sceRu5cw@public.gmane.org>, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rich Felker <dalias-/miJ2pyFWUyWIDz0JBNUog@public.gmane.org>, Carlos O'Donell <carlos-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, KOSAKI Motohiro <kosaki.motohiro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, libc-alpha <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>, Roland McGrath <roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org>, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 03/10/2016 12:22 PM, Florian Weimer wrote:
> On 03/02/2016 11:39 AM, Michael Kerrisk (man-pages) wrote:
>>        of the dname field.  POSIX defines it as char d_name[], a cha=
r=E2=80=90
>=20
> Should be =E2=80=9Cd_name=E2=80=9D instead of =E2=80=9Cdname=E2=80=9D=
=2E

=46ixed now.

> Otherwise looks fine.

Thanks, Florian!

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
