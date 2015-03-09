From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: undocumented man pages
Date: Mon, 9 Mar 2015 08:06:30 +0100
Message-ID: <CAKgNAkhvGtPMwq1kdf-ZJZ=FNGQqLjHuyakgbaUqLbdhAueL-A@mail.gmail.com>
References: <20150307145716.GA24297@free.fr> <54FC0369.3010705@gmail.com> <20150308111240.GA1839@free.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150308111240.GA1839-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?St=C3=A9phane_Aulery?= <saulery-GANU6spQydw@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 8 March 2015 at 12:12, St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org> wrote:
> Hello Michael,
>
> Le dimanche 08 mars 2015 =C3=A0 09:08:09, Michael Kerrisk (man-pages)=
 a =C3=A9crit :
>>
>> On 03/07/2015 03:57 PM, St=C3=A9phane Aulery wrote:
>> >
>> > What do you think about to add a "undocumented" page for each sect=
ion (as
>> > undocumented.3) and create each missing pages with a reference to =
the
>> > appropriate "undocumented" page. Thus we can also encourage users =
to become
>> > contributors and avoid unnecessary reports.
>>
>> My problem with this idea is that my simple test when wondering if
>> a man page exists for an API is to look in the appropriate man?/
>> directory for a file with the right name. With the scheme above, I t=
hen
>> need to look inside the file to see if it is a link to undocumented.=
x.
>> That would be a small inconvenience.
>
> How is obtained the list of missing pages? Another solution would be =
to
> provide a script that generates the missing pages with the redirectio=
n.

I worked from scripts shown at
https://www.kernel.org/doc/man-pages/missing_pages.html
but manual work on top of that was also needed.

>> Yes, the reports about missing pages are a minor irritation, but I'm
>> a little doubtful that such an "undocumented" page would encourage m=
uch
>> contribution. (I could be wrong, that's just my guess.)
>
> I too could be wrong. I'm probably too optimistic. I feel that if the
> user sees clearly that the page is not yet written and needs of its
> contribution, it is better information for him and a better chance fo=
r
> us.

Maybe. So, here's another idea. Since I don't really want to pollute
the Git repo with a lot of useless links, another possibility would be
a release-time script that generates the "undocumented" pages from
plain test file lists (e.g., one function name per line). Those lists
could live in the Git repo, and then be used to autogenerate a page
such as undocumented(3) (which does *not* list  a lot of the
undocumented functions, and has no links). Thoughts?

> PS: Thank you for patches, you are very responsive !

Not always, unfortunately. Things get dropped too often. You should
ping when I don't respond to patches in a week or two.

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
