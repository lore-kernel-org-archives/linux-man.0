From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch 1/2] adjtimex.2: remove nonexisting reference to adjtimex(8)
Date: Tue, 30 Dec 2014 13:53:15 +0100
Message-ID: <54A2A03B.8030208@gmail.com>
References: <54788059.6020209@supelec.fr> <CAKgNAkhVxy9J4dQCGwEBNwWFj_vwj=xN0JNtBx=sECgP-GiusA@mail.gmail.com> <54799E6E.2030600@supelec.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54799E6E.2030600-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Georget <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Laurent,

(Sorry for the delayed follow-up.)

On 11/29/2014 11:22 AM, Laurent Georget wrote:
> Hello again,
>=20
> Le 29/11/2014 10:17, Michael Kerrisk (man-pages) a =C3=A9crit :
>> Hello Laurent,
>>
>> On Fri, Nov 28, 2014 at 3:02 PM, Laurent Georget
>> <laurent.georget-vbcOdlJ0SulGWvitb5QawA@public.gmane.org> wrote:
>>> Hello,
>>>
>>> This is a patch I sent to mtk.manpages-Re5JQEeQqe9fmgfxC/sS/w@public.gmane.org It didn't make it=
s way
>>> to this mailing-list the first time. It's a trivial fix for an unde=
fined
>>> reference to adjtimex(8). Patch you received before (adjtimex.2: ad=
d
>>> explanation about ADJ_TAI action) is patch 2/2 for adjtimex.2.
>>
>> This does not seem correct to me. Certainly on my Fedora system, the=
re
>> is an "adjtimex" package that installs adjtimex(8) page. So, this
>> reference seems okay to me. Did I miss something?
>>
>=20
> Ok, indeed, my mistake. This package is not part of the core system o=
n
> my distribution so I found it surprising to have a link from a man2 p=
age
> to a nonexisting man8 page. But now that I give a closer look, the ca=
se
> is the same for request_key.2 linking to request_key.8 for example so
> I'm wrong.

It's not a really mistake on your part. See below.

> What is the policy to include a link from section 2 to section 1 or 8=
? I
> guess I'm misundestanding something here? Given the case of adjtimex(=
2)
> linking to adjtimex(8) because there is an adjtimex package which
> installs it, should we include a link in inotify_{init,add,...} to
> inotifywait.1 for example? I've always thought that pages in section =
1
> (or 8) and 2 should just include a link to a general page in section =
7
> to remain generic enough through time.

To date, the policy is implicit. I've tried to make it a little more=20
explicit by just now adding the following text to man-pages(7):
=20
    Given the distributed, autonomous nature of FOSS projects
    and their documentation, it is sometimes necessary=E2=80=94and in
    many cases desirable=E2=80=94that the SEE ALSO  section  includes
    references to manual pages provided by other projects.

Regarding your inotify example, I tried to address that case
a while ago with some additions in inotify(7). But, in the general
case, sometimes these references aren't in the man pages simply=20
because no one yet thought to add or suggest them.

Thanks,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
