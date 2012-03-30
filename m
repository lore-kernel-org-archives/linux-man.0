From: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Subject: Re: [patch] nsswitch.conf.5: update for readability and latest glibc
Date: Fri, 30 Mar 2012 10:28:15 +0100
Message-ID: <042c392d-fe53-49e9-99e5-84737f1ca2f4@email.android.com>
References: <51634.1318537560@proseconsulting.co.uk> <CAKgNAkjAsWSiZEhFqnhFQDiFzLxcPzHQ1OweZswtB4q-fRf-ig@mail.gmail.com> <4F74CFDC.10802@proseconsulting.co.uk> <CAKgNAkjddHc9_snmdiEucEnVFEwVVz2JxijdNncATTKROgzbqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjddHc9_snmdiEucEnVFEwVVz2JxijdNncATTKROgzbqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

>>> Thanks Mark. This looks good. I've done some light edits. Could you
>>> please review the below (also attached).
>>
>>
>> Hi Michael,
>>
>> I've reviewed your edits. They're almost all good, but I've had to c=
ounter
>> some of your light edits. Latest version below and attached.
>
> Hi Mark,
> Can you explain your changes? It looks like they mostly revert my add=
itions of commas and formatting consistency with other pages.
> Why?
> Thanks, Michael

Hi Michael,

It's hard to know what exactly we're talking about here because your li=
ght edits were not supplied in a way that could easily be reviewed.  In=
 fact, I had to diff the two to find out what you had edited.

I suggest the best approach is for you to apply my original patch unedi=
ted, then submit to this list a new patch with your suggested edits.  T=
hen it will be easier for us to discuss which edits I didn't believe we=
re correct or necessary, and others would also have transparency and be=
 able to comment if they wished too.

Could you do that?

Thanks,
Mark.


-------- Original Message --------
=46rom: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sent: Fri Mar 30 00:22:24 GMT+01:00 2012
To: Mark R Bannister <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: Re: [patch] nsswitch.conf.5: update for readability and latest=
 glibc

On Fri, Mar 30, 2012 at 10:10 AM, Mark R Bannister
<mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> wrote:
> On 29/03/2012 19:33, Michael Kerrisk (man-pages) wrote:
>>
>> On Fri, Oct 14, 2011 at 9:26 AM, Mark R Bannister
>> <mark-/K+B3afwL8Jt0JrxVvvTASp2UmYkHbXO@public.gmane.org> =C2=A0wrote:
>>>
>>> Hi,
>>>
>>> This patch applies to nsswitch.conf.5 in man-pages-3.36.
>>>
>>> My changes almost completely rewrite large sections of the man page=
=2E
>>> =C2=A0They are needed to add clarity, correct grammar, reduce confu=
sion, and
>>> bring up-to-date with the latest glibc. =C2=A0I have checked the ma=
n page against
>>> the nss source code in glibc 2.14.90.
>>>
>>> Historical notes are demoted to the footer.
>>>
>>> I believe the rewrite makes the man page much clearer to understand=
, more
>>> authoratitive and easier to read.
>>>
>>> A web version of the man page is available here for proof reading:
>>> http://prose.sourceforge.net/man/linux/nsswitch.conf.5.html
>>>
>>> A patch is copied below, and also attached to this message.
>>>
>>> I am happy for my work to be released under the terms of the GNU Ge=
neral
>>> Public License.
>>
>> Thanks Mark. This looks good. I've done some light edits. Could you
>> please review the below (also attached).
>>
>
> Hi Michael,
>
> I've reviewed your edits. =C2=A0They're almost all good, but I've had=
 to counter
> some of your light edits. =C2=A0Latest version below and attached.

Hi Mark,

Can you explain your changes? It looks like they mostly revert my
additions of commas and formatting consistency with other pages. Why?

Thanks,

Michael

--=20
Sent from my HTC
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
