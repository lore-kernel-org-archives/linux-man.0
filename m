From: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: +
	prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
	.patch added to -mm tree
Date: Fri, 19 Aug 2011 15:13:39 +0200
Message-ID: <20110819131339.GB8411@redhat.com>
References: <20110817115543.GA8745@redhat.com> <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ@mail.gmail.com> <20110817134516.GA14136@redhat.com> <20110818124353.GA2839@tango.0pointer.de> <20110818142508.GA30959@redhat.com> <1313691091.1107.9.camel@mop> <20110818184857.GA12094@redhat.com> <1313717521.991.4.camel@mop> <20110819122503.GA8411@redhat.com> <CAPXgP11KC2fTWBVYo6CBXe924YAyTGhx9=UTBDf4cP5Acuo0NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPXgP11KC2fTWBVYo6CBXe924YAyTGhx9=UTBDf4cP5Acuo0NA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Cc: Lennart Poettering <mzxreary-uLTowLwuiw4b1SvskN2V4Q@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 08/19, Kay Sievers wrote:
>
> On Fri, Aug 19, 2011 at 14:25, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> >> + =A0 =A0 =A0 =A0 =A0 =A0 case PR_SET_CHILD_SUBREAPER:
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 me->signal->is_child_sub=
reaper =3D !!arg2;
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 me->signal->has_child_su=
breaper =3D true;
> >
> > Hmm. This looks wrong... why do we set ->has_child_subreaper?
>
> That's the flag we pass down to our childs, hence we need to set it h=
ere.

Aha, I see. I've misread copy_signal(), it copies ->has_child_subreaper=
,
_not_ ->is_child_subreaper (as I wrongly thought) from parent. And I wa=
s
going to blame this logic in the next email, I already started to write=
 it ;)

But this has other (OK, minor) problems too, afaics. First of all, this
->has_child_subreaper =3D T is not right when the caller exits. We shou=
ld
not look for ->is_child_subreaper parent, our children should to find u=
s.

Right?

And. afaics this makes the semantics of prctl(REAPER) a bit unclear...
Suppose a task P does

	C1 =3D fork();

	prctl(REAPER);

	C2 =3D fork();

In this case it "owns" the children of C2, but not C1. This is fine, an=
d
perhaps this is even better.

But what if P->parent did prctl(REAPER) too? Then P becomes the sub-rea=
per
for the tasks which were forked before prctl().

In short, in general the caller of prctl(REAPER) doesn't know how this
can affect the forks in the past.

Again, again, I am not arguing. Just I think we should discuss everythi=
ng
if we are going to add the new feature.



=46inally. I am not sure this is really better, but it seems we can
can ->has_child_subreape "more correct" with the same effect.

	- prctl(PR_SET_CHILD_SUBREAPER):

		me->is_child_subreaper =3D !!arg2;
		// ->has_child_subreaper is not set

	- copy_signal():

		me->has_child_subreaper =3D
			parent->has_child_subreaper ||
			parent->is_child_subreaper;

Oleg.

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
