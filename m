From: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Subject: Re: + prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
 .patch added to -mm tree
Date: Wed, 17 Aug 2011 22:56:29 +0200
Message-ID: <CAPXgP12+zL=RNgCksCGuOCBKEFiTQvemBM3tqwS4ndH9x88nGA@mail.gmail.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
 <20110817115543.GA8745@redhat.com> <CAPXgP12rYf2HmmsJAuJw=nrtcjTRR1WzDhLNM47eKhKA1UTfJQ@mail.gmail.com>
 <20110817134516.GA14136@redhat.com> <CAPXgP101N_GESzpqu=P_H8cLoekMzb2_W2eWyAqATSjm4Gj9CA@mail.gmail.com>
 <20110817162041.GA21406@redhat.com> <CAPXgP13Dn2c-OnYg-Cty5r4JbqeH_zYPtXDj5GAfK1btoKYmDg@mail.gmail.com>
 <20110817185709.GA27663@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110817185709.GA27663-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Aug 17, 2011 at 20:57, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 08/17, Kay Sievers wrote:
>> Async notifications like
>> taskstats just can not provide what SIGCHLD, /proc and wait() offer.
>
> Why not? Async notifications can't delay the reaping, yes. But I am
> not sure /proc/ is that useful when the task exits. OK, I won't argue=
=2E

I guess parents usually prefer to pick up their children themselves
that ran away from home, instead of getting calls from somebody else
telling them that they already took care of everything. :)

The most prominent issue with async messages is the re-use of the same
keys/ids they carry, during the window the event happened and the
async message is received. If we reap PIDs ourselves, the PID is
pinned until we take care of it, it can not be another process be
created in the meantime with the same PID.

>> > Once again, if pid_ns->child_reaper exits, you should
>> > not even try to find the sub-reaper in its parents chain.
>>
>> That would mean we can never run a sub-init in a pid namespace? Why =
not?
>>
>> Or do you mean that we *are* already the pid_ns->child_reaper, not
>> that one *exists*?
>
> I already got lost a bit, not sure I understand.
> I meant we *are* (the caller) the exiting pid_ns->child_reaper thread=
=2E

Right, that's what I meant. And what can be avoided if we move the
parent walk below the current check.

>> > In this case we should kill the children, not reparent them. Or pa=
nic
>> > if it is the global init (see above).
>> >
>> > See?
>>
>> Not sure. You mean that the lookup for a possible task->cild_reaper
>> should be _before_ the check for pid_ns->child_reaper =3D=3D father =
which
>> is currently below?
>
> Hmm. I am even more confused.

Yeah, sorry, it sounds confusing, but I think we arrived now for that
specific part. :)

> So. I actually applied your patch. The code is
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for (reaper =3D father->parent;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reaper !=3D &init_task && r=
eaper !=3D pid_ns->child_reaper;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reaper =3D reaper->parent)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (reaper->ch=
ild_reaper)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return reaper;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(pid_ns->child_reaper =3D=3D f=
ather)) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...
>
> The lookup is already _before_ the check for pid_ns->child_reaper =3D=
=3D father,
> what do you mean?

Yeah, it is before, but should be after.

> And, ignoring the mt problems I mentioned, I mean we should do
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pid_ns->child_reaper =3D=3D father) {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panic_or_kill_=
this_namespace; =C2=A0 // the current code
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (reaper =3D=
 father->parent;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 reaper !=3D pid_ns->child_reaper;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 reaper =3D reaper->parent)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (reaper->child_reaper)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return reaper;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}

Yeah, clear now, it looks better to keep it in that order.

Thanks,
Kay
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
