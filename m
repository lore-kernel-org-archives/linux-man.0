From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] tsearch.3: dispose properly of allocated resources in example code
Date: Tue, 23 Sep 2008 15:56:42 +0200
Message-ID: <cfd18e0f0809230656x15fdfb50v634cf088946c7af1@mail.gmail.com>
References: <200809210310.43647.andre.goddard@gmail.com>
	 <cfd18e0f0809222328r599e22c1je0f4261ee969bca8@mail.gmail.com>
	 <b8bf37780809230623k62d43d6cgf11af4820566cd2d@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b8bf37780809230623k62d43d6cgf11af4820566cd2d-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andr=E9,

On Tue, Sep 23, 2008 at 3:23 PM, Andr=E9 Goddard Rosa
<andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Sep 23, 2008 at 3:28 AM, Michael Kerrisk
> <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> Andr=E9,
>>
>> On Sun, Sep 21, 2008 at 8:10 AM, Andr=E9 Goddard Rosa
>> <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> As there are many users who base their own code on these examples, =
we
>>> should avoid leaking memory when using functions of tsearch() famil=
y.
>>> In the provided example, tsearch() leaks memory whenever it tries t=
o
>>> insert a number which was already inserted before.
>>
>> Thanks.  My first patch applied via 'git am'!
>>
>> I applied this patch for man-pages-3.10.  (I added
>> #define _GNU_SOURCE
>> since that's required to expose the tdestroy() declaration.)
>>
>
> Hi, Michael!
>
>    Very nice, thank you! Good to know that you're using git.

(At last... '-).)

>    I appreciate your work in the man pages, they were improved a lot
> since you've started working on them.

Thanks!

> Also, I appreciate your concerns
> regarding paccept().
>
>    Notice that I sent two different patches in a sequence (sorry for =
that).

It's a good thing you mentioned this, since I did _not_ notice that:
you sent two mails at almost the same, with the same description, and
which looked otherwise identical (unless one looked very close), so I
assumed you had accidentally sent the same mail twice.  (Best to
change the description a little so I know you are resending a
different patch.)

> This is the first one:
>
>> +        else if (!((*(int **) val) =3D=3D ptr))
>
> and this is the second one:
>
> +        else if ((*(int **) val) !=3D ptr)
>
>    They work the same, but second is cleaner and simpler ;-)

Okay -- I've fixed the page to use the second version.  And you only
just got that one in in time for 3.10!

Thanks,

Michael
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
