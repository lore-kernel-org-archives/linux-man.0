From: Kay Sievers <kay.sievers-tD+1rO4QERM@public.gmane.org>
Subject: Re: + prctl-add-pr_setget_child_reaper-to-allow-simple-process-supervision
 .patch added to -mm tree
Date: Wed, 17 Aug 2011 15:21:28 +0200
Message-ID: <CAPXgP10A4rcQLht--h1d3PJE=oOrm=MSjGXTUSKVF+ssnkt_gw@mail.gmail.com>
References: <201108162011.p7GKBcY0023134@imap1.linux-foundation.org>
 <20110817115543.GA8745@redhat.com> <20110817130531.GA12204@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110817130531.GA12204-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, roland-/Z5OmTQCD9xF6kxbq+BtvQ@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Wed, Aug 17, 2011 at 15:05, Oleg Nesterov <oleg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> On 08/17, Oleg Nesterov wrote:
>> On 08/16, Andrew Morton wrote:
>> > From: Lennart Poettering <lennart-mdGvqq1h2p+GdvJs77BJ7Q@public.gmane.org>
>> >
>> > Userspace service managers/supervisors need to track their started
>> > services. =C2=A0Many services daemonize by double-forking and get =
implicitely
>> > re-parented to PID 1. =C2=A0The process manager will no longer be =
able to
>> > receive the SIGCHLD signals for them.
>> >
>> > With this prctl, a service manager can mark itself as a sort of 's=
ub-init'
>> > process, able to stay as the parent process for all processes crea=
ted by
>> > the started services. =C2=A0All SIGCHLD signals will be delivered =
to the
>> > service manager.
>>
>> I try to never argue with the new features. But to be honest, this
>> doesn't look very good to me.
>>
>> OK, a service manager M does prctl(PR_SET_CHILD_REAPER), then it for=
ks
>> a service X which forks another child C and exits. Then C exits and
>> notifies M.
>>
>> But. How can M know that the service X should be restarted? It only
>> knows the pid. What if wait(WEXITED) succeeds because C in turn does
>> fork + exit? What M has 2 or more services?
>
> Also. I am almost sure I have already reviewed a very similar patch
> a long ago.

It's almost the same.

> Ungortunately, I can't find the previous discussion, and
> I can't recall why that patch was not accepted.

We've just been busy with other things. But now that systemd will not
only be PID 1 but also the process parent for every user logged into
the system, we need this functionality.

> But, I seem to remember, that patch cleared ->child_reaper on exec,

I don't think he original patch did.

> I think this makes sense.

Why would it? Systemd can serialize its state and properly re-exec
itself as many times as needed during its lifetime. Why would the
kernel take something away from a process, which it explicitly asked
for?

> And I am not sure about security. No, I do not see any problems, just
> I don't know. Say, should we check the creds during reparenting? I
> dunno.

Hmm, I don't see why that would be necessary. It's just one of our
parents that aks for our signals.

Kay
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
